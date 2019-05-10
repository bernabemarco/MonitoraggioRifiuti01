
CREATE view TP_VISTA_TABSCONTI
AS
	SELECT TP_TABSCONTI.*,
		TP_TipiDiSconto.Descrizione AS DscTipo,
		TP_TipiDiSconto.FlagTipo AS FLAGTIPO
	FROM TP_TABSCONTI
	INNER JOIN TP_TipiDiSconto
			ON TP_TipiDiSconto.Codice=TP_TABSCONTI.Tipo


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VISTA_TABSCONTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VISTA_TABSCONTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTA_TABSCONTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VISTA_TABSCONTI] TO [Metodo98]
    AS [dbo];

