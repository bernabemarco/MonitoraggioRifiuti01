
CREATE VIEW [GEM_Vista_SigleDocMetodoDaCreare]
AS
SELECT [idRiga]
      ,[idModFatt]
      ,[idTipologMezzo]
      ,[TIPOLOGIARAPPORTO]
      ,[CodDocMetodo]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA]
  FROM [GEMMADBG].[dbo].[GEM_T_TAB_SigleDocMetodoDaCreare]

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_SigleDocMetodoDaCreare] TO [Metodo98]
    AS [dbo];

