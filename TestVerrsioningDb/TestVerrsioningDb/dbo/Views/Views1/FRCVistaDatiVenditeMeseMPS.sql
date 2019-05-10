
CREATE VIEW [dbo].[FRCVistaDatiVenditeMeseMPS]
AS
SELECT		RIGHT(dbo.FRCDatiVenditeBudget.AMBIENTE, 50) + CAST(dbo.FRCDatiVenditeBudget.ANNODOC AS varchar(4)) + 'FORECAST' AS RIF, 
		dbo.FRCDatiVenditeBudget.MESEDOC,
		dbo.FRCDatiVenditeBudget.CODART,
		dbo.ARTICOLIUMPREFERITE.UM AS UMBASE, 
		SUM(dbo.FRCDatiVenditeBudget.QTAGEST * dbo.FRCDatiVenditeBudget.FATTORE) AS QTABASE
FROM            dbo.FRCDatiVenditeBudget LEFT OUTER JOIN
                         dbo.ARTICOLIUMPREFERITE ON dbo.FRCDatiVenditeBudget.CODART = dbo.ARTICOLIUMPREFERITE.CODART
WHERE		(dbo.ARTICOLIUMPREFERITE.TIPOUM = 1)
GROUP BY	RIGHT(dbo.FRCDatiVenditeBudget.AMBIENTE, 50) + CAST(dbo.FRCDatiVenditeBudget.ANNODOC AS varchar(4)) + 'FORECAST',
		dbo.FRCDatiVenditeBudget.MESEDOC,
		dbo.FRCDatiVenditeBudget.CODART,
		dbo.ARTICOLIUMPREFERITE.UM

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaDatiVenditeMeseMPS] TO [Metodo98]
    AS [dbo];

