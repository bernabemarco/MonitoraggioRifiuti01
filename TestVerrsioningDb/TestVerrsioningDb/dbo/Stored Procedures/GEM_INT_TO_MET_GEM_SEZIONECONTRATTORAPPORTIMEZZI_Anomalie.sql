

CREATE PROCEDURE [dbo].[GEM_INT_TO_MET_GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie] (@AZRIF as varchar(3),
																																										@IDRAPPORTO as varchar(14),
																																										@Progressivo as decimal(10,0) ) AS
BEGIN
		SET DATEFORMAT ymd 

		DECLARE @DATA_SYNC as datetime
		SET @DATA_SYNC = GetDate()	
		
		-- inserisco in metodo i rapporti dei materiali non presenti
		INSERT INTO [GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie]
					(	[IDCONTRATTO]
						,[SEZIONECONTRATTO]
						,[IDRapporto]
						,[IdRigaMezzo]
						,[IdRigaAnomalia]
						,[idAnomalia]
						,[UTENTEMODIFICA]
						,[DATAMODIFICA] )
		SELECT	INS.[IDCONTRATTO] COLLATE Latin1_General_CI_AS
						,INS.[SEZIONECONTRATTO]
						,INS.[IDRapporto] COLLATE Latin1_General_CI_AS
						,INS.[IdRigaMezzo] 
						,INS.[IdRigaAnomalia]
						,INS.[idAnomalia] COLLATE Latin1_General_CI_AS 
						,'Sincronizzazione'
						,@DATA_SYNC			  
		FROM GemmaSync.dbo.[GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie] INS   
		WHERE INS.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
		EXCEPT
		SELECT	MET.[IDCONTRATTO]
						,MET.[SEZIONECONTRATTO]
						,MET.[IDRapporto]
						,MET.[IdRigaMezzo]
						,MET.[IdRigaAnomalia]
						,MET.[idAnomalia] COLLATE Latin1_General_CI_AS 
						,'Sincronizzazione'
						,@DATA_SYNC	
		FROM [GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie] MET  
		WHERE MET.IDRAPPORTO = @IDRAPPORTO 
			
		UPDATE MET SET
				--MET.[idAnomalia] = INS.[idAnomalia],
				MET.[Semaforo] = INS.[Semaforo],
				MET.[Note] = INS.[Note],
				MET.[idStatoAnomalia] = INS.[idStatoAnomalia],
				MET.[DataApertura] = INS.[DataApertura],
				MET.[IdRapportoChiusura] = INS.[IdRapportoChiusura],				
				MET.[DataChiusura] = INS.[DataChiusura],
				MET.[Eliminato] = INS.[Eliminato],
				MET.[DataEliminazione] = INS.[DataEliminazione],				
				MET.[DATAMODIFICA] = INS.[DATAMODIFICA],
				MET.[UTENTEMODIFICA] = INS.[UTENTEMODIFICA]
			FROM [GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie] MET
			INNER JOIN GemmaSync.dbo.[GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie] INS ON 	INS.IDCONTRATTO = MET.IDCONTRATTO COLLATE Latin1_General_CI_AS AND
																																										INS.SEZIONECONTRATTO = MET.SEZIONECONTRATTO AND 		
																																										INS.IDRAPPORTO = MET.IDRAPPORTO COLLATE Latin1_General_CI_AS  AND
																																										INS.[IdRigaMezzo]=MET.[IdRigaMezzo] AND					
																																										INS.[IdRigaAnomalia] = MET.[IdRigaAnomalia] 
			WHERE MET.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_INT_TO_MET_GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie] TO [Metodo98]
    AS [dbo];

