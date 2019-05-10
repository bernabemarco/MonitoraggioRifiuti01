
CREATE VIEW dbo.SL_VistaTblImportDocFW_GEMMA
AS
SELECT     dbo.SL_ImportDocFWTestedoc_GEMMA.IdTesta, dbo.SL_ImportDocFWTestedoc_GEMMA.DataDoc, 
                      dbo.SL_ImportDocFWTestedoc_GEMMA.NUMRIFDOC, dbo.SL_ImportDocFWTestedoc_GEMMA.CodCliente, dbo.ANAGRAFICACF.DSCCONTO1, 
                      dbo.SL_ImportDocFWTestedoc_GEMMA.CodAgente1, dbo.SL_ImportDocFWTestedoc_GEMMA.CodAgente2, 
                      dbo.SL_ImportDocFWTestedoc_GEMMA.CodAgente3, dbo.SL_ImportDocFWTestedoc_GEMMA.CodPag, dbo.SL_ImportDocFWRighedoc_GEMMA.IdRiga, 
                      dbo.SL_ImportDocFWRighedoc_GEMMA.TipoRiga, dbo.SL_ImportDocFWRighedoc_GEMMA.CodArticolo, 
                      dbo.SL_ImportDocFWRighedoc_GEMMA.DescrizioneRiga, dbo.SL_ImportDocFWRighedoc_GEMMA.Quantità, 
                      dbo.SL_ImportDocFWRighedoc_GEMMA.PrezzoUnitario, dbo.SL_ImportDocFWRighedoc_GEMMA.Sconto, 
                      dbo.SL_ImportDocFWRighedoc_GEMMA.Provv1, dbo.SL_ImportDocFWRighedoc_GEMMA.Provv2, dbo.SL_ImportDocFWRighedoc_GEMMA.Provv3, 
                      dbo.SL_ImportDocFWRighedoc_GEMMA.PrezzoUnitario * (100 - dbo.SL_ImportDocFWRighedoc_GEMMA.Sconto) 
                      / 100 * dbo.SL_ImportDocFWRighedoc_GEMMA.Quantità AS TotaleRiga
FROM         dbo.SL_ImportDocFWTestedoc_GEMMA INNER JOIN
                      dbo.SL_ImportDocFWRighedoc_GEMMA ON 
                      dbo.SL_ImportDocFWTestedoc_GEMMA.IdTesta = dbo.SL_ImportDocFWRighedoc_GEMMA.IdTesta INNER JOIN
                      dbo.ANAGRAFICACF ON dbo.SL_ImportDocFWTestedoc_GEMMA.CodCliente = dbo.ANAGRAFICACF.CODCONTO INNER JOIN
                      dbo.TABUTENTI ON dbo.SL_ImportDocFWTestedoc_GEMMA.UTENTEMODIFICA = dbo.TABUTENTI.USERID
WHERE     (dbo.SL_ImportDocFWTestedoc_GEMMA.MovPnImportato = 0) AND (dbo.TABUTENTI.USERDB = USER_NAME())


GO
GRANT DELETE
    ON OBJECT::[dbo].[SL_VistaTblImportDocFW_GEMMA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SL_VistaTblImportDocFW_GEMMA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SL_VistaTblImportDocFW_GEMMA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SL_VistaTblImportDocFW_GEMMA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SL_VistaTblImportDocFW_GEMMA] TO [Metodo98]
    AS [dbo];

