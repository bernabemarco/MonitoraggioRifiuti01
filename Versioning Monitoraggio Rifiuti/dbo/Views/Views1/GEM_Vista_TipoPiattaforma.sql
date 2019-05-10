
CREATE VIEW [GEM_Vista_TipoPiattaforma]
AS
SELECT [CODICE]
      ,[DESCRIZIONE]
      ,[ORDINE]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA]
      ,[CodiceArticolo]
  FROM [GEMMADBG].[dbo].[GEM_T_TipoPiattaforma]

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_TipoPiattaforma] TO [Metodo98]
    AS [dbo];

