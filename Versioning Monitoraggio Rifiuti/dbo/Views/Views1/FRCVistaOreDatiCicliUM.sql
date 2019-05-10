
CREATE VIEW FRCVistaOreDatiCicliUM AS 
	SELECT Ambiente, UM, Anno, Mese, Centro, SUM(Ore) AS Ore
	FROM FRCVistaOreDatiCicliUM2
	GROUP BY Ambiente, UM, Anno, Mese, Centro

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaOreDatiCicliUM] TO [Metodo98]
    AS [dbo];

