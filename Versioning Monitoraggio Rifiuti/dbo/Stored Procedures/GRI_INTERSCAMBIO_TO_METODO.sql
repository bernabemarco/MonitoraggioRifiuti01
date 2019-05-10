
CREATE PROCEDURE [dbo].[GRI_INTERSCAMBIO_TO_METODO] (@TotElaborati INT OUTPUT, @TotElaboratiCT INT OUTPUT) AS
BEGIN
	DECLARE @AZRIF 						VARCHAR(3)
	DECLARE @CONTARAPPORTI		INT
	DECLARE @STATO_ELABORATI	VARCHAR(1)
	DECLARE @STATO_NULLI			VARCHAR(1)		
	DECLARE @IDRAPPORTO				VARCHAR(14)
	DECLARE @BIGCUSTOMER			VARCHAR(1)
	DECLARE @CAMBIO_TECNICO		VARCHAR(1)
	DECLARE @STATO_LETTI			VARCHAR(1)	
	DECLARE @Progressivo			DECIMAL(10,0)
	DECLARE @StatoEffettivo		VARCHAR(10)
	DECLARE @IDMessaggio			INT
	DECLARE @IDMessaggioRiga	INT
	DECLARE @ErrorMessage			VARCHAR(5000)
		
	SET @TotElaborati = 0
	SET @TotElaboratiCT = 0

	-- BEGIN inserisco testa messaggio
	SET @IDMessaggio = ISNULL((SELECT MAX(Progressivo) FROM GRI_LogProcesso5), 0)
	SET @IDMessaggio = @IDMessaggio + 1
	SET @IDMessaggioRiga = 0

	INSERT INTO GRI_LogProcesso5
	(
		Progressivo,
		DATALANCIO,
		Descrizione,
		UTENTEMODIFICA,
		DATAMODIFICA
	)
	SELECT @IDMessaggio,
      GETDATE(),
      'GRI - Processo 5',
      user_name(),
      GETDATE()
	-- END inserisco testa messaggio

	-- RAPPORTI ESCLUSI. Carico una tabella temporanea con i Rapporti che dovrebbero essere aggiornati, ma che in Metodo hanno stati diversi da T e R. Questi li escludo
	SET @STATO_ELABORATI = 'E'
	SET @STATO_NULLI = 'N'
	SET @STATO_LETTI = 'R'	
	
	SELECT TR.IDSocieta, A.IDRAPPORTO
	INTO #TmpRapportiEsclusi
	FROM GemmaSync.dbo.GRI_RAPPORTI AS A
  JOIN GRI_RAPPORTI AS B ON B.IDRAPPORTO = A.IDRAPPORTO COLLATE Latin1_General_CI_AS
	JOIN GRI_TIPOLOGIARAPPORTO TR ON TR.IdTipoRapporto=A.IdTipoRapporto
	WHERE ((A.STATO_SYNC = @STATO_ELABORATI OR A.STATO_SYNC = @STATO_NULLI OR A.STATO_SYNC = @STATO_LETTI) OR (A.CAMBIO_TECNICO = 'S')) 
  AND B.Stato NOT IN ('T', 'R')
 GROUP BY TR.IDSocieta, A.IDRAPPORTO

	-- RAPPORTI INTERVENTO
	DECLARE My_Cursor CURSOR SCROLL	FOR
		SELECT 	TR.IDSocieta, 
						A.IDRAPPORTO,
						COUNT(*),
						ISNULL(A.BIGCUSTOMER,'N'),
						A.CAMBIO_TECNICO,
						MAX(A.PROGRESSIVO) AS Progressivo
		FROM GemmaSync.dbo.GRI_RAPPORTI AS A
		JOIN GRI_TIPOLOGIARAPPORTO TR ON TR.IdTipoRapporto=A.IdTipoRapporto
		LEFT JOIN #TmpRapportiEsclusi AS B ON B.IDRAPPORTO = A.IDRAPPORTO
		WHERE ((A.STATO_SYNC = @STATO_ELABORATI OR A.STATO_SYNC = @STATO_NULLI OR A.STATO_SYNC = @STATO_LETTI) OR (A.CAMBIO_TECNICO = 'S')) 
			AND B.IDRAPPORTO IS NULL -- solo quelli non presenti negli esclusi
		GROUP BY TR.IDSocieta, A.IDRAPPORTO, A.BIGCUSTOMER, A.CAMBIO_TECNICO, A.PROGRESSIVO
	
	OPEN My_Cursor
		FETCH NEXT FROM My_Cursor INTO @AZRIF, @IDRAPPORTO, @CONTARAPPORTI, @BIGCUSTOMER, @CAMBIO_TECNICO, @Progressivo
		
		WHILE @@FETCH_STATUS = 0 
		BEGIN 

			-- se c'è più di un rapporto con lo stato E, segnalo anomalia e passo oltre
			IF @CONTARAPPORTI > 1 AND @CAMBIO_TECNICO <> 'S'
			BEGIN
				INSERT INTO GRI_Log_Syncro (Note) VALUES ('GRI - Presente più di un rapporto con stato E o N: ' + @IDRAPPORTO)
			END
			ELSE
			BEGIN

				BEGIN TRY
					
					BEGIN TRAN

						IF @CAMBIO_TECNICO = 'S'
						BEGIN
							
							EXEC GRI_INT_TO_MET_CAMBIO_TECNICO @AZRIF, @IDRAPPORTO, @Progressivo

							-- BEGIN inserisco riga messaggio
							SET @IDMessaggioRiga = @IDMessaggioRiga + 1

							INSERT INTO GRI_LogProcesso5Righe
							(
								IdTesta,
								IdRiga,
								Descrizione,
								UTENTEMODIFICA,
								DATAMODIFICA
							)
							SELECT @IDMessaggio,
										 @IDMessaggioRiga,
										 'GRI - Cambio Tecnico Rapporto/Progressivo: ' + @IDRAPPORTO +'/' + CONVERT(VARCHAR(2), @Progressivo) + ' Ditta: ' + @AZRIF,
										 user_name(),
										 GETDATE()
							-- END inserisco riga messaggio
						
							SET @TotElaboratiCT = @TotElaboratiCT + 1	
						END		
									
						SET @StatoEffettivo = ''

						SELECT @StatoEffettivo = Stato_Sync FROM GemmaSync.dbo.GRI_RAPPORTI
						WHERE IdRapporto = @IDRAPPORTO
							AND Progressivo = @Progressivo
							AND AzRif = @AZRIF

						EXEC GRI_INT_TO_MET_RAPPORTI @AZRIF, @IDRAPPORTO, @Progressivo
						
						EXEC GRI_INT_TO_MET_RAPPORTI_Materiali @AZRIF, @IDRAPPORTO, @Progressivo
				
						EXEC GRI_INT_TO_MET_RAPPORTI_OreLavoro @AZRIF, @IDRAPPORTO, @Progressivo

						EXEC GRI_INT_TO_MET_RAPPORTI_OreLavoroInterno @AZRIF, @IDRAPPORTO, @Progressivo

						EXEC GRI_INT_TO_MET_RAPPORTI_Mezzi @AZRIF, @IDRAPPORTO, @Progressivo

						EXEC GRI_INT_TO_MET_RAPPORTI_Componenti @AZRIF, @IDRAPPORTO, @Progressivo
						
						EXEC GRI_INT_TO_MET_RAPPORTI_DocumentiCollegati @AZRIF, @IDRAPPORTO, @Progressivo
						
						EXEC GRI_INT_TO_MET_RAPPORTI_MezziAllegati @AZRIF, @IDRAPPORTO, @Progressivo
						
						EXEC GRI_INT_TO_MET_RAPPORTI_ServiziAccessori @AZRIF, @IDRAPPORTO, @Progressivo
						
						EXEC GRI_INT_TO_MET_RAPPORTIMEZZI_Anomalie @AZRIF, @IDRAPPORTO, @Progressivo						
					
						IF @StatoEffettivo = 'E'
						BEGIN
							-- BEGIN inserisco riga messaggio
							SET @IDMessaggioRiga = @IDMessaggioRiga + 1

							INSERT INTO GRI_LogProcesso5Righe
							(
								IdTesta,
								IdRiga,
								Descrizione,
								UTENTEMODIFICA,
								DATAMODIFICA
							)
							SELECT @IDMessaggio,
										 @IDMessaggioRiga,
										 'GRI - Elaborato Rapporto/Progressivo: ' + @IDRAPPORTO +'/' + CONVERT(VARCHAR(2), @Progressivo) + ' Ditta: ' + @AZRIF,
										 USER_NAME(),
										 GETDATE()
							-- END inserisco riga messaggio

							SET @TotElaborati = @TotElaborati + 1
						END
						
						-- dopo avert trasferito i dati li metto in stato processato
						UPDATE GemmaSync.dbo.GRI_RAPPORTI
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
						INSERT INTO GRI_Log_Syncro (Note) VALUES (@ErrorMessage);
						
				END CATCH
			
			END

			FETCH NEXT FROM My_Cursor INTO  @AZRIF, @IDRAPPORTO, @CONTARAPPORTI, @BIGCUSTOMER, @CAMBIO_TECNICO, @Progressivo
		END

	CLOSE My_Cursor
	DEALLOCATE My_Cursor

	DROP TABLE #TmpRapportiEsclusi
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_INTERSCAMBIO_TO_METODO] TO [Metodo98]
    AS [dbo];

