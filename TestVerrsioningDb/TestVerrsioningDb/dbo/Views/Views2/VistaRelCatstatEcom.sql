CREATE VIEW VistaRelCatstatEcom AS
	SELECT distinct NOMEIMP FROM RELCATSTATECOM

GO
GRANT SELECT
    ON OBJECT::[dbo].[VistaRelCatstatEcom] TO [Metodo98]
    AS [dbo];

