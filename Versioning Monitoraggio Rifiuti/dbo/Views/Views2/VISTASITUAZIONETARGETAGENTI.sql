﻿CREATE VIEW VISTASITUAZIONETARGETAGENTI AS
SELECT
   AA.CODAGENTE, AA.DSCAGENTE, TARGETAGENTI.ANNO,
   TARGETAGENTI.MESE, TARGETAGENTI.TARGET, TARGETAGENTI.TARGETEURO, TS.PROGRESSIVO,
   TS.DATASCADENZA, TS.IMPORTOSCLIT,
   TS.IMPORTOSCEURO, TS.ESITO,
   (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'C') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)='C')) THEN(TS.IMPORTOSCLIT*-1) ELSE TS.IMPORTOSCLIT END) AS IMPORTOSCADLIRE,
   (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'C') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)='C')) THEN(TS.IMPORTOSCEURO*-1) ELSE TS.IMPORTOSCEURO END) AS IMPORTOSCADEURO
FROM
   (ANAGRAFICAAGENTI AA LEFT OUTER JOIN TARGETAGENTI ON AA.CODAGENTE = TARGETAGENTI.CODAGENTE)
   LEFT OUTER JOIN TABSCADENZE TS ON ((AA.CODAGENTE = TS.CODAGE1 OR AA.CODAGENTE = TS.CODAGE2 OR AA.CODAGENTE = TS.CODAGE3)
   AND TARGETAGENTI.ANNO=DATEPART(YEAR,TS.DATASCADENZA) AND TARGETAGENTI.MESE=DATEPART(MONTH,TS.DATASCADENZA))

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASITUAZIONETARGETAGENTI] TO [Metodo98]
    AS [dbo];
