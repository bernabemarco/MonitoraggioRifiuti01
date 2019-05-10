
-- --------------------------------------------------------------------------------------
-- Funzione  : Ricezione Rapporti Intervento eseguiti da Tablet a Gemma (GEMMAYSYNC)
-- Autore   : Moreno Feletto
-- Data    : 21.04.2016
-- --------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GRI_INT_TO_MET_RAPPORTI] (@AZRIF AS VARCHAR(3), @IDRAPPORTO AS VARCHAR(14), @Progressivo AS decimal(10,0))
AS
BEGIN
		UPDATE MET SET		
				MET.[IDCONTRATTO] = INS.[IDCONTRATTO] 
				,MET.[SEZIONECONTRATTO] = INS.[SEZIONECONTRATTO]			
				,MET.[IdDivisione] = INS.[IdDivisione]
				,MET.[CODCLIENTE] = INS.[CODCLIENTE]
				,MET.[CODCLIFAT] = INS.[CODCLIFAT]
				,MET.[CODDEST]= INS.[CODDEST]			
				,MET.[IdTipoRapporto] = INS.[IdTipoRapporto]
				,MET.[IdTipoIntervento] = INS.[IdTipoIntervento]
				,MET.[CODPAG] = INS.[CODPAG]
				,MET.[CodAGENTE1] = INS.[CodAGENTE1]			
				,MET.[CodAGENTE2] = INS.[CodAGENTE2]
				,MET.[RIFCOMMCLI] = INS.[RIFCOMMCLI]
				,MET.[ResponsabileCommessa] = INS.[ResponsabileCommessa]			
				,MET.[NodoID] = INS.[NodoID]		
				,MET.[CodiceMezzo] = INS.[CodiceMezzo]
				,MET.[Referente] = INS.[Referente]
				,MET.[Tel_Ref] = INS.[Tel_Ref]
				,MET.[Email_Responsabile] = INS.[Email_Responsabile]
				,MET.[FlgInvioEmailResp] = INS.[FlgInvioEmailResp]
				,MET.[FlgOblPiattaforma] = ISNULL(INS.FlgOblPiattaforma,0)
				,MET.[TIPO_PIATTAFORMA] = INS.[TIPO_PIATTAFORMA]
				,MET.[GIORNI_PIATT] = INS.[GIORNI_PIATT]			
				,MET.[TECNICO_EFF] = INS.[TECNICO_EFF]
				,MET.[TECNICO_PREV] = INS.[TECNICO_PREV]
				--,MET.[AZRIF] = @IdAzienda									-- INS.[AZRIF]
				,MET.[DATA_PREV] = INS.[DATA_PREV]
				,MET.[DATA_EFF] = INS.[DATA_EFF]
				,MET.[DATA_FATT] = INS.[DATA_FATT]
				,MET.[VersioneChekList] = INS.[VersioneChekList]			
				,MET.[TitoloChekList] = INS.[TitoloChekList]
				,MET.[STATO] = INS.[STATO]
				,MET.[DA_FATT] = INS.[DA_FATT]
				,MET.[DataInserimento] = INS.[DataInserimento]			
				,MET.[DataEliminazione] = INS.[DataEliminazione]
				,MET.[ELIMINATO] = ISNULL(INS.[ELIMINATO], '0')
				,MET.[MOTIVAZIONE_ANN] = INS.[MOTIVAZIONE_ANN]
				,MET.[INVIOFORZATO] = INS.[INVIOFORZATO]
				,MET.[RefRDO] = INS.[RefRDO]			
				,MET.[FlgPrevistoAllegato] = ISNULL(INS.FlgPrevistoAllegato,0)
				,MET.[FlgAllegato] = ISNULL(INS.FlgAllegato,0)
				,MET.[FlgOblLetturaNote] = ISNULL(INS.FlgOblLetturaNote,0)
				,MET.[FlgLetturaNote] = ISNULL(INS.FlgLetturaNote,0)
				,MET.[EsitoDelControllo] = INS.[EsitoDelControllo]			
				,MET.[NUMERO_RFW] = INS.[NUMERO_RFW]
				,MET.[DATA_CREAZIONE] = INS.[DATA_CREAZIONE]
				,MET.[NOTE_INTERNE] = INS.[NOTE_INTERNE]
				,MET.[NOTE_TECNICO] = INS.[NOTE_TECNICO]			
				,MET.[DESCR_INT] = INS.[DESCR_INT]
				,MET.[RICHIESTA_INT] = INS.[RICHIESTA_INT]
				,MET.[RifDocOrigineMetodo] = INS.[RifDocOrigineMetodo]
				,MET.[DATA_ULT_MOD] = INS.[DATA_ULT_MOD]
				,MET.[UTENTE_ULT_MOD] = INS.[UTENTE_ULT_MOD]
				,MET.[IP_ULT_MOD] = INS.[IP_ULT_MOD]
				,MET.[AZ_TEC_EFF] = INS.[AZ_TEC_EFF]
				,MET.[BLOCCOSYNC] = INS.[BLOCCOSYNC]
				,MET.[NUMERORATA] = INS.[NUMERORATA]
				,MET.[DATABLOCCO] = INS.[DATABLOCCO]
				,MET.[UTENTEBLOCCO] = INS.[UTENTEBLOCCO]						
				,MET.[FLAGBLOCCO] = INS.[FLAGBLOCCO]
				,MET.[NUMMETODO] = INS.[NUMMETODO]
				,MET.[TECNICO1] = INS.[TECNICO1]
				,MET.[TECNICO2] = INS.[TECNICO2]
				,MET.[RIFCLIENTE] = INS.[RIFCLIENTE]
				,MET.[FLGEXP] = INS.[FLGEXP]
				,MET.[DATA_STAMPA_TABLET] = INS.[DATA_STAMPA_TABLET]
				,MET.[TOTALE_TABLET] = INS.[TOTALE_TABLET]
				,MET.[FLG_VER_TEC] = INS.[FLG_VER_TEC]
				,MET.[NOTE_GestioneRapporto] = INS.[NOTE_GestioneRapporto]
				,MET.[FLG_BLOCCO_SEGNALATO] = INS.[FLG_BLOCCO_SEGNALATO]
				,MET.[BIGCUSTOMER] = INS.[BIGCUSTOMER]
				,MET.[PresaVisAvviso] = INS.[PresaVisAvviso]
				,MET.[DataSync] = INS.[DataSync]
				,MET.[UTENTEMODIFICA] = INS.[UTENTEMODIFICA]
				,MET.[DATAMODIFICA] = GETDATE()
				,MET.[flag_GeneraListeSMS] = INS.[flag_GeneraListeSMS]
				,MET.[IdSessioneProcessiRap] = INS.[IdSessioneProcessiRap]
				,MET.[Periodicita] = INS.[Periodicita]
				,MET.[NrRevisione] = ISNULL(INS.NrRevisione,0)
				,MET.[FunzioneReferente] = INS.[FunzioneReferente]
				,MET.[NomeEstesoFirma] = INS.[NomeEstesoFirma]
				,MET.[NomeFileAllegato] = INS.[NomeFileAllegato]
				,MET.[CostoInterventoFornitore] = INS.[CostoInterventoFornitore]
				,MET.[CostoMaterialeFornitore] = INS.[CostoMaterialeFornitore]
				,MET.[RifDocTerzita] = INS.[RifDocTerzita]
				,MET.[NoteTerzista] = INS.[NoteTerzista]
				,MET.[RifOfferta] = INS.[RifOfferta]
				,MET.[OreINTPreviste] = ISNULL(INS.OreINTPreviste,0)
				,MET.[flag_GeneraListeCicloPass] = INS.[flag_GeneraListeCicloPass]
				,MET.[IdSessioneProcessiRapCicloPass] = INS.[IdSessioneProcessiRapCicloPass]
				,MET.[DATA_Riprogrammazione] = INS.[DATA_Riprogrammazione]
			FROM GRI_RAPPORTI MET
			INNER JOIN GemmaSync.dbo.GRI_RAPPORTI INS ON MET.IDRAPPORTO = INS.IDRAPPORTO COLLATE Latin1_General_CI_AS
			WHERE MET.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_INT_TO_MET_RAPPORTI] TO [Metodo98]
    AS [dbo];

