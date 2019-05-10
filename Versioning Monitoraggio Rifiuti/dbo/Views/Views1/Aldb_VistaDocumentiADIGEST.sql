CREATE VIEW [dbo].[Aldb_VistaDocumentiADIGEST]
AS
SELECT     td.PROGRESSIVO, td.TIPODOC, td.NUMERODOC, td.DATADOC, td.NUMRIFDOC, td.DATARIFDOC, td.ESERCIZIO, td.CODCLIFOR, RTRIM(ISNULL(ac.DSCCONTO1,'')) 
                      + ' ' + RTRIM(ISNULL(ac.DSCCONTO2,'')) AS RagSoc, ac.INDIRIZZO, ac.CAP, ac.LOCALITA, ac.PROVINCIA, ac.PARTITAIVA, ac.CODFISCALE, td.ANNOTAZIONI, 
                      td.TOTDOCUMENTOEURO, pd.TIPO, td.CODAGENTE1, isnull(ag.DSCAGENTE,'') as DSCAGENTE1, pd.MODULOSTAMPA
FROM         dbo.TESTEDOCUMENTI td INNER JOIN
                      dbo.ANAGRAFICACF ac ON td.CODCLIFOR = ac.CODCONTO INNER JOIN
                      dbo.PARAMETRIDOC pd ON td.TIPODOC = pd.CODICE LEFT OUTER JOIN
                      dbo.ANAGRAFICAAGENTI ag ON td.CODAGENTE1 = ag.CODAGENTE




GO
GRANT DELETE
    ON OBJECT::[dbo].[Aldb_VistaDocumentiADIGEST] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Aldb_VistaDocumentiADIGEST] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Aldb_VistaDocumentiADIGEST] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Aldb_VistaDocumentiADIGEST] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Aldb_VistaDocumentiADIGEST] TO [Metodo98]
    AS [dbo];

