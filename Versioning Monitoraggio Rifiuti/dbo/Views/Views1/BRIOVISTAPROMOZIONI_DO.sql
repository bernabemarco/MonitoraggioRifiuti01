﻿CREATE VIEW dbo.BRIOVISTAPROMOZIONI_DO AS
SELECT
LTRIM(STR(TP.NUMEROPROMOZIONE)) AS NUMEROPROMOZIONE, TP.NUMEROCAMPAGNA,TP.DESCPROMO,TP.DESCCAMPAGNA,TP.TIPO,TP.CODART,TP.UM, FC.UM1, FC.UM2 AS UMSTAT,
BDG_QTA*FC.FATTORE AS BDG_QTA_CONVERTITA,TP.BDG_QTA,TP.BDG_VALORE
FROM BRIOVISTA_TMP_PROMOZIONI_DO TP INNER JOIN
dbo.ARTICOLIFATTORICONVERSIONE FC ON TP.CODART = FC.CODART AND TP.UM = FC.UM1
WHERE
	FC.UM2 = (SELECT UM FROM ARTICOLIUMPREFERITE UMP WHERE UMP.CODART=TP.CODART AND UMP.TIPOUM = 8)

GO
GRANT SELECT
    ON OBJECT::[dbo].[BRIOVISTAPROMOZIONI_DO] TO [Metodo98]
    AS [dbo];
