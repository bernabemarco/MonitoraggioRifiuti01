
CREATE VIEW [GEM_Vista_TAB_StatoProcessoRapporti]
AS
SELECT *
  FROM [GEMMADBG].[dbo].GEM_T_TAB_StatoProcessoRapporti

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_TAB_StatoProcessoRapporti] TO [Metodo98]
    AS [dbo];

