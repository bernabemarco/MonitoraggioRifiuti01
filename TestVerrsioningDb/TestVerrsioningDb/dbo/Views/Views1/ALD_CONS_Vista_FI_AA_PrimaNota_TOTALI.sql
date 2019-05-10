create view ALD_CONS_Vista_FI_AA_PrimaNota_TOTALI
as
SELECT  
 (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) AS IdSocieta,
   NRREG, ESERCIZIO, 
SUM(CASE WHEN SEGNO = 0 THEN IMPORTOEURO ELSE 0 END) AS SaldoDare, 
SUM(CASE WHEN SEGNO = 1 THEN IMPORTOEURO*-1 ELSE 0 END) AS SaldoAvere
FROM         RIGHECONTABILITA
GROUP BY NRREG, ESERCIZIO

GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_PrimaNota_TOTALI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_PrimaNota_TOTALI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_PrimaNota_TOTALI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_PrimaNota_TOTALI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_PrimaNota_TOTALI] TO [Metodo98]
    AS [dbo];

