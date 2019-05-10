
CREATE VIEW [GEM_Vista_Apparati]
AS
SELECT [IdApparato]
      ,[DESCRIZIONE]
      ,[ORDINE]
      ,[DISMESSO]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA]
  FROM [GEMMADBG].[dbo].[GEM_T_TabApparati]

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_Apparati] TO [Metodo98]
    AS [dbo];

