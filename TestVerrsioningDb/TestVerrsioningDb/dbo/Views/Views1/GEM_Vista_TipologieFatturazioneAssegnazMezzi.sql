
CREATE VIEW [GEM_Vista_TipologieFatturazioneAssegnazMezzi]
AS
SELECT [idTipoFatt]
      ,[IdRiga]
      ,[idTipologMezzo]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA]
  FROM [GEMMADBG].[dbo].[GEM_T_TabTipologieFatturazioneAssegnazMezzi]

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_TipologieFatturazioneAssegnazMezzi] TO [Metodo98]
    AS [dbo];

