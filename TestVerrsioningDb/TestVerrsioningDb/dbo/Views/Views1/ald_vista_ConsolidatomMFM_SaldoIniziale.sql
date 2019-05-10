
CREATE VIEW [dbo].[ald_vista_ConsolidatomMFM_SaldoIniziale]
AS
SELECT     DB_NAME() AS Ditta, RIGHECONTABILITA.ESERCIZIO, 'SI' as Natura,RIGHECONTABILITA.DATAREG, RIGHECONTABILITA.CONTO, TABCFG.DSCCONTO1, 
                      (CASE WHEN segno = 0 THEN IMPORTOEURO ELSE IMPORTOEURO * - 1 END) AS IMPORTOEURO, RIGHECONTABILITA.SEGNO, 
                      TABCFG.CODMASTRO, TABCFG.DSCMASTRO, 
                      (CASE WHEN tabmastri.CodContoMFMCliFor <> '' THEN tabmastri.CodContoMFMCliFor ELSE EXTRAGENERICI.CodContoMFM END) AS CodContoMFM, 
                      EXTRAGENERICI.codNaturaPDC_1, ALD_TabCodNaturaPDC_1.Descrizione AS dscCodNaturaPDC_1, EXTRAGENERICI.codNaturaPDC_2, 
                      ALD_TabCodNaturaPDC_2.Descrizione AS dscCodNaturaPDC_2, EXTRAGENERICI.codNaturaPDC_3, 
                      ALD_TabCodNaturaPDC_3.Descrizione AS dscCodNaturaPDC_3
FROM         EXTRAGENERICI RIGHT OUTER JOIN
                      TESTECONTABILITA INNER JOIN
                      RIGHECONTABILITA ON TESTECONTABILITA.PROGRESSIVO = RIGHECONTABILITA.NRREG LEFT OUTER JOIN
                      TABMASTRI RIGHT OUTER JOIN
                      TABCFG ON TABMASTRI.CODICE = TABCFG.CODMASTRO ON RIGHECONTABILITA.CONTO = TABCFG.CODCONTO ON 
                      EXTRAGENERICI.CODCONTO = TABCFG.CODCONTO LEFT OUTER JOIN
                      ALD_TabCodNaturaPDC_3 ON EXTRAGENERICI.codNaturaPDC_3 = ALD_TabCodNaturaPDC_3.CodNaturaPDC_3 LEFT OUTER JOIN
                      ALD_TabCodNaturaPDC_2 ON EXTRAGENERICI.codNaturaPDC_2 = ALD_TabCodNaturaPDC_2.CodNaturaPDC_2 LEFT OUTER JOIN
                      ALD_TabCodNaturaPDC_1 ON EXTRAGENERICI.codNaturaPDC_1 = ALD_TabCodNaturaPDC_1.CodNaturaPDC_1
WHERE    ( (TESTECONTABILITA.PROVVISORIO = 0) OR
                      (TESTECONTABILITA.PROVVISORIO = 2) )
and testecontabilita.causale in (select CAUSCONTAP from TABVINCOLIGIC where TABVINCOLIGIC.ESERCIZIO=testecontabilita.Esercizio)
and RIGHECONTABILITA.conto not in (select CONTOPATRAP from TABVINCOLIGIC where TABVINCOLIGIC.ESERCIZIO=testecontabilita.Esercizio)

GO
GRANT DELETE
    ON OBJECT::[dbo].[ald_vista_ConsolidatomMFM_SaldoIniziale] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ald_vista_ConsolidatomMFM_SaldoIniziale] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ald_vista_ConsolidatomMFM_SaldoIniziale] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ald_vista_ConsolidatomMFM_SaldoIniziale] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ald_vista_ConsolidatomMFM_SaldoIniziale] TO [Metodo98]
    AS [dbo];

