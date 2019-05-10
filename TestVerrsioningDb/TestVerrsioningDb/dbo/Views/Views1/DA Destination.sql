
CREATE VIEW [dbo].[DA Destination] AS 

SELECT '' AS [timestamp]
      ,[CodDestinazione] AS [No_]
      ,[Descrizione] AS [Description]
      ,[TipoDestinazione] AS [Type Destination Code]
      ,[Divisione] AS [Divisione Code]
      ,[Responsabile] AS [Responsible Code]
      ,[TipoReversioni] AS [Reversions Type]
      ,[TipoMisurazione] AS [Measurement Type]
      ,[UMPrimaria] AS [Primary U_M_]
      ,[UMPrimaria2] AS [Primary U_M_ 2]
      ,[UMSecondaria] AS [Secondary U_M_]
      ,[UMSecondaria2] AS [Secondary U_M_ 2]
      ,[TipoRiferimento] AS [Reference Type]
      ,[RiclCosti] AS [Refiling Announces of Cost]
      ,[RiclRicavi] AS [Refiling Announces of Border]
      ,'' AS [Notes]
FROM CGesDestinazioni


GO
GRANT SELECT
    ON OBJECT::[dbo].[DA Destination] TO [Metodo98]
    AS [dbo];

