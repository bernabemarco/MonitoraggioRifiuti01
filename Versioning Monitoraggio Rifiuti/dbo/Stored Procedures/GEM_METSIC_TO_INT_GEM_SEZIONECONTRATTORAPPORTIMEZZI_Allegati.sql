
CREATE PROCEDURE [dbo].[GEM_METSIC_TO_INT_GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati] 
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
			INS.[IDRIGAAllegato] = MET.[IDRIGAAllegato],
			INS.[DATAINSERIMENTO] = MET.[DATAINSERIMENTO],
			INS.[REFERENTE] = MET.[REFERENTE],
			INS.[OGGETTO] = MET.[OGGETTO],
			INS.[ALLEGATO] = MET.[ALLEGATO],
			INS.[PublicaGOnLine] = MET.[PublicaGOnLine],
			INS.[DocValido] = MET.[DocValido],
			INS.[DATAMODIFICA] = MET.[DATAMODIFICA],
			INS.[UTENTEMODIFICA] = MET.[UTENTEMODIFICA],
			INS.[AZRIF] = @IdAzienda
		FROM GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati INS
		INNER JOIN GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati MET ON 	INS.IDRAPPORTO = MET.IDRAPPORTO COLLATE Latin1_General_CI_AS AND
																																	INS.SEZIONECONTRATTO = MET.SEZIONECONTRATTO AND
																																	INS.IDCONTRATTO = MET.IDCONTRATTO COLLATE Latin1_General_CI_AS AND
																																	INS.IdRigaMezzo = MET.IdRigaMezzo AND
																																	INS.IDRIGAAllegato = MET.IDRIGAAllegato AND
																																	INS.AZRIF = @IdAzienda COLLATE Latin1_General_CI_AS 
		WHERE INS.IDRAPPORTO = @IDRAPPORTO
			AND INS.Progressivo = @Progressivo
	END
	ELSE
	BEGIN
 		INSERT INTO GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati
      ([IDRapporto]
      ,[IDCONTRATTO]
      ,[SEZIONECONTRATTO]
      ,[IdRigaMezzo]
      ,[IDRIGAAllegato]
      ,[DATAINSERIMENTO]
      ,[REFERENTE]
      ,[OGGETTO]
      ,[ALLEGATO]
      ,[PublicaGOnLine]
      ,[DocValido]
      ,[DATAMODIFICA]
      ,[UTENTEMODIFICA]
			,[AZRIF]
			,[PROGRESSIVO])
		SELECT MET.[IDRapporto]
		 ,MET.[IDCONTRATTO]
		 ,MET.[SEZIONECONTRATTO]
     ,MET.[IdRigaMezzo]
     ,MET.[IDRIGAAllegato]
		 ,MET.[DATAINSERIMENTO]
		 ,MET.[REFERENTE]
		 ,MET.[OGGETTO]
		 ,MET.[ALLEGATO]
		 ,MET.[PublicaGOnLine]
		 ,MET.[DocValido]
		 ,MET.[DATAMODIFICA]
		 ,MET.[UTENTEMODIFICA]
		 ,@IdAzienda,
		 @Progressivo
	  FROM GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati MET
		WHERE MET.IDRAPPORTO = @IDRAPPORTO
	END	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_METSIC_TO_INT_GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati] TO [Metodo98]
    AS [dbo];

