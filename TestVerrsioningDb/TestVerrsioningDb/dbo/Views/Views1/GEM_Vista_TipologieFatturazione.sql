
CREATE VIEW [dbo].[GEM_Vista_TipologieFatturazione]
AS
SELECT [idTipoFatt]
      ,[Descrizione]
      ,[idModFatt]
      ,[PeriodoMinimo]
      ,[ValoriMultipliDI]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA]
  FROM [GEMMADBG].[dbo].[GEM_T_TabTipologieFatturazione]


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_TipologieFatturazione] TO [Metodo98]
    AS [dbo];

