﻿CREATE VIEW VISTACONSUMIDOCCONSEGNA AS
SELECT CCL.*,
RD.TIPODOC AS TIPODOCCONS,RD.NUMERODOC AS NUMDOCCONS,RD.BIS AS BISCONS,RD.ESERCIZIO AS ESERCIZIOCONS,
(SELECT UM FROM ARTICOLIUMPREFERITE WHERE CODART=CCL.CODART AND TIPOUM=1) AS UMGEST,
(SELECT CODCLIFOR FROM TESTEDOCUMENTI WHERE PROGRESSIVO=CCL.IDTESTA_CONSCL) AS CODCLIFOR,
(SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE=CCL.CODART) AS DESCRIZIONEART,
(SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO=(SELECT CODCLIFOR FROM TESTEDOCUMENTI WHERE PROGRESSIVO=CCL.IDTESTA_CONSCL)) AS RAGSOCCF
FROM CONSUMICLAVORAZIONE CCL LEFT OUTER JOIN RIGHEDOCUMENTI RD ON CCL.IDTESTA_CONSCL=RD.IDTESTA AND CCL.IDRIGA_CONSCL=RD.IDRIGA

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACONSUMIDOCCONSEGNA] TO [Metodo98]
    AS [dbo];

