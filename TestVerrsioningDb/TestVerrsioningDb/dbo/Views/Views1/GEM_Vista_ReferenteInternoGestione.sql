
CREATE VIEW [GEM_Vista_ReferenteInternoGestione]
AS

SELECT [CODReferenteInternoGestione]
      ,[DSCReferente]
      ,[NOTE]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA]
  FROM [GEMMADBG].[dbo].[GEM_T_ReferenteInternoGestione]

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_ReferenteInternoGestione] TO [Metodo98]
    AS [dbo];

