
CREATE VIEW VistaStampaEtichettePackingList
AS
	SELECT     *
	FROM         VISTAETICHETTEPACKINGLIST INNER JOIN
	                      NUMERI ON VISTAETICHETTEPACKINGLIST.Colli >= NUMERI.NUMERO


GO
GRANT SELECT
    ON OBJECT::[dbo].[VistaStampaEtichettePackingList] TO [Metodo98]
    AS [dbo];

