﻿CREATE VIEW dbo.Ald_VistaCCBILANCIOCONSLAVEST_DaDocumenti
AS
SELECT     dbo.AnagraficaCommesse.RifComm, dbo.AnagraficaCommesse.Progressivo, dbo.ALD_TabClassiArtProdotto.TipoClasse, 
                      dbo.RIGHEDOCUMENTI.IDTESTA, dbo.RIGHEDOCUMENTI.IDRIGA, dbo.RIGHEDOCUMENTI.ESERCIZIO, dbo.RIGHEDOCUMENTI.TIPODOC, 
                      dbo.RIGHEDOCUMENTI.NUMERODOC, dbo.RIGHEDOCUMENTI.CODART, dbo.RIGHEDOCUMENTI.RIGACHIUSA, 
                      dbo.RIGHEDOCUMENTI.TOTNETTORIGA, dbo.RIGHEDOCUMENTI.TOTNETTORIGARES, dbo.RIGHEDOCUMENTI.IDTESTARP, 
                      dbo.RIGHEDOCUMENTI.IDRIGARP, RIGHEDOCUMENTI_1.TIPODOC AS TipoDocPrel, 
                      CASE WHEN RIGHEDOCUMENTI.TIPODOC = '1SE' THEN 'Previsto' ELSE CASE WHEN RIGHEDOCUMENTI.TIPODOC = '1OS' THEN 'Ordinato' ELSE CASE
                       WHEN RIGHEDOCUMENTI.TIPODOC = '2SE' THEN 'Consuntivo' ELSE CASE WHEN (RIGHEDOCUMENTI.TIPODOC = 'FTA' OR
                      RIGHEDOCUMENTI.TIPODOC = 'FAA' OR
                      RIGHEDOCUMENTI.TIPODOC = 'FTI') AND 
                      RIGHEDOCUMENTI.IDRIGARP = 0 THEN 'Fatturato NON Previsto' ELSE CASE WHEN (RIGHEDOCUMENTI.TIPODOC = 'FTA' OR
                      RIGHEDOCUMENTI.TIPODOC = 'FAA' OR
                      RIGHEDOCUMENTI.TIPODOC = 'FTI') AND 
                      RIGHEDOCUMENTI_1.TIPODOC = '1OS' THEN 'Fatturato Senza Consuntivo' ELSE CASE WHEN (RIGHEDOCUMENTI.TIPODOC = 'NDF' OR
                      RIGHEDOCUMENTI.TIPODOC = 'NAA') THEN 'NotaAccrFornitore' END END END END END END AS NaturaRiga, 
                      CASE WHEN RIGHEDOCUMENTI.TIPODOC = '1OS' THEN 'Ordinato' ELSE CASE WHEN RIGHEDOCUMENTI.TIPODOC = '2SE' THEN 'Consuntivo' ELSE CASE
                       WHEN (RIGHEDOCUMENTI.TIPODOC = 'FTA' OR
                      RIGHEDOCUMENTI.TIPODOC = 'FAA' OR
                      RIGHEDOCUMENTI.TIPODOC = 'FTI') THEN 'Fatturato' ELSE CASE WHEN (RIGHEDOCUMENTI.TIPODOC = 'NDF' OR
                      RIGHEDOCUMENTI.TIPODOC = 'NAA') THEN 'NotaAccrFornitore' END END END END AS NaturaRigaCONTABILITA
FROM         dbo.AnagraficaCommesse INNER JOIN
                      dbo.TABCATEGORIE INNER JOIN
                      dbo.ALD_TabClassiArtProdotto ON dbo.TABCATEGORIE.ClasseArticoloID = dbo.ALD_TabClassiArtProdotto.ClasseArticoloId INNER JOIN
                      dbo.ANAGRAFICAARTICOLI ON dbo.TABCATEGORIE.CODICE = dbo.ANAGRAFICAARTICOLI.CATEGORIA INNER JOIN
                      dbo.RIGHEDOCUMENTI ON dbo.ANAGRAFICAARTICOLI.CODICE = dbo.RIGHEDOCUMENTI.CODART ON 
                      dbo.AnagraficaCommesse.RifComm = dbo.RIGHEDOCUMENTI.RIFCOMMCLI LEFT OUTER JOIN
                      dbo.RIGHEDOCUMENTI RIGHEDOCUMENTI_1 ON dbo.RIGHEDOCUMENTI.IDTESTARP = RIGHEDOCUMENTI_1.IDTESTA AND 
                      dbo.RIGHEDOCUMENTI.IDRIGARP = RIGHEDOCUMENTI_1.IDRIGA
WHERE     (dbo.ALD_TabClassiArtProdotto.TipoClasse = 'EST')

GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_VistaCCBILANCIOCONSLAVEST_DaDocumenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_VistaCCBILANCIOCONSLAVEST_DaDocumenti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Ald_VistaCCBILANCIOCONSLAVEST_DaDocumenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistaCCBILANCIOCONSLAVEST_DaDocumenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_VistaCCBILANCIOCONSLAVEST_DaDocumenti] TO [Metodo98]
    AS [dbo];

