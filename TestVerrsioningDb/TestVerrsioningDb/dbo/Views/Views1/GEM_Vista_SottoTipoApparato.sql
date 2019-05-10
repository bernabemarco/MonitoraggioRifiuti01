
CREATE VIEW [GEM_Vista_SottoTipoApparato]
AS
SELECT [IdSottoTipoApparato]
      ,[DESCRIZIONE]
      ,[IdApparato]
      ,[ORDINE]
      ,[DISMESSO]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA]
  FROM [GEMMADBG].[dbo].[GEM_T_TabSottoTipoApparato]

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_SottoTipoApparato] TO [Metodo98]
    AS [dbo];

