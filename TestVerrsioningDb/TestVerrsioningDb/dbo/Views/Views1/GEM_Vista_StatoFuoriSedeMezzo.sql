
CREATE VIEW [GEM_Vista_StatoFuoriSedeMezzo]
AS
SELECT [Codice]
      ,[Descrizione]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA]
  FROM [GEMMADBG].[dbo].[GEM_T_TAB_StatoFuoriSedeMezzo]

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_StatoFuoriSedeMezzo] TO [Metodo98]
    AS [dbo];

