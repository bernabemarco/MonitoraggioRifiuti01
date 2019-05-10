﻿
CREATE VIEW VISTASALDIFINALIPNCOMM AS 
  SELECT RCONT.CONTO,RCONT.ESERCIZIO,TCONT.PROVVISORIO,TCONT.NRGIORNALE,RCONT.CODCOMMESSA,
    SUM((CASE WHEN RCONT.SEGNO=1 THEN RCONT.IMPORTO ELSE 0 END)) AS DARE,
    SUM((CASE WHEN RCONT.SEGNO=1 THEN RCONT.IMPORTOEURO ELSE 0 END)) AS DAREEURO,
    SUM((CASE WHEN RCONT.SEGNO=1 THEN RCONT.IMPORTOVALUTA ELSE 0 END)) AS DAREVALUTA,
    SUM((CASE WHEN RCONT.SEGNO=0 THEN RCONT.IMPORTO ELSE 0 END)) AS AVERE,
    SUM((CASE WHEN RCONT.SEGNO=0 THEN RCONT.IMPORTOEURO ELSE 0 END)) AS AVEREEURO,
    SUM((CASE WHEN RCONT.SEGNO=0 THEN RCONT.IMPORTOVALUTA ELSE 0 END)) AS AVEREVALUTA,
    SUM((CASE WHEN RCONT.SEGNO=1 THEN RCONT.IMPORTO ELSE 0 END))-SUM((CASE WHEN RCONT.SEGNO=0 THEN RCONT.IMPORTO ELSE 0 END)) AS SALDO,
    SUM((CASE WHEN RCONT.SEGNO=1 THEN RCONT.IMPORTOEURO ELSE 0 END))-SUM((CASE WHEN RCONT.SEGNO=0 THEN RCONT.IMPORTOEURO ELSE 0 END)) AS SALDOEURO,
    SUM((CASE WHEN RCONT.SEGNO=1 THEN RCONT.IMPORTOVALUTA ELSE 0 END))-SUM((CASE WHEN RCONT.SEGNO=0 THEN RCONT.IMPORTOVALUTA ELSE 0 END)) AS SALDOVALUTA
    FROM RIGHECONTABILITA AS RCONT,TESTECONTABILITA AS TCONT, TABCFG TC
    WHERE(RCONT.NRREG=TCONT.PROGRESSIVO) AND TCONT.CAUSALE=(SELECT GIC.CAUSCONTCH FROM TABVINCOLIGIC AS GIC WHERE GIC.ESERCIZIO=TCONT.ESERCIZIO)
    AND TC.CODCONTO=RCONT.CONTO AND TC.TIPOMASTRO<>'E'
    GROUP BY RCONT.ESERCIZIO,RCONT.CONTO,TCONT.PROVVISORIO,TCONT.NRGIORNALE,RCONT.CODCOMMESSA

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASALDIFINALIPNCOMM] TO [Metodo98]
    AS [dbo];

