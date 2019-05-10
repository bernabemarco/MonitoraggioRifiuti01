
CREATE VIEW [GEM_Vista_StatoAttivitaMezzo]
AS
SELECT [Codice]
      ,[Descrizione]
      ,[FlagPerESEGUITO]
      ,[FlagPerELIMINAZIONE]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA]
  FROM [GEMMADBG].[dbo].[GEM_T_TAB_StatoAttivitaMezzo]

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_StatoAttivitaMezzo] TO [Metodo98]
    AS [dbo];

