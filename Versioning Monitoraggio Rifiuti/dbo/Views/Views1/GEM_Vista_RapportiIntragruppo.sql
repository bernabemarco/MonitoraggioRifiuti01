
CREATE VIEW [GEM_Vista_RapportiIntragruppo]
AS

SELECT     GemmaSync_Rapp.IDRAPPORTO, GemmaSync_Rapp.IDCONTRATTO, GemmaSync_Rapp.SEZIONECONTRATTO, GemmaSync_Rapp.AZRIF, 
                      GemmaSync_Rapp.Progressivo, GemmaSync_Rapp.IDRAPPORTOAGGREGATO, GemmaSync_Rapp.TIPOLOGIARAPPORTO, 
                      GemmaSync_Rapp.TIPO_RAPPORTO, GemmaSync_Rapp.DATA_PREV, GemmaSync_Rapp.DATA_EFF, GemmaSync_Rapp.DATA_FATT, 
                      GemmaSync_Rapp.VersioneChekList, GemmaSync_Rapp.TitoloChekList, GemmaSync_Rapp.STATO, GemmaSync_Rapp.STATO_SYNC, 
                      GemmaSync_Rapp.DA_FATT, GemmaSync_Rapp.DataInserimento, GemmaSync_Rapp.DataEliminazione, 
                      GemmaSync_Rapp.FLG_DerogaRicScadenze, GemmaSync_Rapp.EsitoDelControllo, GemmaSync_Rapp.NUMERO_RFW, 
                      GemmaSync_Rapp.DATA_CREAZIONE, GemmaSync_Rapp.NOTE_INTERNE, GemmaSync_Rapp.NOTE_TECNICO, GemmaSync_Rapp.TECNICO_EFF, 
                      GemmaSync_Rapp.TECNICO_PREV, GemmaSync_Rapp.CodAGENTE1, GemmaSync_Rapp.CodAGENTE2, GemmaSync_Rapp.DESCR_INT, 
                      GemmaSync_Rapp.RICHIESTA_INT, GemmaSync_Rapp.DATA_ULT_MOD, GemmaSync_Rapp.UTENTE_ULT_MOD, GemmaSync_Rapp.IP_ULT_MOD, 
                      GemmaSync_Rapp.INVIOFORZATO, GemmaSync_Rapp.AZ_TEC_EFF, GemmaSync_Rapp.BLOCCOSYNC, GemmaSync_Rapp.NUMERORATA, 
                      GemmaSync_Rapp.CODCLIENTE, GemmaSync_Rapp.CODPAG, GemmaSync_Rapp.CODDEST, GemmaSync_Rapp.DATABLOCCO, 
                      GemmaSync_Rapp.UTENTEBLOCCO, GemmaSync_Rapp.FLAGBLOCCO, GemmaSync_Rapp.NUMMETODO, GemmaSync_Rapp.TECNICO1, 
                      GemmaSync_Rapp.TECNICO2, GemmaSync_Rapp.RIFCLIENTE, GemmaSync_Rapp.FLGEXP, GemmaSync_Rapp.DATA_STAMPA_PALMTEC, 
                      GemmaSync_Rapp.TOTALE_PALMTEC, GemmaSync_Rapp.MOTIVAZIONE_ANN, GemmaSync_Rapp.FLG_VER_TEC, 
                      GemmaSync_Rapp.NOTE_GestioneRapporto, GemmaSync_Rapp.FLG_BLOCCO_SEGNALATO, GemmaSync_Rapp.BIGCUSTOMER, 
                      GemmaSync_Rapp.CAMBIO_TECNICO, GemmaSync_Rapp.PresaVisAvviso, GemmaSync_Rapp.ELIMINATO, GemmaSync_Rapp.UTENTEMODIFICA, 
                      GemmaSync_Rapp.DATAMODIFICA, GemmaSync_Rapp.DATASYNC, GemmaSync_Rapp.NrVisita, GemmaSync_Rapp.TV, GemmaSync_Rapp.Referente, 
                      GemmaSync_Rapp.Tel_Ref, GemmaSync_Rapp.Email_Responsabile, GEM_Vista_TAB_StatoProcessoRapporti.Descrizione AS DscStato, 
                      GEM_Vista_Azienda.RagioneSociale AS RagSocAzienda, ANAGRAFICAAGENTI.DSCAGENTE AS DscTecnicoEff
FROM         GemmaSync.dbo.GEM_Vista_RapportiIntragruppo AS GemmaSync_Rapp INNER JOIN
                      GEM_TabParametriAziendaGemma ON 
                      GemmaSync_Rapp.AZ_TEC_EFF COLLATE SQL_Latin1_General_CP1_CI_AS = GEM_TabParametriAziendaGemma.IdSocieta INNER JOIN
                      GEM_Vista_TAB_StatoProcessoRapporti ON GemmaSync_Rapp.STATO = GEM_Vista_TAB_StatoProcessoRapporti.Codice INNER JOIN
                      GEM_Vista_Azienda ON GemmaSync_Rapp.AZRIF = GEM_Vista_Azienda.idAzienda COLLATE Latin1_General_CI_AS INNER JOIN
                      ANAGRAFICAAGENTI ON GemmaSync_Rapp.TECNICO_EFF COLLATE SQL_Latin1_General_CP1_CI_AS = ANAGRAFICAAGENTI.CODAGENTE
WHERE     (GemmaSync_Rapp.AZ_TEC_EFF <> GemmaSync_Rapp.AZRIF)


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_RapportiIntragruppo] TO [Metodo98]
    AS [dbo];

