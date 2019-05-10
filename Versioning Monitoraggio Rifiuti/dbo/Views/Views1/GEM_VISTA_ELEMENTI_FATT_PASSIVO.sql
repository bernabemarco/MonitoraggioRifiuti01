
-- --------------------------------------------------------------------------------------
-- Funzione   : Rif. Ns. SF TV1301923 - Sviluppo Pacchetto 10
-- Autore     : Moreno Feletto
-- Data       : 19.11.2013
-- --------------------------------------------------------------------------------------
CREATE VIEW [dbo].[GEM_VISTA_ELEMENTI_FATT_PASSIVO] AS
SELECT 
		XA.CodFornitore,
		SCR.TECNICO_EFF,
		TC.CODICECIG,
		TC.CODICECUP,
		SCR.IdRapporto,
		TC.CODCLIENTE CodClienteContratto,
		GTTZ.CodArticoloMET_CostoIntervento, 
		GTTZ.CodArticoloMET_CostoMateriale,
		SCR.DATA_EFF,
		SCR.CODDEST,
		TC.PREAVVISOFAT,
		ISNULL(SCR.CostoInterventoFornitore,0) CostoInterventoFornitore,
		ISNULL(SCR.CostoMaterialeFornitore,0) CostoMaterialeFornitore,
		SCR.flag_GeneraListeCicloPass,
		SCR.IdSessioneProcessiRapCicloPass		
	FROM GEM_SEZIONECONTRATTORAPPORTI SCR
	INNER JOIN GEM_SEZIONICONTRATTO SC ON SCR.IDCONTRATTO = SC.IDCONTRATTO AND SCR.SEZIONECONTRATTO = SC.SEZIONECONTRATTO
	INNER JOIN GEMMADBG.dbo.GEM_T_TAB_CP_TERZISTI GTTZ ON SCR.TIPOLOGIARAPPORTO = GTTZ.TIPOLOGIARAPPORTO COLLATE SQL_Latin1_General_CP1_CI_AS AND SC.idTipologMezzo = GTTZ.idTipologMezzo
	LEFT OUTER JOIN GEM_TESTACONTRATTO TC ON TC.IDCONTRATTO = SCR.IDCONTRATTO
	LEFT OUTER JOIN EXTRAAGENTI XA ON XA.CodAgente=SCR.TECNICO_EFF
	GROUP BY 
		XA.CodFornitore,SCR.TECNICO_EFF,
		TC.CODICECIG,
		TC.CODICECUP,
		SCR.IdRapporto,
		TC.CODCLIENTE,
		GTTZ.CodArticoloMET_CostoIntervento, 
		GTTZ.CodArticoloMET_CostoMateriale,
		SCR.DATA_EFF,
		SCR.CODDEST,
		TC.PREAVVISOFAT,
		ISNULL(SCR.CostoInterventoFornitore,0),
		ISNULL(SCR.CostoMaterialeFornitore,0),
		SCR.flag_GeneraListeCicloPass,
		SCR.IdSessioneProcessiRapCicloPass

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VISTA_ELEMENTI_FATT_PASSIVO] TO [Metodo98]
    AS [dbo];

