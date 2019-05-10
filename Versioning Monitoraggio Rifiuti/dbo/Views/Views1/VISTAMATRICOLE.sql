﻿
CREATE VIEW VISTAMATRICOLE AS
SELECT 
    ST.CODART,
    (SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE=ST.CODART) AS DSCART,
    STM.CODMATRICOLA
FROM 
    STORICOMAG ST INNER JOIN STORICOMAGMATRICOLE STM ON ST.PROGRESSIVO=STM.PROGRESSIVO

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAMATRICOLE] TO [Metodo98]
    AS [dbo];

