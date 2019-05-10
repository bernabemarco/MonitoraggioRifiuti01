

--------------------------------------------------------------------- INIZIO FORECAST ------------------------------------------------------------------------------
CREATE VIEW [dbo].[FRCVistaDBCostiMancanti] AS 
    SELECT *, ISNULL((SELECT PROVENIENZA FROM ANAGRAFICAARTICOLIPROD WHERE CODICEART = FRCDistinteBasiEsplose.COMPONENTE AND ESERCIZIO = YEAR(GETDATE())), 0) AS PROVENIENZA 
    FROM FRCVistaArticoliVB INNER JOIN FRCDistinteBasiEsplose
         ON FRCDistinteBasiEsplose.COMPOSTO = FRCVistaArticoliVB.CODART AND FRCDistinteBasiEsplose.ANNO = FRCVistaArticoliVB.ANNODOC
    WHERE FRCDistinteBasiEsplose.COSTOTOTEURO = 0


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaDBCostiMancanti] TO [Metodo98]
    AS [dbo];

