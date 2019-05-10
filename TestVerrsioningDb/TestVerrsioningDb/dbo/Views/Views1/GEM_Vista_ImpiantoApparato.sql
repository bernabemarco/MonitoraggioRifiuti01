
CREATE VIEW [GEM_Vista_ImpiantoApparato]
AS
SELECT [CodiceMezzo]
      ,[IdApparato]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA]
  FROM [GEMMADBG].[dbo].[GEM_T_TabImpiantoApparato]

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_ImpiantoApparato] TO [Metodo98]
    AS [dbo];

