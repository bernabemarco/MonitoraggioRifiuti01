


-- --------------------------------------------------------------------------------------
-- Funzione   : SF TV1272869 del 01.01.2013 (Punto 3) - Revisione Impianti e CheckList
--							GEM_SEZIONECONTRATTORAPPORTI (Metodo->DbSync)
-- Autore     : Moreno Feletto
-- Data       : 07.02.2013
-- --------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GEM_METSIC_TO_INT_SEZIONECONTRATTORAPPORTI] (@IDRAPPORTO as varchar(14),@TIPOOPERAZIONE as char(1),@Progressivo as decimal(10,0),@Stato as varchar(1)) AS
BEGIN

	declare @IdAzienda varchar(3)

	select @IdAzienda = IdSocieta
	from GEM_TabParametriAziendaGemma

	-- UPDATE PER AZIENDA METODO SICURA
	IF @Stato = 'T'
	BEGIN
		
		UPDATE INS 
			SET INS.[IDCONTRATTO] = MET.[IDCONTRATTO] 
			,INS.[SEZIONECONTRATTO] = MET.[SEZIONECONTRATTO]
			,INS.[IDRAPPORTOAGGREGATO] = MET.[IDRAPPORTOAGGREGATO]
			,INS.[TIPOLOGIARAPPORTO] = MET.[TIPOLOGIARAPPORTO]
			,INS.[TIPO_RAPPORTO] = MET.[TIPO_RAPPORTO]
			,INS.[DATA_PREV] = MET.[DATA_PREV]
			,INS.[DATA_EFF] = MET.[DATA_EFF]
			,INS.[DATA_FATT] = MET.[DATA_FATT]
			,INS.[VersioneChekList] = MET.[VersioneChekList]
			,INS.[TitoloChekList] = MET.[TitoloChekList]
			,INS.[STATO] = 'T'
			,INS.[DA_FATT] = MET.[DA_FATT]
			,INS.[DataInserimento] = MET.[DataInserimento]
			,INS.[DataEliminazione] = MET.[DataEliminazione]
			,INS.[FLG_DerogaRicScadenze] = MET.[FLG_DerogaRicScadenze]
			,INS.[EsitoDelControllo] = MET.[EsitoDelControllo]
			,INS.[NUMERO_RFW] = MET.[NUMERO_RFW]
			,INS.[DATA_CREAZIONE] = MET.[DATA_CREAZIONE]
			,INS.[NOTE_INTERNE] = MET.[NOTE_INTERNE]
			,INS.[NOTE_TECNICO] = MET.[NOTE_TECNICO]
			,INS.[TECNICO_EFF] = MET.[TECNICO_EFF]
			,INS.[TECNICO_PREV] = MET.[TECNICO_PREV]
			,INS.[CodAGENTE1] = MET.[CodAGENTE1]
			,INS.[CodAGENTE2] = MET.[CodAGENTE2]
			,INS.[DESCR_INT] = MET.[DESCR_INT]
			,INS.[RICHIESTA_INT] = MET.[RICHIESTA_INT]
			--,INS.[AZRIF] = MET.[AZRIF]
			,INS.[DATA_ULT_MOD] = MET.[DATA_ULT_MOD]
			,INS.[UTENTE_ULT_MOD] = MET.[UTENTE_ULT_MOD]
			,INS.[IP_ULT_MOD] = MET.[IP_ULT_MOD]
			,INS.[INVIOFORZATO] = MET.[INVIOFORZATO]
			,INS.[AZ_TEC_EFF] = MET.[AZ_TEC_EFF]
			,INS.[BLOCCOSYNC] = MET.[BLOCCOSYNC]
			,INS.[NUMERORATA] = MET.[NUMERORATA]
			,INS.[CODCLIENTE] = MET.[CODCLIENTE]
			,INS.[CODPAG] = MET.[CODPAG]
			,INS.[CODDEST] = MET.[CODDEST]
			,INS.[DATABLOCCO] = MET.[DATABLOCCO]
			,INS.[UTENTEBLOCCO] = MET.[UTENTEBLOCCO]
			,INS.[FLAGBLOCCO] = MET.[FLAGBLOCCO]
			--,INS.[NUMINSODO] = MET.[NUMINSODO]
			,INS.[TECNICO1] = MET.[TECNICO1]
			,INS.[TECNICO2] = MET.[TECNICO2]
			,INS.[RIFCLIENTE] = MET.[RIFCLIENTE]
			,INS.[FLGEXP] = MET.[FLGEXP]
			,INS.[DATA_STAMPA_PALMTEC] = MET.[DATA_STAMPA_PALMTEC]
			,INS.[TOTALE_PALMTEC] = MET.[TOTALE_PALMTEC]
			,INS.[MOTIVAZIONE_ANN] = MET.[MOTIVAZIONE_ANN]
			,INS.[FLG_VER_TEC] = MET.[FLG_VER_TEC]
			,INS.[NOTE_GestioneRapporto] = MET.[NOTE_GestioneRapporto]
			,INS.[FLG_BLOCCO_SEGNALATO] = MET.[FLG_BLOCCO_SEGNALATO]
			,INS.[BIGCUSTOMER] = MET.[BIGCUSTOMER]
			,INS.[PresaVisAvviso] = MET.[PresaVisAvviso]
			,INS.[ELIMINATO] = MET.[ELIMINATO]
			,INS.[UTENTEMODIFICA] = MET.[UTENTEMODIFICA]
			,INS.[DATAMODIFICA] = MET.[DATAMODIFICA]
			,INS.AZRIF = @IdAzienda
			,INS.[NrVisita] = MET.[NrVisita]
			,INS.[TV] = MET.[TV]
			,INS.Referente = MET.Referente 
			,INS.Tel_Ref = MET.Tel_Ref
			,INS.Email_Responsabile = MET.Email_Responsabile
			-- Rif. Ns. SF TV1272869 del 01.01.2013 - Revisione Impianti e CheckList			
			,INS.Periodicita = MET.Periodicita
			,INS.FlgOblLetturaNote = MET.FlgOblLetturaNote
			,INS.FlgLetturaNote = MET.FlgLetturaNote
			,INS.RifOfferta = MET.RifOfferta
			,INS.OreIntPreviste = MET.OreIntPreviste
			,INS.FlgOblPiattaforma = MET.FlgOblPiattaforma
			,INS.FlgPrevistoAllegato = MET.FlgPrevistoAllegato
			,INS.FlgAllegato = MET.FlgAllegato
			-- Rif. Ns. PD1600099 - Metodo Evolus, implementazione Gemma e Gemma View 
			,INS.FLG_RichiestaRDO= ISNULL(MET.FLG_RichiestaRDO, 0)  
			,INS.NoteRichiestaRDO = MET.NoteRichiestaRDO 
     		--MM tv1800400 PUNTO 86 87.3
			,INS.FLG_AttRipristCompr=MET.FLG_AttRipristCompr
			,INS.ValoreSogliaRiprist=MET.ValoreSogliaRiprist
			,INS.FLG_AmbientiConf=MET.FLG_AmbientiConf
			,INS.FLG_LavoriInQuota=MET.FLG_LavoriInQuota
			--F MM tv1800400 PUNTO 86 87.3


			FROM GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTI INS
			INNER JOIN GEM_SEZIONECONTRATTORAPPORTI MET ON
			INS.IDRAPPORTO = MET.IDRAPPORTO COLLATE Latin1_General_CI_AS
			WHERE INS.IDRAPPORTO = @IDRAPPORTO AND PROGRESSIVO = @Progressivo
			AND INS.AZRIF = @IdAzienda
	END
	ELSE
	BEGIN
		INSERT INTO GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTI
		(
			[PROGRESSIVO]
			,[IDRAPPORTO]
			,[IDCONTRATTO] 
			,[SEZIONECONTRATTO]
			,[IDRAPPORTOAGGREGATO]
			,[TIPOLOGIARAPPORTO]
			,[TIPO_RAPPORTO]
			,[DATA_PREV]
			,[DATA_EFF]
			,[DATA_FATT]
			,[VersioneChekList]
			,[TitoloChekList]
			,[STATO]
			,[DA_FATT]
			,[DataInserimento]
			,[DataEliminazione]
			,[FLG_DerogaRicScadenze]
			,[EsitoDelControllo]
			,[NUMERO_RFW]
			,[DATA_CREAZIONE]
			,[NOTE_INTERNE]
			,[NOTE_TECNICO]
			,[TECNICO_EFF]
			,[TECNICO_PREV]
			,[CodAGENTE1]
			,[CodAGENTE2]
			,[DESCR_INT]
			,[RICHIESTA_INT]
			--[AZRIF]
			,[DATA_ULT_MOD]
			,[UTENTE_ULT_MOD]
			,[IP_ULT_MOD]
			,[INVIOFORZATO]
			,[AZ_TEC_EFF]
			,[BLOCCOSYNC]
			,[NUMERORATA]
			,[CODCLIENTE]
			,[CODPAG]
			,[CODDEST]
			,[DATABLOCCO]
			,[UTENTEBLOCCO]
			,[FLAGBLOCCO]
			--[NUMINS1ODO]
			,[TECNICO1]
			,[TECNICO2]
			,[RIFCLIENTE]
			,[FLGEXP]
			,[DATA_STAMPA_PALMTEC]
			,[TOTALE_PALMTEC]
			,[MOTIVAZIONE_ANN]
			,[FLG_VER_TEC]
			,[NOTE_GestioneRapporto]
			,[FLG_BLOCCO_SEGNALATO]
			,[BIGCUSTOMER]
			,[PresaVisAvviso]
			,[ELIMINATO]
			,[UTENTEMODIFICA]
			,[DATAMODIFICA]
			,[STATO_SYNC]
			,[AZRIF]
			,[NrVisita]
			,[TV]
			,Referente
			,Tel_Ref
			,Email_Responsabile
			-- Rif. Ns. SF TV1272869 del 01.01.2013 - Revisione Impianti e CheckList		
			,Periodicita
			,FlgOblLetturaNote
			,FlgLetturaNote
            ,RifOfferta
            ,OreIntPreviste
            ,FlgOblPiattaforma
            ,FlgPrevistoAllegato
            ,FlgAllegato
			-- Rif. Ns. PD1600099 - Metodo Evolus, implementazione Gemma e Gemma View 
			,FLG_RichiestaRDO
			,NoteRichiestaRDO
     		--MM tv1800400 PUNTO 86 87.3
			,FLG_AttRipristCompr
			,ValoreSogliaRiprist
			,FLG_AmbientiConf
			,FLG_LavoriInQuota
			--F MM tv1800400 PUNTO 86 87.3
					
			)
		SELECT
			@Progressivo
			,[IDRAPPORTO]
			,MET.[IDCONTRATTO] 
			,MET.[SEZIONECONTRATTO]
			,MET.[IDRAPPORTOAGGREGATO]
			,MET.[TIPOLOGIARAPPORTO]
			,MET.[TIPO_RAPPORTO]
			,MET.[DATA_PREV]
			,MET.[DATA_EFF]
			,MET.[DATA_FATT]
			,MET.[VersioneChekList]
			,MET.[TitoloChekList]
			,'T'
			,MET.[DA_FATT]
			,MET.[DataInserimento]
			,MET.[DataEliminazione]
			,MET.[FLG_DerogaRicScadenze]
			,MET.[EsitoDelControllo]
			,MET.[NUMERO_RFW]
			,MET.[DATA_CREAZIONE]
			,MET.[NOTE_INTERNE]
			,MET.[NOTE_TECNICO]
			,MET.[TECNICO_EFF]
			,MET.[TECNICO_PREV]
			,MET.[CodAGENTE1]
			,MET.[CodAGENTE2]
			,MET.[DESCR_INT]
			,MET.[RICHIESTA_INT]
			--MET.[AZRIF]
			,MET.[DATA_ULT_MOD]
			,MET.[UTENTE_ULT_MOD]
			,MET.[IP_ULT_MOD]
			,MET.[INVIOFORZATO]
			,MET.[AZ_TEC_EFF]
			,MET.[BLOCCOSYNC]
			,MET.[NUMERORATA]
			,MET.[CODCLIENTE]
			,MET.[CODPAG]
			,MET.[CODDEST]
			,MET.[DATABLOCCO]
			,MET.[UTENTEBLOCCO]
			,MET.[FLAGBLOCCO]
			--MET.[NUMINS1ODO]
			,MET.[TECNICO1]
			,MET.[TECNICO2]
			,MET.[RIFCLIENTE]
			,MET.[FLGEXP]
			,MET.[DATA_STAMPA_PALMTEC]
			,MET.[TOTALE_PALMTEC]
			,MET.[MOTIVAZIONE_ANN]
			,MET.[FLG_VER_TEC]
			,MET.[NOTE_GestioneRapporto]
			,MET.[FLG_BLOCCO_SEGNALATO]
			,MET.[BIGCUSTOMER]
			,MET.[PresaVisAvviso]
			,MET.[ELIMINATO]
			,MET.[UTENTEMODIFICA]
			,MET.[DATAMODIFICA]
			,'T'
			,@IdAzienda
			,MET.[NrVisita]
			,MET.[TV]
			,MET.Referente 
			,MET.Tel_Ref
			,MET.Email_Responsabile
			-- Rif. Ns. SF TV1272869 del 01.01.2013 - Revisione Impianti e CheckList
			,MET.Periodicita
			,MET.FlgOblLetturaNote
			,MET.FlgLetturaNote			
			,MET.RifOfferta
			,MET.OreIntPreviste
			,MET.FlgOblPiattaforma
			,MET.FlgPrevistoAllegato
			,MET.FlgAllegato
			-- Rif. Ns. PD1600099 - Metodo Evolus, implementazione Gemma e Gemma View 
			,MET.FLG_RichiestaRDO
			,MET.NoteRichiestaRDO
     		--MM tv1800400 PUNTO 86 87.3
			,MET.FLG_AttRipristCompr
			,MET.ValoreSogliaRiprist
			,MET.FLG_AmbientiConf
			,MET.FLG_LavoriInQuota
			--F MM tv1800400 PUNTO 86 87.3
		FROM GEM_SEZIONECONTRATTORAPPORTI MET
		WHERE IDRAPPORTO = @IDRAPPORTO
	END
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_METSIC_TO_INT_SEZIONECONTRATTORAPPORTI] TO [Metodo98]
    AS [dbo];

