﻿CREATE VIEW VISTARELAZIONIPCF AS
	SELECT 
		CODCLIFOR,
		ARTICOLO,
		VARIANTI,
		TIPOEDI,
		RIFERIMENTOEDI,
		TIPOASS,
		RIFERIMENTOASS,
		DESCRIZIONE,
		UTENTEMODIFICA,
		DATAMODIFICA,
		(CASE WHEN VARIANTI = '' OR VARIANTI IS NULL OR CHARINDEX('?', VARIANTI) > 0 THEN (SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE = ARTICOLO) 
		      ELSE (SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE = ARTICOLO + '#' + VARIANTI) END) AS DSCART, 
		(CASE WHEN VARIANTI = '' OR VARIANTI IS NULL OR CHARINDEX('?', VARIANTI) > 0 THEN (SELECT ARTTIPOLOGIA FROM ANAGRAFICAARTICOLI WHERE CODICE = ARTICOLO) 
		 		ELSE (SELECT ARTTIPOLOGIA FROM ANAGRAFICAARTICOLI WHERE CODICE = ARTICOLO + '#' + VARIANTI) END) AS ARTTIPOLOGIA, 
		(CASE WHEN VARIANTI = '' OR VARIANTI IS NULL OR CHARINDEX('?', VARIANTI) > 0 THEN (SELECT CODICE FROM ANAGRAFICAARTICOLI WHERE CODICE = ARTICOLO) 
		 		ELSE (SELECT CODICEPRIMARIO FROM ANAGRAFICAARTICOLI WHERE CODICE = ARTICOLO + '#' + VARIANTI) END) AS CODICEPRIMARIO,		
		(CASE WHEN VARIANTI<>'' THEN ARTICOLO+'#'+REPLACE(VARIANTI,'?','%') ELSE ARTICOLO END) CODARTICOLO,
		(CASE WHEN TIPOEDI=1 THEN 'E' ELSE 'A' END) TIPORELAZIONE,
		(CASE WHEN TIPOEDI=1 THEN RIFERIMENTOEDI ELSE RIFERIMENTOASS END) RIFERIMENTO
	FROM 
		RELAZIONIPCF

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTARELAZIONIPCF] TO [Metodo98]
    AS [dbo];
