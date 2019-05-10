﻿
CREATE VIEW VISTADEPOSITICC AS
SELECT 
	AD.CODICE,
	AD.DESCRIZIONE,
	AD.TIPODEPOSITO,
	AD.DISPONIBILE,
	ISNULL(MC.RIFCOMMCLI,'') AS RIFCOMMCLI
FROM
	MAGAZZINICOMMCLI MC RIGHT OUTER JOIN ANAGRAFICADEPOSITI AD
	ON MC.CODDEPOSITO=AD.CODICE
GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTADEPOSITICC] TO [Metodo98]
    AS [dbo];

