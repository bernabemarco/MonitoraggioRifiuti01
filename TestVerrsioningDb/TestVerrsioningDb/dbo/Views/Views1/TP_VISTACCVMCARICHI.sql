﻿
CREATE VIEW TP_VISTACCVMCARICHI AS
SELECT 
STORICOMAG.CODDEPOSITO AS DEPOSITO,
STORICOMAG.ESERCIZIO,
YEAR(STORICOMAG.DATAMOV) AS ANNO,
MONTH(STORICOMAG.DATAMOV) AS MESE,
STORICOMAG.CODART AS ARTICOLO,
ABS(SUM(STORICOMAG.QTA1UM * STORICOMAG.GIACENZA)) AS QUANTITA1, 
ABS(SUM(STORICOMAG.QTA2UM * STORICOMAG.GIACENZA)) AS QUANTITA2,
(SELECT ARTICOLIUMPREFERITE.UM FROM ARTICOLIUMPREFERITE WHERE ARTICOLIUMPREFERITE.CODART=STORICOMAG.CODART AND ARTICOLIUMPREFERITE.TIPOUM=1) UM1,
(SELECT ARTICOLIUMPREFERITE.UM FROM ARTICOLIUMPREFERITE WHERE ARTICOLIUMPREFERITE.CODART=STORICOMAG.CODART AND ARTICOLIUMPREFERITE.TIPOUM=2) UM2
FROM STORICOMAG INNER JOIN TP_EXTRAMAG
	ON STORICOMAG.CODART=TP_EXTRAMAG.CODART AND TP_EXTRAMAG.CONSIDACQ=1
WHERE STORICOMAG.TIPODOC IN(SELECT (items ) AS DOC FROM SplitCCVMDOC('CAR')) AND 
      STORICOMAG.CODCAUSALE IN(SELECT items AS CAU FROM SplitCCVMCAU('CAR'))
GROUP BY STORICOMAG.CODDEPOSITO,STORICOMAG.CODART, 
MONTH(STORICOMAG.DATAMOV),YEAR(STORICOMAG.DATAMOV),STORICOMAG.ESERCIZIO

GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTACCVMCARICHI] TO [Metodo98]
    AS [dbo];

