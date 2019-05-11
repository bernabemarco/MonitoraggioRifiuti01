﻿CREATE VIEW VISTASELPARTITECONT AS
SELECT RCONT.CONTO,RCONT.NRPARTITA,TCONT.PROVVISORIO,
    SUM((CASE WHEN RCONT.SEGNO=0 THEN RCONT.IMPORTO ELSE 0 END))-SUM((CASE WHEN RCONT.SEGNO=1 THEN RCONT.IMPORTO ELSE 0 END)) AS SALDOLIRE,
    SUM((CASE WHEN RCONT.SEGNO=0 THEN RCONT.IMPORTOEURO ELSE 0 END))-SUM((CASE WHEN RCONT.SEGNO=1 THEN RCONT.IMPORTOEURO ELSE 0 END)) AS SALDOEURO,
    SUM((CASE WHEN RCONT.SEGNO=0 THEN RCONT.IMPORTOVALUTA ELSE 0 END))-SUM((CASE WHEN RCONT.SEGNO=1 THEN RCONT.IMPORTOVALUTA ELSE 0 END)) AS SALDOVALUTA,
    (SELECT TOP 1 RC.DATAREG FROM RIGHECONTABILITA RC WHERE RC.NRPARTITA=RCONT.NRPARTITA AND RC.CONTO=RCONT.CONTO ORDER BY RC.DATAREG) AS DATACREAZIONE,
    (SELECT TOP 1 RC.NRRIF FROM RIGHECONTABILITA RC WHERE RC.NRPARTITA=RCONT.NRPARTITA AND RC.CONTO=RCONT.CONTO ORDER BY RC.DATAREG) AS NRRIFER,
    (SELECT TOP 1 RC.DATARIF FROM RIGHECONTABILITA RC WHERE RC.NRPARTITA=RCONT.NRPARTITA AND RC.CONTO=RCONT.CONTO ORDER BY RC.DATAREG) AS DATARIF,
    (SELECT TOP 1 (SELECT CAUSALE FROM TESTECONTABILITA WHERE PROGRESSIVO=RC.NRREG) FROM RIGHECONTABILITA RC WHERE RC.NRPARTITA=RCONT.NRPARTITA AND RC.CONTO=RCONT.CONTO ORDER BY DATAREG) AS CAUSALE,
    (SELECT DESCRIZIONE FROM CAUSALICONTABILI WHERE CODICECAUSALE=(SELECT TOP 1 (SELECT CAUSALE FROM TESTECONTABILITA WHERE PROGRESSIVO=RC.NRREG) FROM RIGHECONTABILITA RC WHERE RC.NRPARTITA=RCONT.NRPARTITA AND RC.CONTO=RCONT.CONTO ORDER BY DATAREG)) AS DSCCAUSALE,
    (SELECT TOP 1 (SELECT DESCRIZIONE FROM TESTECONTABILITA WHERE PROGRESSIVO=RC.NRREG) FROM RIGHECONTABILITA RC WHERE RC.NRPARTITA=RCONT.NRPARTITA AND RC.CONTO=RCONT.CONTO ORDER BY DATAREG) AS DSCMOV
    FROM RIGHECONTABILITA AS RCONT,TESTECONTABILITA AS TCONT
    WHERE (RCONT.NRREG=TCONT.PROGRESSIVO) AND TCONT.ESERCIZIO<=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=USER_NAME())
    GROUP BY RCONT.CONTO,RCONT.NRPARTITA,TCONT.PROVVISORIO

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASELPARTITECONT] TO [Metodo98]
    AS [dbo];
