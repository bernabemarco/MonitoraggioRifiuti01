
CREATE PROCEDURE [dbo].[GEM_METSIC_TO_INT_GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie] 
					(@IDRAPPORTO as varchar(14),@TIPOOPERAZIONE as char(1),@Progressivo as decimal(10,0),@Stato as varchar(1)) AS
BEGIN
	declare @IdAzienda varchar(3)

	select @IdAzienda = IdSocieta
	from GEM_TabParametriAziendaGemma
	
	-- UPDATE PER AZIENDA METODO SICURA
	IF @Stato = 'T'
	BEGIN
		-- aggiorno i dati con i dati provenienti da interscambio
		UPDATE INS SET
			INS.[IDRapporto] = MET.[IDRapporto],
			INS.[IDCONTRATTO] = MET.[IDRapporto],
			INS.[SEZIONECONTRATTO] = MET.[SEZIONECONTRATTO],
			INS.[IdRigaMezzo] = MET.[IdRigaMezzo],
			INS.[IdRigaAnomalia] = MET.[IdRigaAnomalia],
			INS.[idAnomalia] = MET.[idAnomalia],
			INS.[Semaforo] = MET.[Semaforo],
			INS.[Note] = MET.[Note],
			INS.[idStatoAnomalia] = MET.[idStatoAnomalia],
			INS.[DataApertura] = MET.[DataApertura],
			INS.[IdRapportoChiusura] = MET.[IdRapportoChiusura],
			INS.[DataChiusura] = MET.[DataChiusura],
			INS.[Eliminato] = MET.[Eliminato],
			INS.[DataEliminazione] = MET.[DataEliminazione],
			INS.[DATAMODIFICA] = MET.[DATAMODIFICA],
			INS.[UTENTEMODIFICA] = MET.[UTENTEMODIFICA],
			INS.[AZRIF] = @IdAzienda
		FROM GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie INS
		INNER JOIN GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie MET ON 	INS.IDRAPPORTO = MET.IDRAPPORTO COLLATE Latin1_General_CI_AS AND
																																	INS.SEZIONECONTRATTO = MET.SEZIONECONTRATTO AND
																																	INS.IDCONTRATTO = MET.IDCONTRATTO COLLATE Latin1_General_CI_AS AND
																																	INS.IdRigaMezzo = MET.IdRigaMezzo AND
																																	INS.IdRigaAnomalia = MET.IdRigaAnomalia AND
																																	INS.AZRIF = @IdAzienda COLLATE Latin1_General_CI_AS 
		WHERE INS.IDRAPPORTO = @IDRAPPORTO
			AND INS.Progressivo = @Progressivo		
	END
	ELSE
	BEGIN			
 		INSERT INTO GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie
      ([IDRapporto]
      ,[IDCONTRATTO]
      ,[SEZIONECONTRATTO]
      ,[IdRigaMezzo]
      ,[IdRigaAnomalia]			
      ,[idAnomalia]
      ,[Semaforo]
      ,[Note]
      ,[idStatoAnomalia]
      ,[DataApertura]
      ,[IdRapportoChiusura]			
			,[DataChiusura]
			,[Eliminato]
			,[DataEliminazione]			
      ,[DATAMODIFICA]
      ,[UTENTEMODIFICA]
			,[AZRIF]
			,[PROGRESSIVO])
		SELECT MET.[IDRapporto]
			,MET.[IDCONTRATTO]
			,MET.[SEZIONECONTRATTO]
			,MET.[IdRigaMezzo]
			,MET.[IdRigaAnomalia]		 
			,MET.[idAnomalia]
			,MET.[Semaforo]
			,MET.[Note]
			,MET.[idStatoAnomalia]
			,MET.[DataApertura]
			,MET.[IdRapportoChiusura]		 
			,MET.[DataChiusura]
			,MET.[Eliminato]
			,MET.[DataEliminazione]		 
		 ,MET.[DATAMODIFICA]
		 ,MET.[UTENTEMODIFICA]
		 ,@IdAzienda,
		 @Progressivo
	  FROM GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie MET
		WHERE MET.IDRAPPORTO = @IDRAPPORTO
	END	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_METSIC_TO_INT_GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie] TO [Metodo98]
    AS [dbo];

