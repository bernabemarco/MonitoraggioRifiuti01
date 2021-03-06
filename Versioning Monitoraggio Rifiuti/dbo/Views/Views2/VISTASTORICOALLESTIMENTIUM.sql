﻿CREATE VIEW VISTASTORICOALLESTIMENTIUM  AS
SELECT VISTAFATTORICONVERSIONE.FORMULAFC, 
    VISTAFATTORICONVERSIONE.FATTORE, 
    VISTAFATTORICONVERSIONE.UMRIC, 
    STORICOALLESTIMENTI.IDSTORICO, 
    STORICOALLESTIMENTI.CODART, 
    STORICOALLESTIMENTI.CODCLIFOR, 
    STORICOALLESTIMENTI.CODPARTITA, 
    STORICOALLESTIMENTI.UBICAZIONE, 
    STORICOALLESTIMENTI.UM, 
    STORICOALLESTIMENTI.QUANTITA
FROM STORICOALLESTIMENTI LEFT OUTER JOIN
    VISTAFATTORICONVERSIONE ON 
    STORICOALLESTIMENTI.UM = VISTAFATTORICONVERSIONE.UMJOIN
     AND 
    STORICOALLESTIMENTI.CODART = VISTAFATTORICONVERSIONE.CODART

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASTORICOALLESTIMENTIUM] TO [Metodo98]
    AS [dbo];

