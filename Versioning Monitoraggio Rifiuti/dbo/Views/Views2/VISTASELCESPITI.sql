CREATE VIEW VISTASELCESPITI AS
	SELECT 
		(SELECT Descrizione FROM CategorieFiscali WHERE CodCatFis=Codice) AS DscCat,
		dbo.StatoCespite(Codice) AS Stato,			
		AnagraficaCespiti.*
	FROM
		AnagraficaCespiti

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASELCESPITI] TO [Metodo98]
    AS [dbo];

