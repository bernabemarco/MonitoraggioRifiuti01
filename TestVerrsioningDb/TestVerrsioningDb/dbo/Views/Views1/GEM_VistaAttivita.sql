CREATE VIEW [dbo].[GEM_VistaAttivita]
AS
select IdAttivita, Descrizione, Primaria from GEMMADBG.dbo.GEM_T_TabAttivita

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaAttivita] TO [Metodo98]
    AS [dbo];

