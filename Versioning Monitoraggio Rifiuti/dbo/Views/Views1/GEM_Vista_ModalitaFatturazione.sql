
CREATE VIEW [dbo].[GEM_Vista_ModalitaFatturazione]
AS

SELECT [idModFatt]
      ,[Descrizione]
      ,[FatturaRateale]
      ,[PosizioneSceltaModalita]
      ,[ModalitaExportVenduto]
      ,[MiniSFS]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA]
  FROM GEMMADBG.dbo.GEM_T_ModalitaFatturazione

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_ModalitaFatturazione] TO [Metodo98]
    AS [dbo];

