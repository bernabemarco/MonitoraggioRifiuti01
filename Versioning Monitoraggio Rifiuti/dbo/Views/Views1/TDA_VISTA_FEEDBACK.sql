﻿
CREATE VIEW [TDA_VISTA_FEEDBACK] AS
SELECT PROGRESSIVO,
	TIPO,
	STATO, 
	(CASE WHEN STATO=0 THEN 'Inserito' WHEN STATO=1 THEN 'Validato' WHEN STATO=2 THEN 'Non Valido' WHEN STATO=3 THEN 'Parz. Consolidato' WHEN STATO=4 THEN 'Consolidato' ELSE '' END) AS DSC_STATO,
	CAUSALE, 
	TDACAU.DESCRIZIONE AS DSC_CAUSALE, 
	DIPENDENTE, 
	ANNOBOLLA, 
	NUMEROBOLLA, 
	SQUADRA,
	NUOVOSTATOFASE,
	(CASE WHEN NUOVOSTATOFASE=0 THEN 'Attiva' WHEN NUOVOSTATOFASE=1 THEN 'Iniziata' WHEN NUOVOSTATOFASE=2 THEN 'Chiusa' ELSE '' END) AS DSC_NUOVOSTATOFASE,
	TDIP.NOME+' '+TDIP.COGNOME AS DSC_DIPENDENTE,
	TDA.DATAMODIFICA AS DATA_FEEDBACK
FROM TDA_FEEDBACK TDA
	LEFT OUTER JOIN TDA_DETTFEEDBACK_CONSUNTIVO TDACONS
	ON TDA.PROGRESSIVO=TDACONS.RIFPROGRESSIVO
	LEFT OUTER JOIN TDA_CAUSALIFEEDBACK TDACAU
	ON TDA.CAUSALE=TDACAU.CODICE
	LEFT OUTER JOIN TABELLADIPENDENTI TDIP
	ON TDACONS.DIPENDENTE=TDIP.CODICE

GO
GRANT SELECT
    ON OBJECT::[dbo].[TDA_VISTA_FEEDBACK] TO [Metodo98]
    AS [dbo];

