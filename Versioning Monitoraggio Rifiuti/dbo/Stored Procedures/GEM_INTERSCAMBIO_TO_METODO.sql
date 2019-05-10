
CREATE PROCEDURE [dbo].[GEM_INTERSCAMBIO_TO_METODO] (@AZRIF as varchar(3), @TotElaborati int OUTPUT, @TotElaboratiCT int OUTPUT, @TotElaboratiBG int OUTPUT) AS
BEGIN
	DECLARE @CONTARAPPORTI		int
	DECLARE @STATO_ELABORATI	varchar(1)
	DECLARE @STATO_NULLI		varchar(1)		
	DECLARE @IDRAPPORTO			varchar(14)
	DECLARE @BIGCUSTOMER		varchar(1)
	DECLARE @CAMBIO_TECNICO		varchar(1)
	DECLARE @STATO_LETTI		varchar(1)	
	DECLARE @Progressivo		decimal(10,0)
	DECLARE @StatoEffettivo		varchar(10)
	DECLARE @IDMessaggio		int
	DECLARE @IDMessaggioRiga	int
	DECLARE @ErrorMessage		varchar(5000)
		
	SET @STATO_ELABORATI = 'E'
	SET @STATO_NULLI = 'N'
	SET @STATO_LETTI = 'R'	
	SET @TotElaborati = 0
	SET @TotElaboratiBG = 0
	SET @TotElaboratiCT = 0

	-- BEGIN inserisco testa messaggio
	set @IDMessaggio = isnull((select max(Progressivo) from GEM_LogProcesso5), 0)
	set @IDMessaggio = @IDMessaggio + 1
	set @IDMessaggioRiga = 0

	INSERT INTO GEM_LogProcesso5
	(
		Progressivo,
		DATALANCIO,
		Descrizione,
		UTENTEMODIFICA,
		DATAMODIFICA
	)
	select @IDMessaggio,
           getdate(),
           'Processo 5',
           user_name(),
           getdate()
	-- END inserisco testa messaggio

	-- RAPPORTI ESCLUSI. Carico una tabella temporanea con i Rapporti che dovrebbero essere aggiornati, ma che in Metodo hanno stati diversi da T e R. Questi li escludo
	SELECT A.IDRAPPORTO
	into #TmpRapportiEsclusi
	FROM GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTI as A
    join GEM_SEZIONECONTRATTORAPPORTI as B on B.IDRAPPORTO = A.IDRAPPORTO COLLATE Latin1_General_CI_AS
	WHERE ((A.STATO_SYNC = @STATO_ELABORATI OR A.STATO_SYNC = @STATO_NULLI OR A.STATO_SYNC = @STATO_LETTI) OR (A.CAMBIO_TECNICO = 'S')) 
	  AND A.AZRIF = @AZRIF
      and B.Stato not in ('T', 'R')
    GROUP BY A.IDRAPPORTO

	-- RAPPORTI
	DECLARE My_Cursor CURSOR SCROLL
	FOR
	SELECT A.IDRAPPORTO,
           COUNT(*),
           ISNULL(A.BIGCUSTOMER,'N'),
           A.CAMBIO_TECNICO,
           max(A.PROGRESSIVO) as Progressivo
	FROM GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTI as A
    left join #TmpRapportiEsclusi as B on B.IDRAPPORTO = A.IDRAPPORTO
	WHERE ((A.STATO_SYNC = @STATO_ELABORATI OR A.STATO_SYNC = @STATO_NULLI OR A.STATO_SYNC = @STATO_LETTI) OR (A.CAMBIO_TECNICO = 'S')) 
	  AND A.AZRIF = @AZRIF 
      AND B.IDRAPPORTO is null -- solo quelli non presenti negli esclusi
    GROUP BY A.IDRAPPORTO, A.BIGCUSTOMER, A.CAMBIO_TECNICO, A.PROGRESSIVO
	
	OPEN My_Cursor
	FETCH FIRST FROM My_Cursor

	INTO @IDRAPPORTO,@CONTARAPPORTI,@BIGCUSTOMER,@CAMBIO_TECNICO,@Progressivo

		WHILE @@FETCH_STATUS = 0 
	BEGIN 
		-- se c'è più di un rapporto con lo stato E, segnalo anomalia e passo oltre
		IF @CONTARAPPORTI > 1 AND @CAMBIO_TECNICO <> 'S'
		BEGIN
			INSERT INTO GEM_Log_Syncro (Note) VALUES ('Presente più di un rapporto con stato E o N: ' + @IDRAPPORTO)
		END
		ELSE
		BEGIN

			BEGIN TRY
				
				BEGIN TRAN

					IF @CAMBIO_TECNICO = 'S'
					BEGIN
						
						EXEC GEM_INT_TO_MET_CAMBIO_TECNICO @AZRIF,@IDRAPPORTO,@Progressivo

						-- BEGIN inserisco riga messaggio
						set @IDMessaggioRiga = @IDMessaggioRiga + 1

						INSERT INTO GEM_LogProcesso5Righe
						(
							IdTesta,
							IdRiga,
							Descrizione,
							UTENTEMODIFICA,
							DATAMODIFICA
						)
						select @IDMessaggio,
							   @IDMessaggioRiga,
							   'Cambio Tecnico Rapporto/Progressivo: ' + @IDRAPPORTO +'/' + convert(varchar(2), @Progressivo) + ' Ditta: ' + @AZRIF,
							   user_name(),
							   getdate()
						-- END inserisco riga messaggio
					
						SET @TotElaboratiCT = @TotElaboratiCT + 1	
					END		

					IF @BIGCUSTOMER <> '1'
					BEGIN
						set @StatoEffettivo = ''

						select @StatoEffettivo = Stato_Sync
						FROM GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTI
						where IdRapporto = @IDRAPPORTO
                          and Progressivo = @Progressivo
                          and AzRif = @AZRIF

						EXEC GEM_INT_TO_MET_SEZIONECONTRATTORAPPORTI @AZRIF,@IDRAPPORTO,@Progressivo
						
						EXEC GEM_INT_TO_MET_SEZIONECONTRATTORAPPORTI_Materiali @AZRIF,@IDRAPPORTO,@Progressivo
				
						EXEC GEM_INT_TO_MET_SEZIONECONTRATTORAPPORTI_OreLavoro @AZRIF,@IDRAPPORTO,@Progressivo

						EXEC GEM_INT_TO_MET_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE @AZRIF,@IDRAPPORTO,@Progressivo

						EXEC GEM_INT_TO_MET_SEZIONECONTRATTORAPPORTIMEZZI @AZRIF,@IDRAPPORTO,@Progressivo

						EXEC GEM_INT_TO_MET_SEZIONI_Componenti @AZRIF,@IDRAPPORTO,@Progressivo
						
						EXEC GEM_INT_TO_MET_GEM_RAPPORTI_DocumentiCollegati @AZRIF,@IDRAPPORTO,@Progressivo

						EXEC GEM_INT_TO_MET_GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati @AZRIF,@IDRAPPORTO,@Progressivo
						
						EXEC GEM_INT_TO_MET_GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie @AZRIF,@IDRAPPORTO,@Progressivo

						if @StatoEffettivo = 'E' BEGIN
							-- BEGIN inserisco riga messaggio
							set @IDMessaggioRiga = @IDMessaggioRiga + 1

							INSERT INTO GEM_LogProcesso5Righe
							(
								IdTesta,
								IdRiga,
								Descrizione,
								UTENTEMODIFICA,
								DATAMODIFICA
							)
							select @IDMessaggio,
								   @IDMessaggioRiga,
								   'Elaborato Rapporto/Progressivo: ' + @IDRAPPORTO +'/' + convert(varchar(2), @Progressivo) + ' Ditta: ' + @AZRIF,
								   user_name(),
								   getdate()
							-- END inserisco riga messaggio

							SET @TotElaborati = @TotElaborati + 1
						END
					END
					ELSE
					BEGIN
						
						-- procedura per gestire bigcustomer
						EXEC GEM_INT_TO_MET_BIGCUSTOMER @AZRIF,@IDRAPPORTO,@Progressivo

						-- BEGIN inserisco riga messaggio
						set @IDMessaggioRiga = @IDMessaggioRiga + 1

						INSERT INTO GEM_LogProcesso5Righe
						(
							IdTesta,
							IdRiga,
							Descrizione,
							UTENTEMODIFICA,
							DATAMODIFICA
						)
						select @IDMessaggio,
							   @IDMessaggioRiga,
							   'Elaborato Big Customer/Progressivo: ' + @IDRAPPORTO +'/' + convert(varchar(2), @Progressivo) + ' Ditta: ' + @AZRIF,
							   user_name(),
							   getdate()
						-- END inserisco riga messaggio

						SET @TotElaboratiBG = @TotElaboratiBG + 1	
					END
					
					-- dopo avert trasferito i dati li metto in stato processato
					UPDATE GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTI
					SET STATO_SYNC = 'P' 
                    WHERE IDRAPPORTO = @IDRAPPORTO
					  AND AZRIF = @AZRIF
                      AND Progressivo = @Progressivo

				COMMIT TRAN

			END TRY

			BEGIN CATCH

				SET @ErrorMessage = ERROR_MESSAGE() + ':' + @IDRAPPORTO + ':' + @AZRIF

				ROLLBACK TRAN
				
				IF ERROR_NUMBER() <> 0			
					INSERT INTO GEM_Log_Syncro (Note) VALUES (@ErrorMessage);

			END CATCH
		
		END

		FETCH NEXT FROM My_Cursor
		INTO @IDRAPPORTO,@CONTARAPPORTI,@BIGCUSTOMER,@CAMBIO_TECNICO,@Progressivo
	END

	CLOSE My_Cursor
	DEALLOCATE My_Cursor

	drop table #TmpRapportiEsclusi
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_INTERSCAMBIO_TO_METODO] TO [Metodo98]
    AS [dbo];

