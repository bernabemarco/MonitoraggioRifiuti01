
CREATE VIEW [dbo].[ald_vista_ConsolidatomMFM_SaldoTotali]
AS
SELECT     Ditta, ESERCIZIO, 
Natura, 
DATAREG, CONTO, DSCCONTO1, 
0 as IMPORTOEURO_SaldoIniziale, 
sum((CASE WHEN segno = 0 THEN IMPORTOEURO ELSE 0 END)) AS IMPORTOEURO_Dare,
sum((CASE WHEN segno = 0 THEN 0 ELSE IMPORTOEURO * - 1 END)) AS IMPORTOEURO_Avere,
CODMASTRO, DSCMASTRO, CodContoMFM, 
codNaturaPDC_1, dscCodNaturaPDC_1, codNaturaPDC_2, 
                      dscCodNaturaPDC_2, codNaturaPDC_3, dscCodNaturaPDC_3
FROM         ald_vista_ConsolidatomMFM_MovimentiEsercizio
GROUP BY Ditta, ESERCIZIO, DATAREG, CONTO, DSCCONTO1, CODMASTRO, DSCMASTRO, CodContoMFM, codNaturaPDC_1, dscCodNaturaPDC_1, codNaturaPDC_2, 
                      dscCodNaturaPDC_2, codNaturaPDC_3, dscCodNaturaPDC_3 , Natura
union all
select   Ditta, ESERCIZIO, Natura, 
DATAREG, CONTO, DSCCONTO1, 
sum(IMPORTOEURO) as IMPORTOEURO_SaldoIniziale, 
0 AS IMPORTOEURO_Dare,
0 AS IMPORTOEURO_Avere,
CODMASTRO, DSCMASTRO, CodContoMFM, 
codNaturaPDC_1, dscCodNaturaPDC_1, codNaturaPDC_2, 
   dscCodNaturaPDC_2, codNaturaPDC_3, dscCodNaturaPDC_3
FROM    dbo.ald_vista_ConsolidatomMFM_SaldoIniziale     
GROUP BY Ditta, ESERCIZIO, DATAREG, CONTO, DSCCONTO1, CODMASTRO, DSCMASTRO, CodContoMFM, codNaturaPDC_1, dscCodNaturaPDC_1, codNaturaPDC_2, 
                      dscCodNaturaPDC_2, codNaturaPDC_3, dscCodNaturaPDC_3
, Natura

GO
GRANT DELETE
    ON OBJECT::[dbo].[ald_vista_ConsolidatomMFM_SaldoTotali] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ald_vista_ConsolidatomMFM_SaldoTotali] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ald_vista_ConsolidatomMFM_SaldoTotali] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ald_vista_ConsolidatomMFM_SaldoTotali] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ald_vista_ConsolidatomMFM_SaldoTotali] TO [Metodo98]
    AS [dbo];

