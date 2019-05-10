
-- --------------------------------------------------------------------------------------
-- Funzione   : SF TV1272869 del 01.01.2013 (Punto 3) - Revisione Impianti e CheckList
--							GEM_SEZIONECONTRATTORAPPORTI (DbSync->Metodo)
-- Autore     : Moreno Feletto
-- Data       : 07.02.2013
-- --------------------------------------------------------------------------------------
-- Funzione   : Rif. Ns. SF TV1301923 - Sviluppo Pacchetto 10
-- Autore     : Moreno Feletto
-- Data       : 05.11.2013
-- --------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GEM_INT_TO_MET_SEZIONECONTRATTORAPPORTI] (
												@AZRIF as varchar(3),
												@IDRAPPORTO as varchar(14),
												@Progressivo as decimal(10,0))
AS
BEGIN
		UPDATE MET 
			SET MET.[IDCONTRATTO] = INS.[IDCONTRATTO] 
			,MET.[SEZIONECONTRATTO] = INS.[SEZIONECONTRATTO]
			,MET.[IDRAPPORTOAGGREGATO] = INS.[IDRAPPORTOAGGREGATO]
			,MET.[TIPOLOGIARAPPORTO] = INS.[TIPOLOGIARAPPORTO]
			,MET.[TIPO_RAPPORTO] = INS.[TIPO_RAPPORTO]
			,MET.[DATA_PREV] = INS.[DATA_PREV]
			--,MET.[DATA_EFF] = convert(varchar(10), INS.[DATA_EFF], 111) -- elimino l'ora. Era INS.[DATA_EFF]
			,MET.[DATA_EFF] = INS.[DATA_EFF]
			,MET.[DATA_FATT] = INS.[DATA_FATT]
			,MET.[VersioneChekList] = INS.[VersioneChekList]
			,MET.[TitoloChekList] = INS.[TitoloChekList]
			,MET.[STATO] = INS.[STATO]
			,MET.[DA_FATT] = INS.[DA_FATT]
			,MET.[DataInserimento] = INS.[DataInserimento]
			,MET.[DataEliminazione] = INS.[DataEliminazione]
			,MET.[FLG_DerogaRicScadenze] = INS.[FLG_DerogaRicScadenze]
			,MET.[EsitoDelControllo] = INS.[EsitoDelControllo]
			,MET.[NUMERO_RFW] = INS.[NUMERO_RFW]
			,MET.[DATA_CREAZIONE] = INS.[DATA_CREAZIONE]
			,MET.[NOTE_INTERNE] = INS.[NOTE_INTERNE]
			,MET.[NOTE_TECNICO] = INS.[NOTE_TECNICO]
			,MET.[TECNICO_EFF] = INS.[TECNICO_EFF]
			,MET.[TECNICO_PREV] = INS.[TECNICO_PREV]
			,MET.[CodAGENTE1] = INS.[CodAGENTE1]
			,MET.[CodAGENTE2] = INS.[CodAGENTE2]
			,MET.[DESCR_INT] = INS.[DESCR_INT]
			,MET.[RICHIESTA_INT] = INS.[RICHIESTA_INT]
			--,MET.[AZRIF] = INS.[AZRIF]
			--,MET.[DATA_ULT_MOD] = convert(varchar(10), INS.[DATAMODIFICA], 105) -- elimino l'ora. Era INS.[DATAMODIFICA]
			,MET.[DATA_ULT_MOD] = INS.[DATAMODIFICA]
			,MET.[UTENTE_ULT_MOD] = INS.[UTENTE_ULT_MOD]
			,MET.[IP_ULT_MOD] = INS.[IP_ULT_MOD]
			,MET.[INVIOFORZATO] = INS.[INVIOFORZATO]
			,MET.[AZ_TEC_EFF] = INS.[AZ_TEC_EFF]
			,MET.[BLOCCOSYNC] = INS.[BLOCCOSYNC]
			,MET.[NUMERORATA] = INS.[NUMERORATA]
			,MET.[CODCLIENTE] = INS.[CODCLIENTE]
			,MET.[CODPAG] = INS.[CODPAG]
			,MET.[CODDEST] = INS.[CODDEST]
			,MET.[DATABLOCCO] = INS.[DATABLOCCO]
			,MET.[UTENTEBLOCCO] = INS.[UTENTEBLOCCO]
			,MET.[FLAGBLOCCO] = INS.[FLAGBLOCCO]
			,MET.[NUMMETODO] = INS.[NUMMETODO]
			,MET.[TECNICO1] = INS.[TECNICO1]
			,MET.[TECNICO2] = INS.[TECNICO2]
			,MET.[RIFCLIENTE] = INS.[RIFCLIENTE]
			,MET.[FLGEXP] = INS.[FLGEXP]
			,MET.[DATA_STAMPA_PALMTEC] = INS.[DATA_STAMPA_PALMTEC]
			,MET.[TOTALE_PALMTEC] = INS.[TOTALE_PALMTEC]
			,MET.[MOTIVAZIONE_ANN] = INS.[MOTIVAZIONE_ANN]
			,MET.[FLG_VER_TEC] = INS.[FLG_VER_TEC]
			,MET.[NOTE_GestioneRapporto] = INS.[NOTE_GestioneRapporto]
			,MET.[FLG_BLOCCO_SEGNALATO] = INS.[FLG_BLOCCO_SEGNALATO]
			,MET.[BIGCUSTOMER] = INS.[BIGCUSTOMER]
			,MET.[PresaVisAvviso] = INS.[PresaVisAvviso]
			,MET.[ELIMINATO] = isnull(INS.[ELIMINATO], '0')
			,MET.[UTENTEMODIFICA] = INS.[UTENTEMODIFICA]
			,MET.[DATAMODIFICA] = getdate()
			,MET.[DataSync] = INS.[DataSync]
			,MET.[NrVisita] = INS.[NrVisita]
			,MET.[TV] = INS.[TV]
			,MET.Referente = INS.Referente 
			,MET.Tel_Ref = INS.Tel_Ref
			,MET.Email_Responsabile = INS.Email_Responsabile
			-- Rif. Ns. SF TV1272869 del 01.01.2013 - Revisione Impianti e CheckList			
			,MET.Periodicita = INS.Periodicita
			,MET.FlgOblLetturaNote = ISNULL(INS.FlgOblLetturaNote,0)
			,MET.FlgLetturaNote = ISNULL(INS.FlgLetturaNote,0)
			,MET.NrRevisione = ISNULL(INS.NrRevisione,0)
			,MET.FunzioneReferente = INS.FunzioneReferente
			,MET.NomeEstesoFirma = INS.NomeEstesoFirma
			,MET.NomeFileAllegato = INS.NomeFileAllegato
			-- 05.11.2013 Moreno Feletto - TV1301923 - Sviluppo Pacchetto 10
			,MET.RifOfferta = INS.RifOfferta
			,MET.OreIntPreviste = ISNULL(INS.OreIntPreviste,0)
			,MET.FlgOblPiattaforma = ISNULL(INS.FlgOblPiattaforma,0)
			,MET.FlgPrevistoAllegato = ISNULL(INS.FlgPrevistoAllegato,0)
			,MET.FlgAllegato = ISNULL(INS.FlgAllegato,0)
			-- Rif. Ns. PD1600099 - Metodo Evolus, implementazione Gemma e Gemma View 
			,MET.FLG_RichiestaRDO= ISNULL(INS.FLG_RichiestaRDO, 0)  
			,MET.NoteRichiestaRDO = INS.NoteRichiestaRDO 
			-- Fine	
     		--MM tv1800400 PUNTO 86 87.3
			,MET.FLG_AttRipristCompr=INS.FLG_AttRipristCompr
			,MET.ValoreSogliaRiprist=INS.ValoreSogliaRiprist
			,MET.FLG_AmbientiConf=INS.FLG_AmbientiConf
			,MET.FLG_LavoriInQuota=INS.FLG_LavoriInQuota
			--F MM tv1800400 PUNTO 86 87.3
					
			FROM GEM_SEZIONECONTRATTORAPPORTI MET
			INNER JOIN GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTI INS ON
			MET.IDRAPPORTO = INS.IDRAPPORTO COLLATE Latin1_General_CI_AS
			WHERE MET.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_INT_TO_MET_SEZIONECONTRATTORAPPORTI] TO [Metodo98]
    AS [dbo];

