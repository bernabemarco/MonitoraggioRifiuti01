﻿CREATE VIEW VISTARIGHETARAGENTI AS
SELECT aag.DSCAGENTE, tta.PROGRESSIVO, tta.ESERCIZIO, tta.CODAGENTE,
     rta.CODICE, rta.CODICEDETT, rta.DESCRIZIONE, rta.DESCRENASARCO, rta.TIPOPREMIO,
     rta.TOTVAL, rta.TOTCONS, rta.TOTPREC, rta.TOTCONS-rta.TOTVAL DIFF,
     rta.VALOREPREMIO, rta.VINCOLO, rta.IMPORTOLIQUIDATO,
     CASE WHEN rta.CODICEDETT='0' THEN rta.CODICE ELSE rta.CODICEDETT END AS CODICEORD
  FROM TESTATARAGENTI tta, ANAGRAFICAAGENTI aag, RIGHETARAGENTI rta
  WHERE tta.CODAGENTE=aag.CODAGENTE
        AND tta.progressivo=rta.RIFPROGRESSIVO

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTARIGHETARAGENTI] TO [Metodo98]
    AS [dbo];

