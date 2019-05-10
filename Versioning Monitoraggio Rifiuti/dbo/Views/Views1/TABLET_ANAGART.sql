

CREATE VIEW dbo.TABLET_ANAGART
AS
SELECT     dbo.ANAGRAFICAARTICOLI.*, dbo.ANAGRAFICAARTICOLICOMM.GRUPPOPRZPART AS GRUPPOPRZPART, 
                      dbo.TP_ExtraMag.CodFamigliaPOS AS CodFamigliaPOS, dbo.TP_ExtraMag.CodRepartoPOS AS CodRepartoPOS, 
                      dbo.ANAGRAFICAARTICOLICOMM.ESERCIZIO AS ESERCIZIO, dbo.TabFamigliePOS.Descrizione AS DescrizioneFamiglia, 
                      dbo.TabRepartiPOS.Descrizione AS DescrizioneReparto, dbo.TABGRUPPI.DESCRIZIONE AS DscGruppo, 
                      dbo.TABCATEGORIE.DESCRIZIONE AS DscCategoria, dbo.TABCATEGORIESTAT.DESCRIZIONE AS DscCategoriaStat, 
                      dbo.ANAGRAFICAARTICOLICOMM.CODICEART AS CODARTICOLO
FROM         dbo.TP_ExtraMag LEFT OUTER JOIN
                      dbo.TabRepartiPOS ON dbo.TP_ExtraMag.CodRepartoPOS = dbo.TabRepartiPOS.Codice LEFT OUTER JOIN
                      dbo.TabFamigliePOS ON dbo.TP_ExtraMag.CodFamigliaPOS = dbo.TabFamigliePOS.Codice RIGHT OUTER JOIN
                      dbo.ANAGRAFICAARTICOLICOMM RIGHT OUTER JOIN
                      dbo.TABCATEGORIESTAT RIGHT OUTER JOIN
                      dbo.ANAGRAFICAARTICOLI LEFT OUTER JOIN
                      dbo.TABCATEGORIE ON dbo.ANAGRAFICAARTICOLI.CATEGORIA = dbo.TABCATEGORIE.CODICE LEFT OUTER JOIN
                      dbo.TABGRUPPI ON dbo.ANAGRAFICAARTICOLI.GRUPPO = dbo.TABGRUPPI.CODICE ON 
                      dbo.TABCATEGORIESTAT.CODICE = dbo.ANAGRAFICAARTICOLI.CODCATEGORIASTAT ON 
                      dbo.ANAGRAFICAARTICOLICOMM.CODICEART = dbo.ANAGRAFICAARTICOLI.CODICE ON dbo.TP_ExtraMag.CodArt = dbo.ANAGRAFICAARTICOLI.CODICE


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABLET_ANAGART] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABLET_ANAGART] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABLET_ANAGART] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABLET_ANAGART] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABLET_ANAGART] TO [Metodo98]
    AS [dbo];

