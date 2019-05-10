
CREATE VIEW [dbo].[FRCVistaBI_DataWareHouse]
AS
SELECT        dbo.FRCBusinessIntelligence.AMBIENTE, dbo.FRCBusinessIntelligence.ANNODOC, dbo.FRCBusinessIntelligence.MESEDOC, 
                         dbo.FRCBusinessIntelligence.ANNOCOMPETENZA AS ANNOCOMP, dbo.FRCBusinessIntelligence.MESEDOCUMENTO AS MESECOMP, 
                         dbo.FRCBusinessIntelligence.IDTESTA, dbo.FRCBusinessIntelligence.IDRIGA, dbo.FRCBusinessIntelligence.TIPODOC, dbo.FRCBusinessIntelligence.NUMERODOC, 
                         dbo.FRCBusinessIntelligence.DATADOC, RIGHT(dbo.TABCENTRICOSTO.DESCRIZIONE, 150) + ' - ' + RIGHT(dbo.FRCBusinessIntelligence.CONTOCDC, 10) 
                         AS CDCosto, RIGHT(TABCENTRICOSTO_2.DESCRIZIONE, 150) + ' - ' + RIGHT(dbo.FRCBusinessIntelligence.CDRMercato, 10) AS CDRMercato, 
                         RIGHT(TABCENTRICOSTO_1.DESCRIZIONE, 150) + ' - ' + RIGHT(dbo.FRCBusinessIntelligence.CDRProdotto, 10) AS CDRProdotto, 
                         dbo.FRCBusinessIntelligence.CLIENTE, RIGHT(dbo.FRCBusinessIntelligence.DESCSETTCLI, 150) + ' - ' + RIGHT(dbo.FRCBusinessIntelligence.CODSETTORE, 10) 
                         AS SETTORE, RIGHT(dbo.FRCBusinessIntelligence.DESCZONACLI, 150) + ' - ' + RIGHT(dbo.FRCBusinessIntelligence.CODZONA, 10) AS ZONA, 
                         RIGHT(dbo.FRCBusinessIntelligence.DESCCATCLI, 150) + ' - ' + RIGHT(dbo.FRCBusinessIntelligence.CODCATEGORIA, 10) AS CATCLIENTE, 
                         dbo.FRCBusinessIntelligence.LOCALITA, dbo.FRCBusinessIntelligence.PROVINCIA, RIGHT(dbo.TABREGIONI.DESCRIZIONE, 150) 
                         + ' - ' + RIGHT(dbo.FRCBusinessIntelligence.CODREGIONE, 10) AS REGIONE, RIGHT(dbo.TABNAZIONI.DESCRIZIONE, 150) 
                         + ' - ' + RIGHT(dbo.FRCBusinessIntelligence.CODNAZIONE, 10) AS NAZIONE, dbo.FRCBusinessIntelligence.CODICEISO, dbo.FRCBusinessIntelligence.AGENTE1, 
                         dbo.FRCBusinessIntelligence.AGENTE2, dbo.FRCBusinessIntelligence.AGENTE3, dbo.FRCBusinessIntelligence.ARTICOLO, 
                         RIGHT(dbo.FRCBusinessIntelligence.DESCGRPART, 150) + ' - ' + RIGHT(dbo.FRCBusinessIntelligence.GRUPPO, 10) AS GRUPPO, 
                         RIGHT(dbo.FRCBusinessIntelligence.DESCCATART, 150) + ' - ' + RIGHT(dbo.FRCBusinessIntelligence.CATEGORIA, 10) AS CATARTICOLO, 
                         RIGHT(dbo.FRCBusinessIntelligence.DESCCATSTATART, 150) + ' - ' + RIGHT(dbo.FRCBusinessIntelligence.CODCATEGORIASTAT, 10) AS CATSTATISTICA, 
                         RIGHT(dbo.FRCBusinessIntelligence.DESCSERIEART, 150) + ' - ' + RIGHT(dbo.FRCBusinessIntelligence.SERIE, 10) AS SERIE, 
                         RIGHT(dbo.FRCBusinessIntelligence.DESCMODART, 150) + ' - ' + RIGHT(dbo.FRCBusinessIntelligence.MODELLO, 10) AS MODELLO, 
                         RIGHT(dbo.FRCBusinessIntelligence.DESCGENCONTROP, 150) + ' - ' + RIGHT(dbo.FRCBusinessIntelligence.GENCONTROP, 10) AS CODCONTO, 
                         dbo.FRCBusinessIntelligence.UMGEST, dbo.FRCBusinessIntelligence.QTAGEST, dbo.FRCBusinessIntelligence.UMPREZZO, 
                         dbo.FRCBusinessIntelligence.QTAPREZZO, dbo.FRCBusinessIntelligence.TOTLORDORIGAEURO, dbo.FRCBusinessIntelligence.TOTSCONTORIGAEURO, 
                         dbo.FRCBusinessIntelligence.TOTNETTORIGAEURO, 
                         dbo.FRCBusinessIntelligence.TOTPROVVAGEURO1 + dbo.FRCBusinessIntelligence.TOTPROVVAGEURO2 + dbo.FRCBusinessIntelligence.TOTPROVVAGEURO3 AS PROVVIGIONI,
                          dbo.FRCBusinessIntelligence.CostiDirettiCommerciali, dbo.FRCBusinessIntelligence.COSTOTOTEURODIBA, 
                         dbo.FRCBusinessIntelligence.COSTOTOTEURODIBARESA, 
                         dbo.FRCBusinessIntelligence.CostoTrasfVarSetup + dbo.FRCBusinessIntelligence.CostoTrasfVarUomo + dbo.FRCBusinessIntelligence.CostoTrasfVarMacchina AS COSTOTRASFVARIABILE,
                          dbo.FRCBusinessIntelligence.CostoTrasfFisSetup + dbo.FRCBusinessIntelligence.CostoTrasfFisUomo + dbo.FRCBusinessIntelligence.CostoTrasfFisMacchina AS COSTOTRASFFISSO,
                          dbo.FRCBusinessIntelligence.CostoTrasfVarSetup + dbo.FRCBusinessIntelligence.CostoTrasfVarUomo + dbo.FRCBusinessIntelligence.CostoTrasfVarMacchina + dbo.FRCBusinessIntelligence.CostoTrasfFisSetup
                          + dbo.FRCBusinessIntelligence.CostoTrasfFisUomo + dbo.FRCBusinessIntelligence.CostoTrasfFisMacchina AS COSTOTRASFINTERNO, 
                         dbo.FRCBusinessIntelligence.CostoTrasfEsterno, dbo.FRCBusinessIntelligence.CostiFissiDirettiCommessa, 
                         dbo.FRCBusinessIntelligence.CostiVariabiliDirettiCommessa, dbo.FRCBusinessIntelligence.CostoStruttura01, dbo.FRCBusinessIntelligence.CostoStruttura02, 
                         dbo.FRCBusinessIntelligence.CostoStruttura03, dbo.FRCBusinessIntelligence.CostoStruttura04, dbo.FRCBusinessIntelligence.CostoStruttura05, 
                         dbo.FRCBusinessIntelligence.CostoStruttura06, dbo.FRCBusinessIntelligence.CostoStruttura07, dbo.FRCBusinessIntelligence.CostoStruttura08, 
                         dbo.FRCBusinessIntelligence.CostoStruttura09, dbo.FRCBusinessIntelligence.CostoStruttura10, dbo.FRCBusinessIntelligence.CostoStruttura11, 
                         dbo.FRCBusinessIntelligence.CostoStruttura12, dbo.FRCBusinessIntelligence.CostoStruttura13, dbo.FRCBusinessIntelligence.CostoStruttura14, 
                         dbo.FRCBusinessIntelligence.CostoStruttura15, dbo.FRCBusinessIntelligence.CostoStruttura16, dbo.FRCBusinessIntelligence.CostoStruttura17, 
                         dbo.FRCBusinessIntelligence.CostoStruttura18, dbo.FRCBusinessIntelligence.CostoStruttura19, dbo.FRCBusinessIntelligence.CostoStruttura20, 
                         dbo.FRCBusinessIntelligence.CostoStruttura21, dbo.FRCBusinessIntelligence.CostoStruttura22, dbo.FRCBusinessIntelligence.CostoStruttura23, 
                         dbo.FRCBusinessIntelligence.CostoStruttura24, dbo.FRCBusinessIntelligence.CostoStruttura25, dbo.FRCBusinessIntelligence.CostoStruttura26, 
                         dbo.FRCBusinessIntelligence.CostoStruttura27, dbo.FRCBusinessIntelligence.CostoStruttura28, dbo.FRCBusinessIntelligence.CostoStruttura29, 
                         dbo.FRCBusinessIntelligence.CostoStruttura30, dbo.FRCBusinessIntelligence.SpeseImballo, dbo.FRCBusinessIntelligence.SpeseTrasporto, 
                         dbo.FRCBusinessIntelligence.ScontoIncondizionato, dbo.FRCBusinessIntelligence.SpeseEffetto, dbo.FRCBusinessIntelligence.SpeseDocumento, 
                         RIGHT(dbo.FRCBusinessIntelligence.ARTICOLOALTERNATIVO, 50) + ' - ' + RIGHT(dbo.ANAGRAFICAARTICOLI.DESCRIZIONE, 150) AS ARTICOLOALTERNATIVO, 
                         dbo.FRCBusinessIntelligence.CostoStruttura01 + dbo.FRCBusinessIntelligence.CostoStruttura02 + dbo.FRCBusinessIntelligence.CostoStruttura03 + dbo.FRCBusinessIntelligence.CostoStruttura04
                          + dbo.FRCBusinessIntelligence.CostoStruttura05 + dbo.FRCBusinessIntelligence.CostoStruttura06 + dbo.FRCBusinessIntelligence.CostoStruttura07 + dbo.FRCBusinessIntelligence.CostoStruttura08
                          + dbo.FRCBusinessIntelligence.CostoStruttura09 + dbo.FRCBusinessIntelligence.CostoStruttura10 + dbo.FRCBusinessIntelligence.CostoStruttura11 + dbo.FRCBusinessIntelligence.CostoStruttura12
                          + dbo.FRCBusinessIntelligence.CostoStruttura13 + dbo.FRCBusinessIntelligence.CostoStruttura14 + dbo.FRCBusinessIntelligence.CostoStruttura15 + dbo.FRCBusinessIntelligence.CostoStruttura16
                          + dbo.FRCBusinessIntelligence.CostoStruttura17 + dbo.FRCBusinessIntelligence.CostoStruttura18 + dbo.FRCBusinessIntelligence.CostoStruttura19 + dbo.FRCBusinessIntelligence.CostoStruttura20
                          + dbo.FRCBusinessIntelligence.CostoStruttura21 + dbo.FRCBusinessIntelligence.CostoStruttura22 + dbo.FRCBusinessIntelligence.CostoStruttura23 + dbo.FRCBusinessIntelligence.CostoStruttura24
                          + dbo.FRCBusinessIntelligence.CostoStruttura25 + dbo.FRCBusinessIntelligence.CostoStruttura26 + dbo.FRCBusinessIntelligence.CostoStruttura27 + dbo.FRCBusinessIntelligence.CostoStruttura28
                          + dbo.FRCBusinessIntelligence.CostoStruttura29 + dbo.FRCBusinessIntelligence.CostoStruttura30 AS COSTOSTRUTTOTALE, 
                         dbo.FRCBusinessIntelligence.PROVVIGIONE_SPEC AS ProvvigioneSpecifica, dbo.FRCBusinessIntelligence.CONTRIBUTO_PERC AS ContributoPercentuale, 
                         dbo.FRCBusinessIntelligence.CONTRIBUTO_EURO AS ContributoEuro, dbo.FRCBusinessIntelligence.OMAGGI_CLIENTI AS OmaggiClienti, 
                         dbo.FRCBusinessIntelligence.PREMIO_CLIENTI AS PremioClienti, dbo.FRCBusinessIntelligence.PREMIO_AGENTI AS PremioAgenti, 
                         dbo.FRCBusinessIntelligence.SCONTO_COMMERCIALE AS ScontoCommerciale, dbo.FRCBusinessIntelligence.TRASPORTO_VENDITA AS TrasportoVendita, 
                         dbo.FRCBusinessIntelligence.LOGISTICA, dbo.FRCBusinessIntelligence.VARIE_COMMERCIALI AS VarieCommerciali, 
                         dbo.FRCBusinessIntelligence.AMM_SPECIFICI AS AmmortamentiSpecifici, dbo.FRCBusinessIntelligence.STAMPI_SPECIFICI AS StampiSpecifici, 
                         dbo.FRCBusinessIntelligence.BREVETTI_PLURIENNALI AS BrevettiPluriennali, dbo.FRCBusinessIntelligence.BREVETTI_ANNUALI AS BrevettiAnnuali, 
                         dbo.FRCBusinessIntelligence.VARIE_INDUSTRIALI AS VarieIndustriali
FROM            dbo.FRCBusinessIntelligence LEFT OUTER JOIN
                         dbo.ANAGRAFICAARTICOLI ON dbo.FRCBusinessIntelligence.ARTICOLOALTERNATIVO = dbo.ANAGRAFICAARTICOLI.CODICE LEFT OUTER JOIN
                         dbo.TABCENTRICOSTO ON dbo.FRCBusinessIntelligence.CONTOCDC = dbo.TABCENTRICOSTO.CODICE LEFT OUTER JOIN
                         dbo.TABNAZIONI ON dbo.FRCBusinessIntelligence.CODNAZIONE = dbo.TABNAZIONI.CODICE LEFT OUTER JOIN
                         dbo.TABCENTRICOSTO AS TABCENTRICOSTO_1 ON dbo.FRCBusinessIntelligence.CDRProdotto = TABCENTRICOSTO_1.CODICE LEFT OUTER JOIN
                         dbo.TABREGIONI ON dbo.FRCBusinessIntelligence.CODREGIONE = dbo.TABREGIONI.CODICE LEFT OUTER JOIN
                         dbo.TABCENTRICOSTO AS TABCENTRICOSTO_2 ON dbo.FRCBusinessIntelligence.CDRMercato = TABCENTRICOSTO_2.CODICE


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaBI_DataWareHouse] TO [Metodo98]
    AS [dbo];

