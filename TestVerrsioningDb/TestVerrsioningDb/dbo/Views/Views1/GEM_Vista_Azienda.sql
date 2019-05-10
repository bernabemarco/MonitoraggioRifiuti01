

CREATE VIEW [GEM_Vista_Azienda]
AS
SELECT [idAzienda]  collate SQL_Latin1_General_CP1_CI_AS as [idAzienda] 
      ,[RagioneSociale]
      ,[Logo]
      ,[CS]
      ,[CSNP]
      ,[METODOCS]
      ,[NomeDittaMETODO]
      ,[flgMailAgenti]
      ,[flgVendutoImpSFS]
      ,[flgpalmtec]
      ,[flgMailBloccati]
      ,[flgFattAutomatica]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA]
  FROM [GEMMADBG].[dbo].[GEM_T_TAB_Azienda]

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_Azienda] TO [Metodo98]
    AS [dbo];

