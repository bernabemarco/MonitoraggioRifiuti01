CREATE VIEW [dbo].[Ald_Day_Vista_EstrTimeSheet_OreLav] AS
	SELECT
		RifCMFM AS OggettoDestinatario,
		IdRespCid,dtint,
		(SELECT TOP 1 idCDC FROM Ald_VistaConsAnagrRespCid WHERE Ald_VistaConsAnagrRespCid.IdRespCid=vsd.IdRespCid) AS OggettoMittente,
		(SELECT TOP 1 idVDC FROM Ald_VistaConsAnagrRespCid WHERE Ald_VistaConsAnagrRespCid.IdRespCid=vsd.IdRespCid) AS idVDC,
		((SELECT CostoStd FROM Ald_VistaConsAnagrRespCid WHERE Ald_VistaConsAnagrRespCid.IdRespCid=vsd.IdRespCid) * TotOre ) AS ImportoPeriodo,
		TotOre AS QuantitaOre
	FROM Ald_VistaUnionAttivitaCidCommessa AS VSD 
GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_Day_Vista_EstrTimeSheet_OreLav] TO [Metodo98]
    AS [dbo];

