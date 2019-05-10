
CREATE VIEW [dbo].[DA Formula Financial Ratios] AS 

SELECT '' AS [timestamp]
      ,[Codice] AS [Code]
      ,[Descrizione] AS [Description]
      ,[Note] AS [Notes]
      ,[Formula] AS [Formula]
      ,'' AS [Type Refiling Code]
      ,'' AS [Entry]
      ,'' AS [U_M_]
      ,'' AS [Code Formula]
      ,ValoreMinimo AS [Minimum Value]
      ,ValoreMassimo AS [Maximum Value]
      ,MoltiplicatoreEtichette AS [Multiplier Scale Labels]
      ,ValoreOttimale AS [Optimal Value]
      ,ConAltreFormule AS [With Others Formulas]
FROM CGesFormuleBilancio


GO
GRANT SELECT
    ON OBJECT::[dbo].[DA Formula Financial Ratios] TO [Metodo98]
    AS [dbo];

