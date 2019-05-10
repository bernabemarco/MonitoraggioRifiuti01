
CREATE VIEW [dbo].[DA Historical Quantity] AS 

SELECT '' AS [timestamp]
      ,[CodDestinazione] AS [Destination No_]
      ,[UnitaMisura] AS [U_M_]
      ,[CodDestinazioneOrig] AS [Origin Quantity No_]
      ,[Anno] AS [Year]
      ,[Mese] AS [Month]
      ,[Valore] AS [Quantity]
      ,[Ambiente] AS [Environment Code]
      ,[Tipo] AS [Type]
      ,([Anno] * 12) + [Mese] AS [Month No_]
FROM CGesStoricoQuantita


GO
GRANT SELECT
    ON OBJECT::[dbo].[DA Historical Quantity] TO [Metodo98]
    AS [dbo];

