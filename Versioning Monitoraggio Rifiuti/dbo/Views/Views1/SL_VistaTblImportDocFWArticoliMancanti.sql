
CREATE VIEW dbo.SL_VistaTblImportDocFWArticoliMancanti
AS
SELECT     dbo.SL_ImportDocFWRighedoc.CodArticolo, dbo.SL_ImportDocFWRighedoc.DescrizioneRiga, dbo.SL_ImportDocFWRighedoc.UTENTEMODIFICA
FROM         dbo.SL_ImportDocFWRighedoc LEFT OUTER JOIN
                      dbo.ANAGRAFICAARTICOLI ON dbo.SL_ImportDocFWRighedoc.CodArticolo = dbo.ANAGRAFICAARTICOLI.CODICE
WHERE     (dbo.SL_ImportDocFWRighedoc.TipoRiga = 'N') AND (dbo.ANAGRAFICAARTICOLI.CODICE IS NULL)
GROUP BY dbo.SL_ImportDocFWRighedoc.CodArticolo, dbo.SL_ImportDocFWRighedoc.DescrizioneRiga, dbo.SL_ImportDocFWRighedoc.UTENTEMODIFICA


GO
GRANT DELETE
    ON OBJECT::[dbo].[SL_VistaTblImportDocFWArticoliMancanti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SL_VistaTblImportDocFWArticoliMancanti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SL_VistaTblImportDocFWArticoliMancanti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SL_VistaTblImportDocFWArticoliMancanti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SL_VistaTblImportDocFWArticoliMancanti] TO [Metodo98]
    AS [dbo];

