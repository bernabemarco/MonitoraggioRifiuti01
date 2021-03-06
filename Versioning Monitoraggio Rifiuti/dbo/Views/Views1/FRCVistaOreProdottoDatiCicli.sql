﻿
CREATE VIEW FRCVistaOreProdottoDatiCicli AS 
	SELECT T1.AMBIENTE AS Ambiente, T2.UnitaMisura AS UM, T1.CDCSetup AS CentroO, T1.CDRProdotto AS CentroD, T1.ANNO AS Anno, T1.MESEDOC AS Mese, T1.TEMPOSETUPTOT AS Ore
	FROM FRCDatiCicli T1 INNER JOIN FRCUnitaMisuraCDC T2 ON T1.AMBIENTE = T2.Ambiente AND T1.ANNO = T2.Anno AND T1.CDCSetup = T2.CDCProd 
	WHERE ISNULL(T2.UnitaMisura, '') <> ''
	UNION ALL
	SELECT T1.AMBIENTE AS Ambiente, T2.UnitaMisura2 AS UM, T1.CDCProd AS CentroO, T1.CDRProdotto AS CentroD, T1.ANNO AS Anno, T1.MESEDOC AS Mese, T1.TEMPORISORSATOT AS Ore
	FROM FRCDatiCicli T1 INNER JOIN FRCUnitaMisuraCDC T2 ON T1.AMBIENTE = T2.Ambiente AND T1.ANNO = T2.Anno AND T1.CDCProd = T2.CDCProd 
	WHERE ISNULL(T2.UnitaMisura2, '') <> ''
	UNION ALL
	SELECT T1.AMBIENTE AS Ambiente, T2.UnitaMisura AS UM, T1.CDCMop AS CentroO, T1.CDRProdotto AS CentroD, T1.ANNO AS Anno, T1.MESEDOC AS Mese, T1.TEMPOUOMOTOT AS Ore
	FROM FRCDatiCicli T1 INNER JOIN FRCUnitaMisuraCDC T2 ON T1.AMBIENTE = T2.Ambiente AND T1.ANNO = T2.Anno AND T1.CDCMop = T2.CDCProd 
	WHERE ISNULL(T2.UnitaMisura, '') <> ''

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaOreProdottoDatiCicli] TO [Metodo98]
    AS [dbo];

