﻿
CREATE VIEW VISTATIPODEPOSITI AS
        SELECT TIPODEPOSITO,
        (CASE WHEN TIPODEPOSITO = 0 THEN 'AZIENDALE' ELSE (CASE WHEN TIPODEPOSITO=2 THEN 'PRESSO TERZI' ELSE 'CONTO TERZI' END)  END)  AS DESCRIZIONE
        FROM ANAGRAFICADEPOSITI
        GROUP BY TIPODEPOSITO

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATIPODEPOSITI] TO [Metodo98]
    AS [dbo];

