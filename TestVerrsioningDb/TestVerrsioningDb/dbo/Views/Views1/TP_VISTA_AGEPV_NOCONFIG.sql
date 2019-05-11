﻿
CREATE VIEW TP_VISTA_AGEPV_NOCONFIG
AS
	SELECT CODAGENTE AS CODICE, DSCAGENTE AS DESCRIZIONE FROM ANAGRAFICAAGENTI
		WHERE CODAGENTE NOT IN(SELECT CODAGENTE FROM TP_TRASFAGENTI)
	UNION
	SELECT CODCONTO AS CODICE, DSCCONTO1 AS DESCRIZIONE FROM ANAGRAFICACF
		WHERE CODCONTO NOT IN(SELECT CODCONTO FROM TP_PUNTIVENDITA)


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VISTA_AGEPV_NOCONFIG] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VISTA_AGEPV_NOCONFIG] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTA_AGEPV_NOCONFIG] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VISTA_AGEPV_NOCONFIG] TO [Metodo98]
    AS [dbo];
