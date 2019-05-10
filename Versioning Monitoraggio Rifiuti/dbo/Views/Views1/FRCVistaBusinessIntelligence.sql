
CREATE VIEW FRCVistaBusinessIntelligence AS 
	SELECT ID, AMBIENTE AS Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCBusinessIntelligence.AMBIENTE), '') AS Descrizione_Ambiente, ANNODOC AS Anno, 
		   MESEDOC AS Mese, CODCLIFOR AS Cliente, DSCCONTO1 AS Ragione_Sociale, CODSETTORE AS Settore, DESCSETTCLI AS Descrizione_Settore, CODZONA AS Zona, 
		   DESCZONACLI AS Descrizione_Zona, CODCATEGORIA AS Categoria_Cliente, DESCCATCLI AS Descrizione_Categoria_Cliente, LOCALITA AS [Localita'], PROVINCIA AS Provincia, 
		   CODNAZIONE AS Nazione, NAZIONE AS Descrizione_Nazione, CODICEISO AS CodiceISO, CODREGIONE AS Codice_Regione, CODAGENTE1 AS Agente1, DSCAGENTE1 AS Nome_Agente1, 
		   CODAGENTE2 AS Agente2, DSCAGENTE2 AS Nome_Agente2, CODAGENTE3 AS Agente3, DSCAGENTE3 AS Nome_Agente3, CODART AS Articolo, DESCRIZIONE AS Descrizione_Articolo, 
		   GRUPPO AS Gruppo, DESCGRPART AS Descrizione_Gruppo, CATEGORIA AS Categoria_Articolo, DESCCATART AS Descrizione_Categoria_Articolo, 
		   CODCATEGORIASTAT AS Categoria_Statistica_Articolo, DESCCATSTATART AS Descrizione_Categoria_Statistica_Articolo, SERIE AS Serie, DESCSERIEART AS Descrizione_Serie, 
		   MODELLO AS Modello, DESCMODART AS Descrizione_Modello, UMGEST AS UM_Gestione, QTAGEST AS [Quantita'_Gestione], UMPREZZO AS UM_Prezzo, QTAPREZZO AS [Quantita'_Prezzo], 
		   FATTORE AS Fattore_Conversione, CODIVA AS Codice_Iva, DESCIVA AS Descrizione_Iva, ALIQUOTA AS Aliquota_Iva, TOTLORDORIGAEURO AS Totale_Lordo, 
		   TOTSCONTORIGAEURO AS Totale_Sconto, TOTNETTORIGAEURO AS Totale_Netto, TOTPROVVAGEURO1 AS Provvigioni1, PERCPROVVAGEURO1 AS Percentuale_Provvigioni1, 
		   TOTPROVVAGEURO2 AS Provvigioni2, PERCPROVVAGEURO2 AS Percentuale_Provvigioni2, TOTPROVVAGEURO3 AS Provvigioni3, PERCPROVVAGEURO3 AS Percentuale_Provvigioni3, 
		   GENCONTROP AS Contropartita, DESCGENCONTROP AS Descrizione_Contropartita, 
		   CONTOCDC AS Codice_Centro, ISNULL((SELECT DESCRIZIONE FROM TABCENTRICOSTO WHERE CODICE = FRCBusinessIntelligence.CONTOCDC), '') AS Descrizione_Centro, 
		   CDRMercato AS CDR_Mercato, ISNULL((SELECT DESCRIZIONE FROM TABCENTRICOSTO WHERE CODICE = FRCBusinessIntelligence.CDRMercato), '') AS Descrizione_CDR_Mercato, 
		   CDRProdotto AS CDR_Prodotto, ISNULL((SELECT DESCRIZIONE FROM TABCENTRICOSTO WHERE CODICE = FRCBusinessIntelligence.CDRProdotto), '') AS Descrizione_CDR_Prodotto, 
		   COSTOUNIEURODIBA AS Costo_Unitario_DiBa, COSTOTOTEURODIBA AS Costo_Totale_DiBa, AmbienteIndici AS Ambiente_Indici, AnnoInizioIndici AS Anno_Inizio_Indici, MeseInizioIndici AS Mese_Inizio_Indici, 
		   AnnoFineIndici AS Anno_Fine_Indici, MeseFineIndici AS Mese_Fine_Indici, CostoTrasfVarSetup AS Costo_Trasf_Var_Setup, CostoTrasfFisSetup AS Costo_Trasf_Fis_Setup, 
		   CostoTrasfVarUomo AS Costo_Trasf_Var_Uomo, CostoTrasfFisUomo AS Costo_Trasf_Fis_Uomo, CostoTrasfVarMacchina AS Costo_Trasf_Var_Macchina, CostoTrasfFisMacchina AS Costo_Trasf_Fis_Macchina, 
		   CostoTrasfEsterno AS Costo_Trasf_Esterno, CostoStruttura01 AS Costo_Struttura_01, CostoStruttura02 AS Costo_Struttura_02, CostoStruttura03 AS Costo_Struttura_03, CostoStruttura04 AS Costo_Struttura_04, 
		   CostoStruttura05 AS Costo_Struttura_05, CostoStruttura06 AS Costo_Struttura_06, CostoStruttura07 AS Costo_Struttura_07, CostoStruttura08 AS Costo_Struttura_08, CostoStruttura09 AS Costo_Struttura_09, 
		   CostoStruttura10 AS Costo_Struttura_10, CostiDirettiCommerciali AS Costi_Diretti_Commerciali, RIFCOMMCLI, RIFCOMMRIEP, CostiFissiDirettiCommessa AS Costi_Fissi_Diretti_Commessa, 
		   CostiVariabiliDirettiCommessa AS Costi_Variabili_Diretti_Commessa, MESEDOCUMENTO AS Mese_Competenza, TipoClienteBudget AS Tipo_Cliente_Budget, 
		   IDTESTA AS ID_Testa, IDRIGA AS ID_Riga, TIPODOC AS Tipo_Documento, DESTIPODOCUMENTO AS Descrizione_Tipo_Documento, 
		   ESERCIZIO AS Esercizio, NUMERODOC AS Numero_Documento, BIS AS Bis_Documento, DATADOC	AS Data_Documento, COSTOUNIEURODIBARESA AS Costo_Unitario_DiBa_Resa, 
		   COSTOTOTEURODIBARESA AS Costo_Totale_DiBa_Resa, ANNOCOMPETENZA AS Anno_Competenza, SpeseImballo AS Spese_Imballo, SpeseTrasporto AS Spese_Trasporto, 
		   ScontoIncondizionato AS Sconti_Piede, SpeseEffetto AS Spese_Effetto, SpeseDocumento AS Spese_Documento, ARTICOLOALTERNATIVO AS Articolo_Alternativo, 
		   CostoStruttura11 AS Costo_Struttura_11, CostoStruttura12 AS Costo_Struttura_12, CostoStruttura13 AS Costo_Struttura_13, CostoStruttura14 AS Costo_Struttura_14, CostoStruttura15 AS Costo_Struttura_15, 
		   CostoStruttura16 AS Costo_Struttura_16, CostoStruttura17 AS Costo_Struttura_17, CostoStruttura18 AS Costo_Struttura_18, CostoStruttura19 AS Costo_Struttura_19, CostoStruttura20 AS Costo_Struttura_20, 
		   CostoStruttura21 AS Costo_Struttura_21, CostoStruttura22 AS Costo_Struttura_22, CostoStruttura23 AS Costo_Struttura_23, CostoStruttura24 AS Costo_Struttura_24, CostoStruttura25 AS Costo_Struttura_25, 
		   CostoStruttura26 AS Costo_Struttura_26, CostoStruttura27 AS Costo_Struttura_27, CostoStruttura28 AS Costo_Struttura_28, CostoStruttura29 AS Costo_Struttura_29, CostoStruttura30 AS Costo_Struttura_30, 
		   PROVVIGIONE_SPEC AS Provvigione_Specifica, CONTRIBUTO_PERC AS Contributo_Percentuale, CONTRIBUTO_EURO AS Contributo_Euro, OMAGGI_CLIENTI AS Omaggi_Clienti, PREMIO_CLIENTI AS Premio_Clienti, 
		   PREMIO_AGENTI AS Premio_Agenti, SCONTO_COMMERCIALE AS Sconto_Commerciale, TRASPORTO_VENDITA AS Trasporto_Vendita, LOGISTICA AS Logistica, VARIE_COMMERCIALI AS Varie_Commerciali, 
		   AMM_SPECIFICI AS Ammortamenti_Specifici, STAMPI_SPECIFICI AS Stampi_Specifici, BREVETTI_PLURIENNALI AS Brevetti_Pluriennali, BREVETTI_ANNUALI AS Brevetti_Annuali, VARIE_INDUSTRIALI AS Varie_Industriali 
	FROM FRCBusinessIntelligence

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaBusinessIntelligence] TO [Metodo98]
    AS [dbo];

