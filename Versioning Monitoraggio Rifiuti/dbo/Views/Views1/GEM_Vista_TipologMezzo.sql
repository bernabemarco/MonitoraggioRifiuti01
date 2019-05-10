
CREATE VIEW [GEM_Vista_TipologMezzo]
AS
SELECT [idTipologMezzo]
      ,[Descrizione]
      ,[Piattaforma]
      ,[ImportoContrattoSezione]
      ,[SezioneAggregabile]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA]
  FROM [GEMMADBG].[dbo].[GEM_T_TipologMezzo]

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_TipologMezzo] TO [Metodo98]
    AS [dbo];

