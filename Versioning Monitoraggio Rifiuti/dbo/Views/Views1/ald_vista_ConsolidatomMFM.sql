
CREATE VIEW dbo.ald_vista_ConsolidatomMFM
AS
SELECT     DB_NAME() AS Ditta, dbo.RIGHECONTABILITA.ESERCIZIO, dbo.RIGHECONTABILITA.DATAREG, dbo.RIGHECONTABILITA.CONTO, 
                      dbo.TABCFG.DSCCONTO1, (CASE WHEN segno = 0 THEN IMPORTOEURO ELSE IMPORTOEURO * - 1 END) AS IMPORTOEURO, 
                      dbo.RIGHECONTABILITA.SEGNO, dbo.TABCFG.CODMASTRO, dbo.TABCFG.DSCMASTRO, 
                      (CASE WHEN tabmastri.CodContoMFMCliFor <> '' THEN tabmastri.CodContoMFMCliFor ELSE EXTRAGENERICI.CodContoMFM END) AS CodContoMFM, 
                      dbo.EXTRAGENERICI.codNaturaPDC_1, dbo.ALD_TabCodNaturaPDC_1.Descrizione AS dscCodNaturaPDC_1, dbo.EXTRAGENERICI.codNaturaPDC_2, 
                      dbo.ALD_TabCodNaturaPDC_2.Descrizione AS dscCodNaturaPDC_2, dbo.EXTRAGENERICI.codNaturaPDC_3, 
                      dbo.ALD_TabCodNaturaPDC_3.Descrizione AS dscCodNaturaPDC_3
FROM         dbo.EXTRAGENERICI RIGHT OUTER JOIN
                      dbo.TESTECONTABILITA INNER JOIN
                      dbo.RIGHECONTABILITA ON dbo.TESTECONTABILITA.PROGRESSIVO = dbo.RIGHECONTABILITA.NRREG LEFT OUTER JOIN
                      dbo.TABMASTRI RIGHT OUTER JOIN
                      dbo.TABCFG ON dbo.TABMASTRI.CODICE = dbo.TABCFG.CODMASTRO ON dbo.RIGHECONTABILITA.CONTO = dbo.TABCFG.CODCONTO ON 
                      dbo.EXTRAGENERICI.CODCONTO = dbo.TABCFG.CODCONTO LEFT OUTER JOIN
                      dbo.ALD_TabCodNaturaPDC_3 ON dbo.EXTRAGENERICI.codNaturaPDC_3 = dbo.ALD_TabCodNaturaPDC_3.CodNaturaPDC_3 LEFT OUTER JOIN
                      dbo.ALD_TabCodNaturaPDC_2 ON dbo.EXTRAGENERICI.codNaturaPDC_2 = dbo.ALD_TabCodNaturaPDC_2.CodNaturaPDC_2 LEFT OUTER JOIN
                      dbo.ALD_TabCodNaturaPDC_1 ON dbo.EXTRAGENERICI.codNaturaPDC_1 = dbo.ALD_TabCodNaturaPDC_1.CodNaturaPDC_1
WHERE     (dbo.TESTECONTABILITA.PROVVISORIO = 0) OR
                      (dbo.TESTECONTABILITA.PROVVISORIO = 2)


GO
GRANT DELETE
    ON OBJECT::[dbo].[ald_vista_ConsolidatomMFM] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ald_vista_ConsolidatomMFM] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ald_vista_ConsolidatomMFM] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ald_vista_ConsolidatomMFM] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ald_vista_ConsolidatomMFM] TO [Metodo98]
    AS [dbo];

