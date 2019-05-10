CREATE VIEW GEM_VistaListiniModello AS
	SELECT * 
  FROM GEMMADBG.dbo.GEM_T_ListiniModello

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaListiniModello] TO [Metodo98]
    AS [dbo];

