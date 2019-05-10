
CREATE VIEW dbo.SL_VistaTblTesteImportDocFW_GEMMA
AS
SELECT     dbo.SL_ImportDocFWTestedoc_GEMMA.IdTesta, dbo.SL_ImportDocFWTestedoc_GEMMA.DataDoc, 
                      dbo.SL_ImportDocFWTestedoc_GEMMA.NUMRIFDOC, dbo.SL_ImportDocFWTestedoc_GEMMA.CodCliente, dbo.ANAGRAFICACF.DSCCONTO1, 
                      dbo.SL_ImportDocFWTestedoc_GEMMA.CodAgente1, dbo.SL_ImportDocFWTestedoc_GEMMA.CodAgente2, 
                      dbo.SL_ImportDocFWTestedoc_GEMMA.CodAgente3, dbo.SL_ImportDocFWTestedoc_GEMMA.CodPag
FROM         dbo.TABUTENTI INNER JOIN
                      dbo.SL_ImportDocFWTestedoc_GEMMA INNER JOIN
                      dbo.ANAGRAFICACF ON dbo.SL_ImportDocFWTestedoc_GEMMA.CodCliente = dbo.ANAGRAFICACF.CODCONTO ON 
                      dbo.TABUTENTI.USERID = dbo.SL_ImportDocFWTestedoc_GEMMA.UTENTEMODIFICA
WHERE     (dbo.SL_ImportDocFWTestedoc_GEMMA.MovPnImportato = 0) AND (dbo.TABUTENTI.USERDB = USER_NAME())


GO
GRANT DELETE
    ON OBJECT::[dbo].[SL_VistaTblTesteImportDocFW_GEMMA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SL_VistaTblTesteImportDocFW_GEMMA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SL_VistaTblTesteImportDocFW_GEMMA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SL_VistaTblTesteImportDocFW_GEMMA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SL_VistaTblTesteImportDocFW_GEMMA] TO [Metodo98]
    AS [dbo];

