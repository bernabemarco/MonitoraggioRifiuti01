


CREATE PROCEDURE [dbo].[GEM_RAPPORTI_CONTROLLO_FATTURAZIONE] ( @IDRAPPORTO AS VARCHAR(14) ) 
AS
DECLARE @IDCONTRATTO			AS VARCHAR(14)
DECLARE @SEZIONECONTRATTO		AS DECIMAL(5,0)
DECLARE @IDRIGAMEZZO			AS DECIMAL(5,0)
DECLARE @DATA_EFF				AS DATETIME
DECLARE @IDRAPPORTOAGGREGATO	AS VARCHAR(14)

DECLARE @IdTipologMezzo			AS DECIMAL(5,0)
DECLARE @FLAGAT1				AS VARCHAR(1)
DECLARE @FLAGAT2				AS VARCHAR(1)
DECLARE @FLAGAT3				AS VARCHAR(1)
DECLARE @FLAGAT4				AS VARCHAR(1)
DECLARE @FLAGAT5				AS VARCHAR(1)
DECLARE @RIGAPOS				AS DECIMAL(5,0)
DECLARE @IDATTIVITA				AS DECIMAL(5,0)
DECLARE @nErrNum				AS DECIMAL(5,0)

DECLARE @ERRNO as int
DECLARE @ERRMSG as varchar(500)

DECLARE @IDRIGA				AS DECIMAL(5,0)

	BEGIN TRANSACTION 


SET @IDRIGA = 0


	--CANCELLO EVENTIALI RECORD ESISTENTI RELATIVI AL RAPPORTO
	DELETE [dbo].[GEM_SEZIONECONTRATTORAPPORTI_MEZZI_ATTIV_ESEG]
	WHERE IDRAPPORTO = @IDRAPPORTO


	--leggo la testa delle aggregazioni da fare
	DECLARE CURR_TESTE CURSOR  LOCAL  FAST_FORWARD FOR

		SELECT 
			scr.IDCONTRATTO,
			scr.SEZIONECONTRATTO,
			scrm.IDRIGAMEZZO,
			sc.IdTipologMezzo,
			scr.DATA_EFF,
			isnull(scr.IDRAPPORTOAGGREGATO,'') ,
			isnull(scrm.FLAGAT1,0),
			isnull(scrm.FLAGAT2,0),
			isnull(scrm.FLAGAT3,0),
			isnull(scrm.FLAGAT4,0),
			isnull(scrm.FLAGAT5,0)
		FROM dbo.GEM_SEZIONECONTRATTORAPPORTI scr inner join  dbo.GEM_SEZIONECONTRATTORAPPORTIMEZZI scrm  on scr.IDRAPPORTO = scrm.IDRAPPORTO
			inner join GEM_SEZIONICONTRATTO sc on scr.IDCONTRATTO = sc.IDCONTRATTO and sc.SEZIONECONTRATTO = scr.SEZIONECONTRATTO
		WHERE scr.IDRAPPORTO = @IDRAPPORTO


		OPEN CURR_TESTE
		FETCH NEXT FROM CURR_TESTE INTO  @IDCONTRATTO, @SEZIONECONTRATTO, @IDRIGAMEZZO, @IdTipologMezzo, @DATA_EFF, @IDRAPPORTOAGGREGATO, 
							@FLAGAT1, @FLAGAT2, @FLAGAT3, @FLAGAT4, @FLAGAT5

		WHILE @@FETCH_STATUS = 0
		BEGIN

			--SE ESEGUE L'ATTIVITA 1
			IF @FLAGAT1 = 'S' OR @FLAGAT1 = 1 BEGIN
				SET @RIGAPOS = 1

				-- leggo il codice idAttvita
				SELECT  @IDATTIVITA=IDATTIVITA
				FROM GEM_Vista_TipologMezziAttivita
				WHERE IDTIPOLOGMEZZO=@IdTipologMezzo
					AND POSIZIONE = @RIGAPOS 
				
				IF  @@Rowcount > 0 AND @IDATTIVITA > 0 BEGIN
					SET @IDRIGA = @IDRIGA + 1

					INSERT INTO [dbo].[GEM_SEZIONECONTRATTORAPPORTI_MEZZI_ATTIV_ESEG]
					   ([IDCONTRATTO]
					   ,[SEZIONECONTRATTO]
					   ,[IDRAPPORTO]
					   ,[IdRigaMezzo]
					   ,[idAttivita]
					   ,[idRiga]  -- POSIZIONE
					   ,[IDRAPPORTOAGGREGATO]
					   ,[DATA_EFF]
					   ,[STATO_FATTURAZIONE]
					   ,[UTENTEMODIFICA]
					   ,[DATAMODIFICA])

					 VALUES
					   (@IDCONTRATTO
					   ,@SEZIONECONTRATTO
					   ,@IDRAPPORTO
					   ,@IDRIGAMEZZO
					   ,@IDATTIVITA 
					   ,@IDRIGA 
					   ,@IDRAPPORTOAGGREGATO 
					   ,@DATA_EFF
					   ,'N'
					   ,USER_NAME()
					   ,GETDATE()
					)
					--Gestione Errore 1 transazione
					SET @nErrNum=@@ERROR
					IF @nErrNum<>0
					BEGIN		
						GOTO ERRORE
					END
				END
				ELSE BEGIN

					SET @ERRNO = cast(@RIGAPOS as int)
					RAISERROR
						(N'Rilevata Attività :%d, inesistente ',
						13, -- Severity.
						1, -- State.
						@ERRNO )

				END 
			END

			--SE ESEGUE L'ATTIVITA 2
			IF @FLAGAT2 = 'S' OR @FLAGAT2 = 1 BEGIN
				SET @RIGAPOS = 2

				-- leggo il codice idAttvita
				SELECT  @IDATTIVITA=IDATTIVITA
				FROM GEM_Vista_TipologMezziAttivita
				WHERE IDTIPOLOGMEZZO=@IDTIPOLOGMEZZO
					AND POSIZIONE = @RIGAPOS 

				IF  @@Rowcount > 0 AND @IDATTIVITA > 0 BEGIN				
					SET @IDRIGA = @IDRIGA + 1

					INSERT INTO [dbo].[GEM_SEZIONECONTRATTORAPPORTI_MEZZI_ATTIV_ESEG]
					   ([IDCONTRATTO]
					   ,[SEZIONECONTRATTO]
					   ,[IDRAPPORTO]
					   ,[IdRigaMezzo]
					   ,[idAttivita]
					   ,[idRiga]  -- POSIZIONE
					   ,[IDRAPPORTOAGGREGATO]
					   ,[DATA_EFF]
					   ,[STATO_FATTURAZIONE]
					   ,[UTENTEMODIFICA]
					   ,[DATAMODIFICA])

					 VALUES
					   (@IDCONTRATTO
					   ,@SEZIONECONTRATTO
					   ,@IDRAPPORTO
					   ,@IDRIGAMEZZO
					   ,@IDATTIVITA 
					   ,@IDRIGA 
					   ,@IDRAPPORTOAGGREGATO 
					   ,@DATA_EFF
					   ,'N'
					   ,USER_NAME()
					   ,GETDATE()
					)
				--Gestione Errore 1 transazione
					SET @nErrNum=@@ERROR
					IF @nErrNum<>0
					BEGIN		
						GOTO ERRORE
					END
				END
				ELSE BEGIN

					SET @ERRNO = cast(@RIGAPOS as int)
					RAISERROR
						(N'Rilevata Attività :%d, inesistente ',
						13, -- Severity.
						1, -- State.
						@ERRNO )

				END 
			END


			--SE ESEGUE L'ATTIVITA 3
			IF @FLAGAT3 = 'S' OR @FLAGAT3 = 1 BEGIN
				SET @RIGAPOS = 3

				-- leggo il codice idAttvita
				SELECT  @IDATTIVITA=IDATTIVITA
				FROM GEM_Vista_TipologMezziAttivita
				WHERE IDTIPOLOGMEZZO=@IDTIPOLOGMEZZO
					AND POSIZIONE = @RIGAPOS 
				
				IF  @@Rowcount > 0 AND @IDATTIVITA > 0 BEGIN				
					SET @IDRIGA = @IDRIGA + 1

					INSERT INTO [dbo].[GEM_SEZIONECONTRATTORAPPORTI_MEZZI_ATTIV_ESEG]
					   ([IDCONTRATTO]
					   ,[SEZIONECONTRATTO]
					   ,[IDRAPPORTO]
					   ,[IdRigaMezzo]
					   ,[idAttivita]
					   ,[idRiga]  -- POSIZIONE
					   ,[IDRAPPORTOAGGREGATO]
					   ,[DATA_EFF]
					   ,[STATO_FATTURAZIONE]
					   ,[UTENTEMODIFICA]
					   ,[DATAMODIFICA])

					 VALUES
					   (@IDCONTRATTO
					   ,@SEZIONECONTRATTO
					   ,@IDRAPPORTO
					   ,@IDRIGAMEZZO
					   ,@IDATTIVITA 
					   ,@IDRIGA 
					   ,@IDRAPPORTOAGGREGATO 
					   ,@DATA_EFF
					   ,'N'
					   ,USER_NAME()
					   ,GETDATE()
					)
				--Gestione Errore 1 transazione
					SET @nErrNum=@@ERROR
					IF @nErrNum<>0
					BEGIN		
						GOTO ERRORE
					END
				END
				ELSE BEGIN

					SET @ERRNO = cast(@RIGAPOS as int)
					RAISERROR
						(N'Rilevata Attività :%d, inesistente ',
						13, -- Severity.
						1, -- State.
						@ERRNO )

				END 
			END


			--SE ESEGUE L'ATTIVITA 4
			IF @FLAGAT4 = 'S' OR @FLAGAT4 = 1 BEGIN
				SET @RIGAPOS = 4

				-- leggo il codice idAttvita
				SELECT  @IDATTIVITA=IDATTIVITA
				FROM GEM_Vista_TipologMezziAttivita
				WHERE IDTIPOLOGMEZZO=@IDTIPOLOGMEZZO
					AND POSIZIONE = @RIGAPOS 
				
				IF  @@Rowcount > 0 AND @IDATTIVITA > 0 BEGIN				
					SET @IDRIGA = @IDRIGA + 1

					INSERT INTO [dbo].[GEM_SEZIONECONTRATTORAPPORTI_MEZZI_ATTIV_ESEG]
					   ([IDCONTRATTO]
					   ,[SEZIONECONTRATTO]
					   ,[IDRAPPORTO]
					   ,[IdRigaMezzo]
					   ,[idAttivita]
					   ,[idRiga]  -- POSIZIONE
					   ,[IDRAPPORTOAGGREGATO]
					   ,[DATA_EFF]
					   ,[STATO_FATTURAZIONE]
					   ,[UTENTEMODIFICA]
					   ,[DATAMODIFICA])

					 VALUES
					   (@IDCONTRATTO
					   ,@SEZIONECONTRATTO
					   ,@IDRAPPORTO
					   ,@IDRIGAMEZZO
					   ,@IDATTIVITA 
					   ,@IDRIGA 
					   ,@IDRAPPORTOAGGREGATO 
					   ,@DATA_EFF
					   ,'N'
					   ,USER_NAME()
					   ,GETDATE()
					)
				--Gestione Errore 1 transazione
					SET @nErrNum=@@ERROR
					IF @nErrNum<>0
					BEGIN		
						GOTO ERRORE
					END
				END
				ELSE BEGIN

					SET @ERRNO = cast(@RIGAPOS as int)
					RAISERROR
						(N'Rilevata Attività :%d, inesistente ',
						13, -- Severity.
						1, -- State.
						@ERRNO )

				END 
			END


			--SE ESEGUE L'ATTIVITA 5
			IF @FLAGAT5 = 'S' OR @FLAGAT5 = 1 BEGIN
				SET @RIGAPOS = 5

				-- leggo il codice idAttvita
				SELECT  @IDATTIVITA=IDATTIVITA
				FROM GEM_Vista_TipologMezziAttivita
				WHERE IDTIPOLOGMEZZO=@IDTIPOLOGMEZZO
					AND POSIZIONE = @RIGAPOS 


				IF  @@Rowcount > 0 AND @IDATTIVITA > 0 BEGIN								
					SET @IDRIGA = @IDRIGA + 1

					INSERT INTO [dbo].[GEM_SEZIONECONTRATTORAPPORTI_MEZZI_ATTIV_ESEG]
					   ([IDCONTRATTO]
					   ,[SEZIONECONTRATTO]
					   ,[IDRAPPORTO]
					   ,[IdRigaMezzo]
					   ,[idAttivita]
					   ,[idRiga]  -- POSIZIONE
					   ,[IDRAPPORTOAGGREGATO]
					   ,[DATA_EFF]
					   ,[STATO_FATTURAZIONE]
					   ,[UTENTEMODIFICA]
					   ,[DATAMODIFICA])

					 VALUES
					   (@IDCONTRATTO
					   ,@SEZIONECONTRATTO
					   ,@IDRAPPORTO
					   ,@IDRIGAMEZZO
					   ,@IDATTIVITA 
					   ,@IDRIGA 
					   ,@IDRAPPORTOAGGREGATO 
					   ,@DATA_EFF
					   ,'N'
					   ,USER_NAME()
					   ,GETDATE()
					)
					--Gestione Errore 1 transazione
					SET @nErrNum=@@ERROR
					IF @nErrNum<>0
					BEGIN		
						GOTO ERRORE
					END
				END
				ELSE BEGIN

					SET @ERRNO = cast(@RIGAPOS as int)
					RAISERROR
						(N'Rilevata Attività :%d, inesistente ',
						13, -- Severity.
						1, -- State.
						@ERRNO )

				END 
			END

			FETCH NEXT FROM CURR_TESTE INTO  @IDCONTRATTO, @SEZIONECONTRATTO, @IDRIGAMEZZO, @IdTipologMezzo, @DATA_EFF, @IDRAPPORTOAGGREGATO, 
							@FLAGAT1, @FLAGAT2, @FLAGAT3, @FLAGAT4, @FLAGAT5
		END

		CLOSE CURR_TESTE
		DEALLOCATE CURR_TESTE
		
		--Chiudo Transazione Main
		COMMIT TRANSACTION 
		SELECT 'OK' as RIS
		RETURN 0

			

ERRORE:
--Annullo Transazione Main
ROLLBACK TRANSACTION 
SELECT 'ERRORE' as RIS
RETURN @nErrNum

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_RAPPORTI_CONTROLLO_FATTURAZIONE] TO [Metodo98]
    AS [dbo];

