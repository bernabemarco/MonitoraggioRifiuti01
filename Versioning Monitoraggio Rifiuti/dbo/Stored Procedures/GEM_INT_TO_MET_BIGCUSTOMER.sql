

CREATE PROCEDURE [dbo].[GEM_INT_TO_MET_BIGCUSTOMER] (@AZRIF as varchar(3),
                                                    @IDRAPPORTO as varchar(14),
                                                    @Progressivo as decimal(10,0)) 
AS

BEGIN
	/*
	-- aggiorno poscliente
	UPDATE MET 
	SET MET.[POSCLIENTE] = INS.[POSCLIENTE] 
           ,MET.STATO = INS.STATO
	FROM GEM_SEZIONICONTRATTODETTMEZZI MET
	INNER JOIN GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTIMEZZI INS 
				ON MET.IDCONTRATTO = INS.IDCONTRATTO COLLATE Latin1_General_CI_AS
				AND MET.SEZIONECONTRATTO = INS.SEZIONECONTRATTO
				AND MET.IDRIGAMEZZO = INS.IDRIGAMEZZO
	WHERE INS.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
	*/

		set dateformat ymd 
	
		DECLARE @DATA_SYNC as datetime
		SET @DATA_SYNC = GetDate()

		-- inserisco in metodo i rapporti dei mezzi non presenti
		INSERT INTO GEM_SEZIONICONTRATTODETTMEZZI
		(
 	     [IDCONTRATTO]
		,[SEZIONECONTRATTO]
		,[IdRigaMezzo]
		  ,[UTENTEMODIFICA] 
		  ,[DATAMODIFICA] 
		)
		SELECT
	      INS.[IDCONTRATTO] COLLATE Latin1_General_CI_AS
		  ,INS.[SEZIONECONTRATTO] 
		  ,INS.[IdRigaMezzo]
		  ,'Sincronizzazione'
		  ,@DATA_SYNC
		FROM GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTIMEZZI INS
		left join GEM_SEZIONICONTRATTODETTMEZZI MET on MET.IDCONTRATTO = INS.IDCONTRATTO COLLATE Latin1_General_CI_AS and MET.SEZIONECONTRATTO = INS.SEZIONECONTRATTO and MET.IdRigaMezzo = INS.IdRigaMezzo
		WHERE INS.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
		  and MET.IDCONTRATTO is null	

        -- aggiorno i dati con i dati provenienti da interscambio
		UPDATE MET 
		SET MET.[CodMezzo] = INS.[CodMezzo]
		   ,MET.[DataInserimento] = convert(varchar(10), INS.[DataInserimento], 111) -- elimino l'ora. Era INS.[DataInserimento]
		   ,MET.[DataEliminazione] = convert(varchar(10), INS.[DataEliminazione], 111) -- elimino l'ora. Era INS.[DataEliminazione]
		   ,MET.[ELIMINATO] = isnull(INS.[ELIMINATO], '0')
		   ,MET.[POSIZIONE] = INS.[POSIZIONE]
		   ,MET.[SUBPOSIZIONE] = INS.[SUBPOSIZIONE]
		   ,MET.[UBICAZIONE] = INS.[UBICAZIONE]
		   ,MET.[POSCLIENTE] = INS.[POSCLIENTE]
		   ,MET.[NOTE] = INS.[NOTE] 
		   ,MET.[ORDINE] = INS.[ORDINE] 
		   ,MET.[CarTesto1] = INS.[CarTesto1] 
		   ,MET.[CarTesto2] = INS.[CarTesto2] 
		   ,MET.[CarTesto3] = INS.[CarTesto3] 
		   ,MET.[CarTesto4] = INS.[CarTesto4] 
		   ,MET.[CarTesto5] = INS.[CarTesto5]
		   ,MET.[CarTesto6] = INS.[CarTesto6] 
		   ,MET.[CarTesto7] = INS.[CarTesto7] 
		   ,MET.[CarTesto8] = INS.[CarTesto8] 
		   ,MET.[CarTesto9] = INS.[CarTesto9] 
		   ,MET.[CodiceBarre] = INS.[CodiceBarre] 
		   ,MET.[OMOLOGATO] = INS.[OMOLOGATO] 
		   ,MET.[ANNO] = INS.[ANNO] 
		   ,MET.[FLAG_INST] = INS.[FLAG_INST] 
		   ,MET.[STATO] = INS.[STATO] 
		   ,MET.[POSQLIK] = INS.[POSQLIK] 
		   ,MET.[QUANTITA] = INS.[QUANTITA] 
		   ,MET.[TEMPO_MAN] = INS.[TEMPO_MAN] 
		   ,MET.[IMPORTOAT1] = INS.[IMPORTOAT1] 
		   ,MET.[IMPORTOAT2] = INS.[IMPORTOAT2] 
		   ,MET.[IMPORTOAT3] = INS.[IMPORTOAT3] 
		   ,MET.[IMPORTOAT4] = INS.[IMPORTOAT4] 
		   ,MET.[IMPORTOAT5] = INS.[IMPORTOAT5] 
		   ,MET.[SCONTOAT1] = INS.[SCONTOAT1] 
		   ,MET.[SCONTOAT2] = INS.[SCONTOAT2] 
		   ,MET.[SCONTOAT3] = INS.[SCONTOAT3] 
		   ,MET.[SCONTOAT4] = INS.[SCONTOAT4] 
		   ,MET.[SCONTOAT5] = INS.[SCONTOAT5] 
		   ,MET.[PROV1AT1] = INS.[PROV1AT1] 
		   ,MET.[PROV1AT2] = INS.[PROV1AT2]
		   ,MET.[PROV1AT3] = INS.[PROV1AT3] 
		   ,MET.[PROV1AT4] = INS.[PROV1AT4] 
		   ,MET.[PROV1AT5] = INS.[PROV1AT5] 
		   ,MET.[PROV2AT1] = INS.[PROV2AT1]
		   ,MET.[PROV2AT2] = INS.[PROV2AT2] 
		   ,MET.[PROV2AT3] = INS.[PROV2AT3] 
		   ,MET.[PROV2AT4] = INS.[PROV2AT4] 
		   ,MET.[PROV2AT5] = INS.[PROV2AT5] 
		   ,MET.[PROV3AT1] = INS.[PROV3AT1] 
		   ,MET.[PROV3AT2] = INS.[PROV3AT2] 
		   ,MET.[PROV3AT3] = INS.[PROV3AT3] 
		   ,MET.[PROV3AT4] = INS.[PROV3AT4] 
		   ,MET.[PROV3AT5] = INS.[PROV3AT5] 
		   ,MET.[StatoFuoriSede] = INS.[StatoFuoriSede] 
		   ,MET.DATAMODIFICA = INS.DATAMODIFICA
		   ,MET.UTENTEMODIFICA = INS.UTENTEMODIFICA
		FROM GEM_SEZIONICONTRATTODETTMEZZI MET
		INNER JOIN GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTIMEZZI INS ON MET.IDCONTRATTO = INS.IDCONTRATTO COLLATE Latin1_General_CI_AS
					                                                  AND MET.SEZIONECONTRATTO = INS.SEZIONECONTRATTO 
		                                                              AND MET.IDRIGAMEZZO = INS.IDRIGAMEZZO
		WHERE INS.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_INT_TO_MET_BIGCUSTOMER] TO [Metodo98]
    AS [dbo];

