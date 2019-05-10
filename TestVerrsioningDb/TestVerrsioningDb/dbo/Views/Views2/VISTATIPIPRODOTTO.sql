﻿CREATE VIEW VISTATIPIPRODOTTO
AS
	SELECT TOP 1 0 CODICE, 'Finito' DESCRIZIONE FROM NUMERI
	UNION SELECT TOP 1 1 CODICE, 'Semilavorato' DESCRIZIONE FROM NUMERI
	UNION SELECT TOP 1 2 CODICE, 'Materiale di Base' DESCRIZIONE FROM NUMERI

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATIPIPRODOTTO] TO [Metodo98]
    AS [dbo];

