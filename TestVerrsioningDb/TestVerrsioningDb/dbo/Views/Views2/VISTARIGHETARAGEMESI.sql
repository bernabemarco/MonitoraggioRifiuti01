﻿CREATE VIEW VISTARIGHETARAGEMESI AS
SELECT aag.DSCAGENTE, tta.PROGRESSIVO, tta.ESERCIZIO, tta.CODAGENTE,
       rta.CODICE, rta.CODICEDETT, rta.DESCRIZIONE, rtm.NUMMESE,
       rtm.DSCMESE, rtm.CONSUNTPREC, rtm.TARGET, rtm.CONSUNTIVO, rtm.GGLAVORATI, rtm.GGLAVORABILI,
       (CASE rta.CODICEDETT WHEN '0' THEN rta.CODICE ELSE rta.CODICEDETT END) as CODICEORD
  FROM RIGHETARAGENTIMESE rtm, RIGHETARAGENTI rta, TESTATARAGENTI tta, ANAGRAFICAAGENTI aag
  WHERE tta.CODAGENTE=aag.CODAGENTE
        AND rtm.RIFPROGRESSIVO=tta.PROGRESSIVO
        AND rtm.RIFPROGRESSIVO=rta.RIFPROGRESSIVO
        AND rtm.CODICE=rta.CODICE
        AND rtm.CODICEDETT=rta.CODICEDETT

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTARIGHETARAGEMESI] TO [Metodo98]
    AS [dbo];
