


CREATE PROCEDURE GEM_RAPPORTI_FATTURAZIONE_INS_TMP_ORE (@IDRAPPORTO AS VARCHAR(30), @IDSESSIONE AS INT)
AS

--questa procedura inserisce nella tanbelle Temporanea le Ore legate al rapporto
--per la loro successiva valorizzaizone da parte del processo 8 del flusso Rapporti

	DELETE [dbo].[GEM_TMP_OreLavoro_Valorizzate]
	WHERE IdRapporto=@IDRAPPORTO and IDSESSIONE = @IDSESSIONE 


	INSERT INTO [GEM_TMP_OreLavoro_Valorizzate]
           ([idSessione]
           ,[IDRAPPORTO]
           ,[idRiga]
           ,[CODART_OREORD]
           ,[PREZZO_OREORD]
           ,[SCONTO_OREORD]
           ,[PROVV1_OREORD]
           ,[PROVV2_OREORD]
           ,[PROVV3_OREORD]
           ,[CODART_ORESTRA]
           ,[PREZZO_ORESTRA]
           ,[SCONTO_ORESTRA]
           ,[PROVV1_ORESTRA]
           ,[PROVV2_ORESTRA]
           ,[PROVV3_ORESTRA]
           ,[CODART_OREVIAGGIO]
           ,[PREZZO_OREVIAGGIO]
           ,[SCONTO_OREVIAGGIO]
           ,[PROVV1_OREVIAGGIO]
           ,[PROVV2_OREVIAGGIO]
           ,[PROVV3_OREVIAGGIO]
           ,[CODART_TRASFERTA]
           ,[PREZZO_TRASFERTA]
           ,[SCONTO_TRASFERTA]
           ,[PROVV1_TRASFERTA]
           ,[PROVV2_TRASFERTA]
           ,[PROVV3_TRASFERTA]
           ,[CODART_KM]
           ,[PREZZO_KM]
           ,[SCONTO_KM]
           ,[PROVV1_KM]
           ,[PROVV2_KM]
           ,[PROVV3_KM]
           ,[UTENTEMODIFICA]
           ,[DATAMODIFICA])

			SELECT 
				@IDSESSIONE
				,[IDRAPPORTO]
				  ,[idRiga]
				,'',0,0,0,0,0
				,'',0,0,0,0,0
				,'',0,0,0,0,0
				,'',0,0,0,0,0
				,'',0,0,0,0,0
				,user_name()
				,getdate()	
			  FROM [dbo].[GEM_SEZIONECONTRATTORAPPORTI_OreLavoro]
			WHERE IdRapporto=@IDRAPPORTO




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_RAPPORTI_FATTURAZIONE_INS_TMP_ORE] TO [Metodo98]
    AS [dbo];

