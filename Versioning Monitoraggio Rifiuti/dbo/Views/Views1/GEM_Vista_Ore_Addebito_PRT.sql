
CREATE VIEW [GEM_Vista_Ore_Addebito_PRT]
AS
SELECT [idRiga]
      ,[DESCRIZIONE]
      ,[TIPOLOGIARAPPORTO] collate SQL_Latin1_General_CP1_CI_AS as TIPOLOGIARAPPORTO
      ,[idTipologMezzo]
      ,[CodArticoloMET_OREORD]
      ,[CodArticoloMET_ORESTRA]
      ,[CodArticoloMET_OREVIAGGIO]
      ,[CodArticoloMET_TRASFERTA]
      ,[CodArticoloMET_KM]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA]
  FROM [GEMMADBG].[dbo].[GEM_T_TAB_Ore_Addebito]

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_Ore_Addebito_PRT] TO [Metodo98]
    AS [dbo];

