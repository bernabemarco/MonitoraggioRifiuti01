
CREATE PROCEDURE [dbo].[GEM_METSIC_TO_INTERSCAMBIO] AS
BEGIN
	DECLARE @CONTARAPPORTI		decimal(10,0)
	DECLARE @IDRAPPORTO			varchar(14)
	DECLARE @AZRIF				varchar(3)	
	DECLARE @RifRecord			varchar(50)
	DECLARE @Oggetto			varchar(100)
	DECLARE @TipoOperazione		varchar(1)	
	DECLARE @ErrorMessage		varchar(5000)
	DECLARE @MaxProg			decimal(10,0)
	DECLARE @Progressivo		decimal(10,0)
	DECLARE @Stato				varchar(1)
	DECLARE @DataSync			datetime
	DECLARE @LastDataSync		datetime
	DECLARE @TabellaSync		varchar(50)	
	DECLARE @DoProcess			bit
	
	select @AZRIF = IdSocieta
	from GEM_TabParametriAziendaGemma
	
	SET @TabellaSync = 'GEM_SedeToPalmare'
	SET @DataSync = GETDATE()
	
	SET @LastDataSync = (SELECT ISNULL((SELECT MAX(DATASYNC) 
		FROM GEM_ParametriSync
		WHERE TABELLASYNC = @TabellaSync),'01/01/1900'))
	
	-- RAPPORTI
	DECLARE My_Cursor CURSOR SCROLL
	FOR
	SELECT A.RifRecord, A.Oggetto, A.TipoOperazione
	FROM GEM_SedeToPalmare as A
    join GEM_SEZIONECONTRATTORAPPORTI as B 
			on B.IDRAPPORTO = A.RifRecord COLLATE Latin1_General_CI_AS and B.STATO = 'T' and B.AzRif = @AZRIF -- solo rapporti a stato "T"
    left join GemmaSync..GEM_SEZIONECONTRATTORAPPORTI as C 
			on C.IDRapporto = RifRecord COLLATE Latin1_General_CI_AS and C.Stato <> 'N' and C.AzRif = @AZRIF -- escludo i rapporti annullati così da considerare il rapporto come nuovo
	WHERE A.DataModifica BETWEEN @LastDataSync AND @DataSync 
	AND A.TipoOperazione IN ('I','U')
    and isnull(C.Stato, 'T') = 'T' -- fino a quando non capiremo come sistemare trigger che adesso scatta anche per i rapporti già a stato >= "T"
	GROUP BY A.RifRecord, A.Oggetto, A.TipoOperazione
	ORDER BY A.TipoOperazione
	OPEN My_Cursor
	FETCH FIRST FROM My_Cursor

	INTO @RifRecord,@Oggetto,@TipoOperazione

	WHILE @@FETCH_STATUS = 0 

	BEGIN 
		BEGIN TRY		
		   
			BEGIN TRAN
			
				SET @DoProcess=1
				SET @MaxProg = (SELECT ISNULL((SELECT MAX(PROGRESSIVO) 
					FROM GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTI 
					WHERE IDRAPPORTO = @RifRecord AND AZRIF = @AZRIF),0))

				If @MaxProg = 0
				BEGIN
					SET @Progressivo = 1
					SET @Stato = ''
				END
				ELSE
				BEGIN
					SET @Stato = (SELECT STATO FROM GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTI
						WHERE IDRAPPORTO = @RifRecord AND AZRIF = @AZRIF
						AND PROGRESSIVO = @MaxProg)
					SET @Progressivo = @MaxProg + 1
					
					IF @Stato = 'T'
						SET @Progressivo = @MaxProg
					ELSE
						BEGIN
							IF @Stato <> 'N'
								SET @DoProcess = 0
						END										
				END

				IF @DoProcess=1
				BEGIN				
					EXEC GEM_METSIC_TO_INT_SEZIONECONTRATTORAPPORTI @RifRecord,@TipoOperazione,@Progressivo,@Stato
					
					EXEC GEM_METSIC_TO_INT_SEZIONECONTRATTORAPPORTI_Materiali @RifRecord,@TipoOperazione,@Progressivo,@Stato
					
					EXEC GEM_METSIC_TO_INT_SEZIONECONTRATTORAPPORTI_OreLavoro @RifRecord,@TipoOperazione,@Progressivo,@Stato
					
					EXEC GEM_METSIC_TO_INT_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE @RifRecord,@TipoOperazione,@Progressivo,@Stato
					
					EXEC GEM_METSIC_TO_INT_SEZIONECONTRATTORAPPORTIMEZZI @RifRecord,@TipoOperazione,@Progressivo,@Stato
					
					EXEC GEM_METSIC_TO_INT_SEZIONI_Componenti @RifRecord,@TipoOperazione,@Progressivo,@Stato

					EXEC GEM_METSIC_TO_INT_GEM_RAPPORTI_DocumentiCollegati @RifRecord,@TipoOperazione,@Progressivo,@Stato

					EXEC GEM_METSIC_TO_INT_GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati @RifRecord,@TipoOperazione,@Progressivo,@Stato
					
					EXEC GEM_METSIC_TO_INT_GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie @RifRecord,@TipoOperazione,@Progressivo,@Stato
				END
				
				UPDATE GEM_SEZIONECONTRATTORAPPORTI SET AZRIF = @AZRIF WHERE IDRAPPORTO = @RifRecord AND AZRIF IS NULL
--				UPDATE GEM_SEZIONECONTRATTORAPPORTI SET STATO = 'T' WHERE IDRAPPORTO = @RifRecord
				
			COMMIT TRAN
		
		END TRY

		BEGIN CATCH
			
			SET @ErrorMessage = ERROR_MESSAGE() + ':' + @RifRecord + ':' + Convert(varchar(20),@Progressivo)

			ROLLBACK TRAN
			
			IF ERROR_NUMBER() <> 0			
				INSERT INTO GEM_Log_Syncro (Note) VALUES (@ErrorMessage);
			
		END	CATCH	

		FETCH NEXT FROM My_Cursor
		INTO @RifRecord,@Oggetto,@TipoOperazione
	END
	
	-- inserisco nella tabella dei parametri sincronizzazione
	-- l'ultima data di riferimento
	INSERT INTO GEM_ParametriSync 
	(DATASYNC,TABELLASYNC) VALUES (@DataSync,@TabellaSync)

	CLOSE My_Cursor
	DEALLOCATE My_Cursor
		
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_METSIC_TO_INTERSCAMBIO] TO [Metodo98]
    AS [dbo];

