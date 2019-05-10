
CREATE VIEW dbo.SL_VistaTblImportDocFW
AS
SELECT     dbo.SL_ImportDocFWTestedoc.IdTesta, dbo.SL_ImportDocFWTestedoc.DataDoc, dbo.SL_ImportDocFWTestedoc.NUMRIFDOC, 
                      dbo.SL_ImportDocFWTestedoc.CodCliente, dbo.ANAGRAFICACF.DSCCONTO1, dbo.SL_ImportDocFWTestedoc.CodAgente1, 
                      dbo.SL_ImportDocFWTestedoc.CodAgente2, dbo.SL_ImportDocFWTestedoc.CodAgente3, dbo.SL_ImportDocFWTestedoc.CodPag, 
                      dbo.SL_ImportDocFWTestedoc.UTENTEMODIFICA, dbo.SL_ImportDocFWRighedoc.IdRiga, dbo.SL_ImportDocFWRighedoc.TipoRiga, 
                      dbo.SL_ImportDocFWRighedoc.CodArticolo, dbo.SL_ImportDocFWRighedoc.DescrizioneRiga, dbo.SL_ImportDocFWRighedoc.Quantità, 
                      dbo.SL_ImportDocFWRighedoc.PrezzoUnitario, dbo.SL_ImportDocFWRighedoc.Sconto, dbo.SL_ImportDocFWRighedoc.Provv1, 
                      dbo.SL_ImportDocFWRighedoc.Provv2, dbo.SL_ImportDocFWRighedoc.Provv3, 
                      dbo.SL_ImportDocFWRighedoc.PrezzoUnitario * (100 - dbo.SL_ImportDocFWRighedoc.Sconto) 
                      / 100 * dbo.SL_ImportDocFWRighedoc.Quantità AS TotaleRiga
FROM         dbo.SL_ImportDocFWTestedoc INNER JOIN
                      dbo.SL_ImportDocFWRighedoc ON dbo.SL_ImportDocFWTestedoc.IdTesta = dbo.SL_ImportDocFWRighedoc.IdTesta AND 
                      dbo.SL_ImportDocFWTestedoc.UTENTEMODIFICA = dbo.SL_ImportDocFWRighedoc.UTENTEMODIFICA INNER JOIN
                      dbo.ANAGRAFICACF ON dbo.SL_ImportDocFWTestedoc.CodCliente = dbo.ANAGRAFICACF.CODCONTO
WHERE     (dbo.SL_ImportDocFWTestedoc.MovPnImportato = 0)


GO
GRANT DELETE
    ON OBJECT::[dbo].[SL_VistaTblImportDocFW] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SL_VistaTblImportDocFW] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SL_VistaTblImportDocFW] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SL_VistaTblImportDocFW] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SL_VistaTblImportDocFW] TO [Metodo98]
    AS [dbo];

