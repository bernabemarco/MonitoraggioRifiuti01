
CREATE VIEW [GEM_Vista_TipologMezziAttivita]
AS
SELECT [idTipologMezzo]
      ,[idRiga]
      ,[idAttivita]
      ,[Posizione]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA]
  FROM [GEMMADBG].[dbo].[GEM_T_TipologMezziAttivita]

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_TipologMezziAttivita] TO [Metodo98]
    AS [dbo];

