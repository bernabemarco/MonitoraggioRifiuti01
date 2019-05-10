CREATE VIEW dbo.Aldebra_VistaControlloArticoliSENZAListinoPreferenziale
AS
SELECT     dbo.Aldebra_VistaqAnagrfProdListinoFornPref.*
FROM         dbo.Aldebra_VistaqAnagrfProdListinoFornPref LEFT OUTER JOIN
                      dbo.LISTINIARTICOLI ON dbo.Aldebra_VistaqAnagrfProdListinoFornPref.LISTINO = dbo.LISTINIARTICOLI.NRLISTINO AND 
                      dbo.Aldebra_VistaqAnagrfProdListinoFornPref.CODICEART = dbo.LISTINIARTICOLI.CODART
WHERE     (dbo.LISTINIARTICOLI.NRLISTINO IS NULL)

GO
GRANT DELETE
    ON OBJECT::[dbo].[Aldebra_VistaControlloArticoliSENZAListinoPreferenziale] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Aldebra_VistaControlloArticoliSENZAListinoPreferenziale] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Aldebra_VistaControlloArticoliSENZAListinoPreferenziale] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Aldebra_VistaControlloArticoliSENZAListinoPreferenziale] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Aldebra_VistaControlloArticoliSENZAListinoPreferenziale] TO [Metodo98]
    AS [dbo];

