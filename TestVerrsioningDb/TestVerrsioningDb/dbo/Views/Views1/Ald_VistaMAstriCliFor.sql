CREATE VIEW [dbo].[Ald_VistaMAstriCliFor] AS 	
	SELECT 
		CASE WHEN left(GrConti, 2)='CL' THEN 'C' ELSE 'F' END AS TIPOCONTO,
		CODICE, DESCRIZIONE, GRCONTI 	FROM [dbo].[TabMastri] 
		where left(GrConti, 2) in ('CL','FO')

GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_VistaMAstriCliFor] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_VistaMAstriCliFor] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Ald_VistaMAstriCliFor] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistaMAstriCliFor] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_VistaMAstriCliFor] TO [Metodo98]
    AS [dbo];

