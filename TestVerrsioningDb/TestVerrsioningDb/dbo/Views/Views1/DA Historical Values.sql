
CREATE VIEW [dbo].[DA Historical Values] AS 

SELECT '' AS [timestamp]
      ,[Ambiente] AS [Environment Code]
      ,[CodDestinazione] AS [Destination No_]
      ,[CodConto] AS [Account No_]
      ,[CodDestinazioneRev] AS [Reversions Destination No_]
      ,[Tipo] AS [Type]
      ,[Anno] AS [Year]
      ,[Mese] AS [Month]
      ,[ValoreVariabile] AS [Variable Value]
      ,[ValoreFisso] AS [Fixed Value]
      ,[Segno] AS [Sign]
      ,[Tipologia] AS [Typology]
      ,([Anno] * 12) + [Mese] AS [Month No_]
      ,CASE WHEN [Segno]=1 THEN [ValoreVariabile] ELSE [ValoreVariabile] * -1 END AS [Variable Value Signed]
      ,CASE WHEN [Segno]=1 THEN [ValoreFisso] ELSE [ValoreFisso] * -1 END AS [Fixed Value Signed]
FROM CGesValoriStorici


GO
GRANT SELECT
    ON OBJECT::[dbo].[DA Historical Values] TO [Metodo98]
    AS [dbo];

