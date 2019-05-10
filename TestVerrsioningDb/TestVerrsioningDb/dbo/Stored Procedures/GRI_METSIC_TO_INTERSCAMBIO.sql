
CREATE PROCEDURE [dbo].[GRI_METSIC_TO_INTERSCAMBIO] AS BEGIN
	DECLARE @CONTARAPPORTI	decimal(10,0)
	DECLARE @IDRAPPORTO			VARCHAR(14)
	DECLARE @AZRIF					VARCHAR(3)	
	DECLARE @RifRecord			VARCHAR(50)
	DECLARE @Oggetto				VARCHAR(100)
	DECLARE @TipoOperazione	VARCHAR(1)	
	DECLARE @ErrorMessage		VARCHAR(5000)
	DECLARE @MaxProg				decimal(10,0)
	DECLARE @Progressivo		decimal(10,0)
	DECLARE @Stato					VARCHAR(1)
	DECLARE @DataSync				datetime
	DECLARE @LastDataSync		datetime
	DECLARE @TabellaSync		VARCHAR(50)	
	DECLARE @DoProcess			bit
		
	SET @TabellaSync = 'GRI_SedeToTablet'
	SET @DataSync = GETDATE()
	
	SET @LastDataSync = (SELECT ISNULL((SELECT MAX(DATASYNC) 
		FROM GEM_ParametriSync
		WHERE TABELLASYNC = @TabellaSync),'01/01/1900'))
	
	-- RAPPORTI INTERVENTO
	DECLARE My_Cursor CURSOR SCROLL	FOR
		SELECT TR.IdSocieta, A.RifRecord, A.Oggetto, A.TipoOperazione
		FROM GRI_SedeToTablet AS A
		JOIN GRI_RAPPORTI AS RI ON RI.IDRAPPORTO = A.RifRecord COLLATE Latin1_General_CI_AS AND RI.STATO = 'T' -- solo rapporti a stato "T"
		LEFT OUTER JOIN GRI_TIPOLOGIARAPPORTO TR ON TR.IdTipoRapporto=RI.IdTipoRapporto
		LEFT JOIN GemmaSync..GRI_RAPPORTI AS C ON C.IDRapporto = RifRecord COLLATE Latin1_General_CI_AS AND C.Stato <> 'N' AND C.AzRif = TR.IdSocieta COLLATE Latin1_General_CI_AS -- escludo i rapporti annullati così da considerare il rapporto come nuovo
		WHERE A.DataModifica BETWEEN @LastDataSync AND @DataSync 
		AND A.TipoOperazione IN ('I','U')
		AND ISNULL(C.Stato, 'T') = 'T' -- fino a quando non capiremo come sistemare trigger che adesso scatta anche per i rapporti già a stato >= "T"
		GROUP BY TR.IdSocieta, A.RifRecord, A.Oggetto, A.TipoOperazione
		ORDER BY TR.IdSocieta, A.TipoOperazione

	OPEN My_Cursor
		FETCH NEXT FROM My_Cursor INTO @AZRIF, @RifRecord,@Oggetto,@TipoOperazione

		WHILE @@FETCH_STATUS = 0 BEGIN 
			
			BEGIN TRY		

				BEGIN TRAN
				
					SET @DoProcess=1
					SELECT @MaxProg=ISNULL((SELECT MAX(PROGRESSIVO) 
					FROM GemmaSync.dbo.GRI_RAPPORTI 
					WHERE IDRAPPORTO = @RifRecord AND AZRIF = @AZRIF),0)
					
					If @MaxProg = 0
						BEGIN
							SET @Progressivo = 1
							SET @Stato = ''
						END
					ELSE
						BEGIN
							SELECT @Stato=STATO
							FROM GemmaSync.dbo.GRI_RAPPORTI
							WHERE IDRAPPORTO = @RifRecord AND AZRIF = @AZRIF
								AND PROGRESSIVO = @MaxProg
							
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
									
						EXEC GRI_METSIC_TO_INT_RAPPORTI @RifRecord,@TipoOperazione,@Progressivo,@Stato
						
						EXEC GRI_METSIC_TO_INT_RAPPORTI_DocumentiCollegati @RifRecord,@TipoOperazione,@Progressivo,@Stato			
						
						EXEC GRI_METSIC_TO_INT_RAPPORTI_Materiali @RifRecord,@TipoOperazione,@Progressivo,@Stato
						
						EXEC GRI_METSIC_TO_INT_RAPPORTI_OreLavoro @RifRecord,@TipoOperazione,@Progressivo,@Stato
						
						EXEC GRI_METSIC_TO_INT_RAPPORTI_OreLavoroInterno @RifRecord,@TipoOperazione,@Progressivo,@Stato
						
						EXEC GRI_METSIC_TO_INT_RAPPORTI_Mezzi @RifRecord,@TipoOperazione,@Progressivo,@Stato

						EXEC GRI_METSIC_TO_INT_RAPPORTI_MezziAllegati @RifRecord,@TipoOperazione,@Progressivo,@Stato			
						
						EXEC GRI_METSIC_TO_INT_RAPPORTI_MezziCheckList @RifRecord,@TipoOperazione,@Progressivo,@Stato			
						
						EXEC GRI_METSIC_TO_INT_RAPPORTI_Componenti @RifRecord,@TipoOperazione,@Progressivo,@Stato
						
						EXEC GRI_METSIC_TO_INT_RAPPORTI_ServiziAccessori @RifRecord,@TipoOperazione,@Progressivo,@Stato
						
						EXEC GRI_METSIC_TO_INT_RAPPORTIMEZZI_Anomalie @RifRecord,@TipoOperazione,@Progressivo,@Stato
						
					END
					
					UPDATE GRI_RAPPORTI SET AZRIF = @AZRIF WHERE IDRAPPORTO = @RifRecord AND AZRIF IS NULL
					
				COMMIT TRAN
			
			END TRY

			BEGIN CATCH
				
				SET @ErrorMessage = ERROR_MESSAGE() + ':' + @RifRecord + ':' + Convert(VARCHAR(20),@Progressivo)

				ROLLBACK TRAN
				
				IF ERROR_NUMBER() <> 0			
					INSERT INTO GRI_Log_Syncro (Note) VALUES (@ErrorMessage);
				
			END	CATCH	

			FETCH NEXT FROM My_Cursor INTO @AZRIF,@RifRecord,@Oggetto,@TipoOperazione
		END	-- WHILE
		
		-- inserisco nella tabella dei parametri sincronizzazione l'ultima data di riferimento
		INSERT INTO GEM_ParametriSync (DATASYNC,TABELLASYNC) VALUES (@DataSync,@TabellaSync)

	CLOSE My_Cursor
	DEALLOCATE My_Cursor	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_METSIC_TO_INTERSCAMBIO] TO [Metodo98]
    AS [dbo];

