CREATE VIEW [dbo].[GEM_Vista_CodiciMezziAssegnati]
AS
SELECT [idTipologMezzo]
      ,[idRiga]
      ,[CodiceMezzo]
      ,[NOTE]
      ,[Dismesso]
      ,[TipoCeckList]
      ,[ListaComponenti]
      ,[GeneraDettaglioMezziFittizio]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA]
      ,[TipoRapporto]
	  ,[DescTipoQuantita]
  FROM [GEMMADBG].[dbo].[GEM_T_TabCodiciMezziAssegnati]

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_CodiciMezziAssegnati] TO [Metodo98]
    AS [dbo];

