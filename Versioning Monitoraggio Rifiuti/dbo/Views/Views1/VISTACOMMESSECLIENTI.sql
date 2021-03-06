﻿CREATE VIEW VISTACOMMESSECLIENTI AS
SELECT 
	AC.*,
	PREV.TIPO AS TIPOPREV,
	PREV.ESERCIZIO AS ANNOPREV,
	PREV.NUMERO AS NUMEROPREV,
	PREV.REVISIONE AS REVISIONEPREV,
	REV.DESCRIZIONE AS DESREVISIONEPREV,
	CAST(PREV.RIFERIMENTO AS VARCHAR) AS RIFERIMENTOPREV,
	PREV.STATO AS STATOPREV,
	PREV.OGGETTO AS OGGETTOPREV
FROM 
	ANAGRAFICACOMMESSE AC LEFT OUTER JOIN (TESTEFOGLICOMMCLI PREV INNER JOIN TABREVISIONICOMMCLI REV ON PREV.REVISIONE=REV.CODICE) ON AC.PROGRPREVENTIVO=PREV.PROGRESSIVO

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACOMMESSECLIENTI] TO [Metodo98]
    AS [dbo];

