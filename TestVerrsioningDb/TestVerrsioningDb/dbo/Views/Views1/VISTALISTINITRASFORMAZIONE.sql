﻿CREATE VIEW  VISTALISTINITRASFORMAZIONE AS
	SELECT TABLISTINITRASFORMAZIONE.NRLISTINO,
	    TABLISTINITRASFORMAZIONE.DESCRIZIONE,
	    TABLISTINITRASFORMAZIONE.CODCAMBIO,
	    TABLISTINITRASFORMAZIONE.VINCOLAUM,
	    TABCAMBI.DIVISA,
	    TABCAMBI.DESCRIZIONE AS DESCRDIVISA
	    FROM TABLISTINITRASFORMAZIONE,TABCAMBI
	    WHERE TABLISTINITRASFORMAZIONE.CODCAMBIO=TABCAMBI.CODICE

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTALISTINITRASFORMAZIONE] TO [Metodo98]
    AS [dbo];

