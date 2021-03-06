﻿CREATE VIEW VISTAPIANOMPP AS
SELECT 
	 TP.PROGRESSIVO,
	 TP.ESERCIZIO,TP.CODICE,TP.NUMERO,
	 TP.RIFERIMENTO,TP.NUMEROFOGLIO,
	 TP.DATAEMISSIONE,
	 TP.FLGPRINCIPALE,
	 PAR.TIPODATAPERIODO,
	 RP.RIFRIGAFORECAST AS NUMERORIGAFORECAST,
	 RP.NUMERORIGA,
	 RP.ARTICOLOMPS,
	 RP.ARTICOLO,RP.VERSIONEDBA,       
	 RP.LIVELLO,RP.NOMEPERIODOPADRE,RP.NOMEPERIODO,RP.DESCRIZIONEPERIODO,
	 RP.DATAINIZIO,RP.DATAFINE,
	 (CASE WHEN PAR.TIPODATAPERIODO=1 THEN
			  --{FN TIMESTAMPADD(SQL_TSI_DAY,CAST({FN TIMESTAMPDIFF(SQL_TSI_DAY,DATAINIZIO,DATAFINE)}/2 AS SMALLINT),DATAINIZIO)}
			  DATEADD(DAYOFYEAR,CAST( DATEDIFF(DAYOFYEAR,DATAINIZIO,DATAFINE)/2 AS SMALLINT),DATAINIZIO)
	 ELSE
			  (CASE WHEN PAR.TIPODATAPERIODO=0 THEN
						RP.DATAINIZIO
			  ELSE
						RP.DATAFINE
			  END)
	 END) AS DATAPREVISIONE,
	 RP.UM,RP.QTAPREVISTA,RP.QTAIMPEGNATA,
	 RP.CHIUSO,RP.ATTIVO 
FROM 
	(TESTAMPS TP INNER JOIN PARAMETRIMPS PAR ON PAR.CODICE=TP.CODICE LEFT OUTER JOIN RIGHEMPP RP ON RP.RIFPROGRESSIVO=TP.PROGRESSIVO)

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAPIANOMPP] TO [Metodo98]
    AS [dbo];

