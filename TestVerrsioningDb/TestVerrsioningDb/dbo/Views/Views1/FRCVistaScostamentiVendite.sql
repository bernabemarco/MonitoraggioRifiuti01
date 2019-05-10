

CREATE VIEW [dbo].[FRCVistaScostamentiVendite]
AS
SELECT        dbo.FRCScostamentiVendite.ID, dbo.FRCScostamentiVendite.ANNO, dbo.FRCScostamentiVendite.MESEINIZIO AS Mese_Inizio, 
                         dbo.FRCScostamentiVendite.MESEFINE AS Mese_Fine, dbo.FRCScostamentiVendite.CODCLIFOR AS Cliente, 
                         dbo.FRCScostamentiVendite.DSCCONTO1 AS Ragione_Sociale, dbo.FRCScostamentiVendite.CODSETTORE AS Settore, 
                         dbo.FRCScostamentiVendite.DESCSETTCLI AS Descrizione_Settore, dbo.FRCScostamentiVendite.CODZONA AS Zona, 
                         dbo.FRCScostamentiVendite.DESCZONACLI AS Descrizione_Zona, dbo.FRCScostamentiVendite.CODCATEGORIA AS Categoria_Cliente, 
                         dbo.FRCScostamentiVendite.DESCCATCLI AS Descrizione_Categoria_Cliente, dbo.FRCScostamentiVendite.LOCALITA AS [Localita'], 
                         dbo.FRCScostamentiVendite.PROVINCIA, dbo.FRCScostamentiVendite.CODNAZIONE AS Nazione, dbo.FRCScostamentiVendite.NAZIONE AS Descrizione_Nazione, 
                         dbo.FRCScostamentiVendite.CODICEISO, dbo.FRCScostamentiVendite.CODREGIONE AS Codice_Regione, dbo.FRCScostamentiVendite.CODAGENTE1 AS Agente1, 
                         dbo.FRCScostamentiVendite.DSCAGENTE1 AS Nome_Agente1, dbo.FRCScostamentiVendite.CODAGENTE2 AS Agente2, 
                         dbo.FRCScostamentiVendite.DSCAGENTE2 AS Nome_Agente2, dbo.FRCScostamentiVendite.CODAGENTE3 AS Agente3, 
                         dbo.FRCScostamentiVendite.DSCAGENTE3 AS Nome_Agente3, dbo.FRCScostamentiVendite.CODART AS Articolo, 
                         dbo.FRCScostamentiVendite.DESCRIZIONE AS Descrizione_Articolo, dbo.FRCScostamentiVendite.ARTICOLOALTERNATIVO AS Articolo_Alternativo, 
                         dbo.ANAGRAFICAARTICOLI.DESCRIZIONE AS Descrizione_ArtAlternativo, dbo.FRCScostamentiVendite.GRUPPO, 
                         dbo.FRCScostamentiVendite.DESCGRPART AS Descrizione_Gruppo, dbo.FRCScostamentiVendite.CATEGORIA AS Categoria_Articolo, 
                         dbo.FRCScostamentiVendite.DESCCATART AS Descrizione_Categoria_Articolo, dbo.FRCScostamentiVendite.GENCONTROP AS Contropartita, 
                         dbo.FRCScostamentiVendite.DESCGENCONTROP AS Descrizione_Contropartita, dbo.FRCScostamentiVendite.CODCATEGORIASTAT AS Categoria_Statistica_Articolo, 
                         dbo.FRCScostamentiVendite.DESCCATSTATART AS Descrizione_Categoria_Statistica_Articolo, dbo.FRCScostamentiVendite.SERIE, 
                         dbo.FRCScostamentiVendite.DESCSERIEART AS Descrizione_Serie, dbo.FRCScostamentiVendite.MODELLO, 
                         dbo.FRCScostamentiVendite.DESCMODART AS Descrizione_Modello, dbo.FRCScostamentiVendite.CONTOCDC AS Codice_Centro, 
                         dbo.FRCScostamentiVendite.DESCCONTOCDC AS Descrizione_Centro, dbo.FRCScostamentiVendite.CDRMercato AS CDR_Mercato, 
                         dbo.FRCScostamentiVendite.DescCDRMercato AS Descrizione_CDR_Mercato, dbo.FRCScostamentiVendite.CDRProdotto AS CDR_Prodotto, 
                         dbo.FRCScostamentiVendite.DescCDRProdotto AS Descrizione_CDR_Prodotto, dbo.FRCScostamentiVendite.UM_BASE, 
                         dbo.FRCScostamentiVendite.AMBIENTE1 AS Ambiente_1, ISNULL
                             ((SELECT        Descrizione
                                 FROM            dbo.CGesAmbienti
                                 WHERE        (Codice = dbo.FRCScostamentiVendite.AMBIENTE1)), '') AS Descrizione_Ambiente_1, dbo.FRCScostamentiVendite.QTABASE1 AS [Quantita'_Base_1], 
                         dbo.FRCScostamentiVendite.PREZZO1 AS Prezzo_Unitario_1, dbo.FRCScostamentiVendite.TOTALENETTO1 AS Totale_Netto_1, 
                         dbo.FRCScostamentiVendite.AMBIENTE2 AS Ambiente_2, ISNULL
                             ((SELECT        Descrizione
                                 FROM            dbo.CGesAmbienti AS CGesAmbienti_1
                                 WHERE        (Codice = dbo.FRCScostamentiVendite.AMBIENTE2)), '') AS Descrizione_Ambiente_2, dbo.FRCScostamentiVendite.QTABASE2 AS [Quantita'_Base_2], 
                         dbo.FRCScostamentiVendite.PREZZO2 AS Prezzo_Unitario_2, dbo.FRCScostamentiVendite.TOTALENETTO2 AS Totale_Netto_2, 
                         dbo.FRCScostamentiVendite.DELTATOTALE AS Delta_Totale, dbo.FRCScostamentiVendite.DELTAVOLUME AS Delta_Volume, 
                         dbo.FRCScostamentiVendite.DELTAPREZZO AS Delta_Prezzo
FROM            dbo.FRCScostamentiVendite LEFT OUTER JOIN
                         dbo.ANAGRAFICAARTICOLI ON dbo.FRCScostamentiVendite.ARTICOLOALTERNATIVO = dbo.ANAGRAFICAARTICOLI.CODICE


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaScostamentiVendite] TO [Metodo98]
    AS [dbo];

