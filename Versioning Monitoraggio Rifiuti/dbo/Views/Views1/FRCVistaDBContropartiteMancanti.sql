﻿
CREATE VIEW FRCVistaDBContropartiteMancanti AS 
    SELECT *, ISNULL((SELECT PROVENIENZA FROM ANAGRAFICAARTICOLIPROD WHERE CODICEART = FRCVistaArticoliVB2.CODART AND ESERCIZIO = YEAR(GETDATE())), 0) AS PROVENIENZA
    FROM FRCVistaArticoliVB2 INNER JOIN FRCDistinteBasiEsplose
         ON FRCDistinteBasiEsplose.COMPOSTO = FRCVistaArticoliVB2.CODART AND FRCDistinteBasiEsplose.ANNO = FRCVistaArticoliVB2.ANNODOC
    WHERE ISNULL(FRCDistinteBasiEsplose.CONTOACQITA, '') = ''

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaDBContropartiteMancanti] TO [Metodo98]
    AS [dbo];
