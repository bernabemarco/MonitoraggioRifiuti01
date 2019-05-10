
CREATE VIEW FRCVistaDatiVenditeBudget AS 
	SELECT ID, AMBIENTE AS Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCDatiVenditeBudget.AMBIENTE), '') AS Descrizione_Ambiente, ANNODOC AS Anno, 
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
		   CONTOCDC AS Codice_Centro, ISNULL((SELECT DESCRIZIONE FROM TABCENTRICOSTO WHERE CODICE = FRCDatiVenditeBudget.CONTOCDC), '') AS Descrizione_Centro, 
		   CDRMercato AS CDR_Mercato, ISNULL((SELECT DESCRIZIONE FROM TABCENTRICOSTO WHERE CODICE = FRCDatiVenditeBudget.CDRMercato), '') AS Descrizione_CDR_Mercato, 
		   CDRProdotto AS CDR_Prodotto, ISNULL((SELECT DESCRIZIONE FROM TABCENTRICOSTO WHERE CODICE = FRCDatiVenditeBudget.CDRProdotto), '') AS Descrizione_CDR_Prodotto, 
		   COSTOUNIEURODIBA AS Costo_Unitario_DiBa, COSTOTOTEURODIBA AS Costo_Totale_DiBa, RIFCOMMCLI, RIFCOMMRIEP, MESEDOCUMENTO AS Mese_Competenza, TipoClienteBudget AS Tipo_Cliente_Budget, 
		   IDTESTA AS ID_Testa, IDRIGA AS ID_Riga, TIPODOC AS Tipo_Documento, DESTIPODOCUMENTO AS Descrizione_Tipo_Documento, 
		   ESERCIZIO AS Esercizio, NUMERODOC AS Numero_Documento, BIS AS Bis_Documento, DATADOC	AS Data_Documento, COSTOUNIEURODIBARESA AS Costo_Unitario_DiBa_Resa, 
		   COSTOTOTEURODIBARESA AS Costo_Totale_DiBa_Resa, ANNOCOMPETENZA AS Anno_Competenza, SpeseImballo AS Spese_Imballo, SpeseTrasporto AS Spese_Trasporto, 
		   ScontoIncondizionato AS Sconti_Piede, SpeseEffetto AS Spese_Effetto, SpeseDocumento AS Spese_Documento, ARTICOLOALTERNATIVO AS Articolo_Alternativo 
	FROM FRCDatiVenditeBudget

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaDatiVenditeBudget] TO [Metodo98]
    AS [dbo];

