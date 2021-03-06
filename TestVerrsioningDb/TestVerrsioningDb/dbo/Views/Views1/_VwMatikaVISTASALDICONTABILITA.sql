﻿create view [dbo].[_VwMatikaVISTASALDICONTABILITA] as 
SELECT RC.CONTO, RC.ESERCIZIO, TC.DATAREG, TC.CAUSALE, 
    TC.PROVVISORIO, TC.NRGIORNALE, 
    (CASE WHEN RC.SEGNO = 0 THEN IMPORTO ELSE 0 END) 
    AS DARE, 
    (CASE WHEN RC.SEGNO = 0 THEN IMPORTOEURO ELSE 0 END)
     AS DAREEURO, 
    (CASE WHEN RC.SEGNO = 0 THEN IMPORTOVALUTA ELSE 0 END)
     AS DAREVALUTA, 
    (CASE WHEN RC.SEGNO = 1 THEN IMPORTO ELSE 0 END) 
    AS AVERE, 
    (CASE WHEN RC.SEGNO = 1 THEN IMPORTOEURO ELSE 0 END)
     AS AVEREEURO, 
    (CASE WHEN RC.SEGNO = 1 THEN IMPORTOVALUTA ELSE 0 END)
     AS AVEREVALUTA, 
    (CASE WHEN RC.SEGNO = 0 THEN IMPORTO ELSE 0 END) 
    - (CASE WHEN RC.SEGNO = 1 THEN IMPORTO ELSE 0 END) 
    AS SALDO, 
    (CASE WHEN RC.SEGNO = 0 THEN IMPORTOEURO ELSE 0 END)
     - (CASE WHEN RC.SEGNO = 1 THEN IMPORTOEURO ELSE 0 END)
     AS SALDOEURO, 
    (CASE WHEN RC.SEGNO = 0 THEN IMPORTOVALUTA ELSE 0 END)
     - (CASE WHEN RC.SEGNO = 1 THEN IMPORTOVALUTA ELSE 0 END)
     AS SALDOVALUTA
FROM RIGHECONTABILITA RC, TESTECONTABILITA TC
WHERE RC.NRREG = TC.PROGRESSIVO 

GO
GRANT DELETE
    ON OBJECT::[dbo].[_VwMatikaVISTASALDICONTABILITA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[_VwMatikaVISTASALDICONTABILITA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[_VwMatikaVISTASALDICONTABILITA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[_VwMatikaVISTASALDICONTABILITA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[_VwMatikaVISTASALDICONTABILITA] TO [Metodo98]
    AS [dbo];

