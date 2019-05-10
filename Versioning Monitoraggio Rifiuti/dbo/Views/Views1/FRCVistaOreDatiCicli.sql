
CREATE VIEW FRCVistaOreDatiCicli AS 
	SELECT Ambiente, Anno, Mese, Centro, SUM(Ore) AS Ore
	FROM FRCVistaOreDatiCicli2
	GROUP BY Ambiente, Anno, Mese, Centro

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaOreDatiCicli] TO [Metodo98]
    AS [dbo];

