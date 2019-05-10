
CREATE view TP_VISTA_TipidiSconto
AS
	SELECT
	TP_TipiDiSconto.Codice,
	TP_TipiDiSconto.Descrizione,
	CASE TP_TipiDiSconto.FlagTipo
		WHEN 0 THEN 'In Fattura'
		WHEN 1 THEN 'Fuori Fattura'
	END AS FLAGTIPO
	FROM TP_TipiDiSconto



GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VISTA_TipidiSconto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VISTA_TipidiSconto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTA_TipidiSconto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VISTA_TipidiSconto] TO [Metodo98]
    AS [dbo];

