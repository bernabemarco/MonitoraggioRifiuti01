
CREATE VIEW FRCVistaTotaliOreDatiCicli AS 
	SELECT Ambiente, Anno, Mese, Centro, SUM(Ore) AS TotaleOre 
	FROM FRCVistaOreDatiCicli
	GROUP BY Ambiente, Anno, Mese, Centro

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaTotaliOreDatiCicli] TO [Metodo98]
    AS [dbo];

