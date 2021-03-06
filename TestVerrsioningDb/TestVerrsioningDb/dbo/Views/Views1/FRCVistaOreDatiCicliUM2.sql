﻿
CREATE VIEW FRCVistaOreDatiCicliUM2 AS 
	SELECT T1.AMBIENTE AS Ambiente, T2.UnitaMisura AS UM, T1.ANNO AS Anno, T1.MESEDOC AS Mese, T1.CDCMop AS Centro, SUM(T1.TEMPOUOMOTOT) AS Ore
	FROM FRCDatiCicli T1 INNER JOIN FRCUnitaMisuraCDC T2 ON T1.AMBIENTE = T2.Ambiente AND T1.ANNO = T2.Anno AND T1.CDCMop = T2.CDCProd
	WHERE ISNULL(T2.UnitaMisura, '') <> ''
	GROUP BY T1.AMBIENTE, T2.UnitaMisura, T1.ANNO, T1.MESEDOC, T1.CDCMop
	HAVING SUM(T1.TEMPOUOMOTOT) <> 0
	UNION ALL
	SELECT T1.AMBIENTE AS Ambiente, T2.UnitaMisura AS UM, T1.ANNO AS Anno, T1.MESEDOC AS Mese, T1.CDCSetup AS Centro, SUM(T1.TEMPOSETUPTOT) AS Ore
	FROM FRCDatiCicli T1 INNER JOIN FRCUnitaMisuraCDC T2 ON T1.AMBIENTE = T2.Ambiente AND T1.ANNO = T2.Anno AND T1.CDCSetup = T2.CDCProd
	WHERE ISNULL(T2.UnitaMisura, '') <> ''
	GROUP BY T1.AMBIENTE, T2.UnitaMisura, T1.ANNO, T1.MESEDOC, T1.CDCSetup
	HAVING SUM(T1.TEMPOSETUPTOT) <> 0
	UNION ALL
	SELECT T1.AMBIENTE AS Ambiente, T2.UnitaMisura2 AS UM, T1.ANNO AS Anno, T1.MESEDOC AS Mese, T1.CDCProd AS Centro, SUM(T1.TEMPORISORSATOT) AS Ore
	FROM FRCDatiCicli T1 INNER JOIN FRCUnitaMisuraCDC T2 ON T1.AMBIENTE = T2.Ambiente AND T1.ANNO = T2.Anno AND T1.CDCProd = T2.CDCProd
	WHERE ISNULL(T2.UnitaMisura2, '') <> ''
	GROUP BY T1.AMBIENTE, T2.UnitaMisura2, T1.ANNO, T1.MESEDOC, T1.CDCProd
	HAVING SUM(T1.TEMPORISORSATOT) <> 0

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaOreDatiCicliUM2] TO [Metodo98]
    AS [dbo];

