﻿CREATE VIEW BRIO_VISTACARICHIANNOMESE AS
SELECT VG.CODART,FC.UM1 AS UM_BASE, FC.UM2 AS UM_STAT, FC.FATTORE, VG.ESERCIZIO AS ANNO,MONTH(VG.DATAMOV)AS MESE, SUM(VG.QTACARICO*FC.FATTORE) AS QTA, SUM(VALORECARICOEURO) AS IMPORTOEURO
FROM VISTAGIACENZE VG 
INNER JOIN ARTICOLIFATTORICONVERSIONE FC ON VG.CODART=FC.CODART AND FC.UM1=(SELECT UM
																			FROM ARTICOLIUMPREFERITE UMP
																			WHERE UMP.CODART = VG.CODART AND UMP.TIPOUM = 1)
WHERE FC.UM2= (SELECT UM
               FROM ARTICOLIUMPREFERITE UMP
               WHERE UMP.CODART = VG.CODART AND UMP.TIPOUM = 8)
GROUP BY VG.CODART, VG.ESERCIZIO, MONTH(VG.DATAMOV), FC.FATTORE, FC.UM1, FC.UM2

GO
GRANT SELECT
    ON OBJECT::[dbo].[BRIO_VISTACARICHIANNOMESE] TO [Metodo98]
    AS [dbo];
