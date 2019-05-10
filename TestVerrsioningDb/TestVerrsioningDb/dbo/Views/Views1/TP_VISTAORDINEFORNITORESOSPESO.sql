﻿

CREATE VIEW [dbo].[TP_VISTAORDINEFORNITORESOSPESO]
AS
    SELECT 
        M.*,
        (SELECT DISTINCT ESERCIZIO FROM TP_OFTESTEDOCUMENTI_TMP WHERE RIFPROGRESSIVO = M.PROGRESSIVO) AS ESERCIZIO
    FROM 
        TP_OFDOCUMENTI_TMP M


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTAORDINEFORNITORESOSPESO] TO [Metodo98]
    AS [dbo];

