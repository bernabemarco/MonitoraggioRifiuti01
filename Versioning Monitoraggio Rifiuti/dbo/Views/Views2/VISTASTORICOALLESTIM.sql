﻿
CREATE VIEW VISTASTORICOALLESTIM AS
SELECT IDSTORICO,
    SA.CODART,
    SA.CODCLIFOR,
    SA.CODPARTITA,
    SA.UBICAZIONE,
    AUP.TIPOUM,
    AUP.UM,
    SA.QUANTITA*AFC.FATTORE AS QUANTITA
    FROM STORICOALLESTIMENTI AS SA, 
	 ARTICOLIFATTORICONVERSIONE AS AFC,
	 ARTICOLIUMPREFERITE AS AUP
    WHERE SA.CODART=AFC.CODART AND SA.UM=AFC.UM1 AND
  	AFC.CODART=AUP.CODART AND AFC.UM2=AUP.UM

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASTORICOALLESTIM] TO [Metodo98]
    AS [dbo];
