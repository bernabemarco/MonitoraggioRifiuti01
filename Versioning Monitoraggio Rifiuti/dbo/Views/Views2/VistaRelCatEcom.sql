CREATE VIEW VistaRelCatEcom AS
	SELECT distinct NOMEIMP FROM RELCATECOM

GO
GRANT SELECT
    ON OBJECT::[dbo].[VistaRelCatEcom] TO [Metodo98]
    AS [dbo];

