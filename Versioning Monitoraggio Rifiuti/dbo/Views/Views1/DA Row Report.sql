﻿
CREATE VIEW [dbo].[DA Row Report] AS 


SELECT '' AS [timestamp]
      ,[RifProgressivo] AS [No_]
      ,[Numero] AS [Row]
      ,ISNULL([ContoVoce], '') AS [Code]
      ,[Descrizione] AS [Description]
      ,[Importo] AS [Value]
      ,[Percentuale] AS [Percentage]
      ,[Grassetto] AS [Bold]
      ,[Colore] AS [Color]
      ,[TabulazioneStampa] AS [Print Column]
      ,[StampaImporto] AS [Print Value]
      ,[ColoreSeNegativo] AS [Color If Negative]
      ,[Importo01] AS [Value 01]
      ,[Importo02] AS [Value 02]
      ,[Importo03] AS [Value 03]
      ,[Importo04] AS [Value 04]
      ,[Importo05] AS [Value 05]
      ,[Importo06] AS [Value 06]
      ,[Importo07] AS [Value 07]
      ,[Importo08] AS [Value 08]
      ,[Importo09] AS [Value 09]
      ,[Importo10] AS [Value 10]
      ,[Importo11] AS [Value 11]
      ,[Importo12] AS [Value 12]
      ,ISNULL([Gruppo], '') AS [Group]
      ,ISNULL([OrdineGruppo], 0) AS [Group Order]
      ,ISNULL([VoceGruppo], '') AS [Entry]
      ,0 AS [Variable Value]
      ,0 AS [Fixed Value]
      ,0 AS [Total Value]
      ,0 AS [Index]
      ,0 AS [Total Value Perc_]
      ,0 AS [Is Total]
      ,0 AS [Variable Value 01]
      ,0 AS [Variable Value 02]
      ,0 AS [Variable Value 03]
      ,0 AS [Variable Value 04]
      ,0 AS [Variable Value 05]
      ,0 AS [Variable Value 06]
      ,0 AS [Variable Value 07]
      ,0 AS [Variable Value 08]
      ,0 AS [Variable Value 09]
      ,0 AS [Variable Value 10]
      ,0 AS [Variable Value 11]
      ,0 AS [Variable Value 12]
      ,0 AS [Fixed Value 01]
      ,0 AS [Fixed Value 02]
      ,0 AS [Fixed Value 03]
      ,0 AS [Fixed Value 04]
      ,0 AS [Fixed Value 05]
      ,0 AS [Fixed Value 06]
      ,0 AS [Fixed Value 07]
      ,0 AS [Fixed Value 08]
      ,0 AS [Fixed Value 09]
      ,0 AS [Fixed Value 10]
      ,0 AS [Fixed Value 11]
      ,0 AS [Fixed Value 12]
      ,'' AS [Entry Code]
      ,0 AS [Days]
      ,0 AS [Month]
      ,0 AS [Days P_]
      ,0 AS [Quantity]
      ,0 AS [Incoming]
      ,0 AS [Fixed Costs]
      ,0 AS [Variable Costs]
      ,0 AS [Total Costs]
      ,0 AS [Result]
      ,0 AS [Incoming Absolute]
      ,0 AS [Fixed Costs Absolute]
      ,0 AS [Variable Costs Absolute]
      ,0 AS [Total Costs Absolute]
      ,0 AS [Result Absolute]
FROM CGesBilancioRighe
UNION ALL
SELECT '' AS [timestamp]
      ,[RifProgressivo] + 1000000000 AS [No_]
      ,[Numero] AS [Row]
      ,ISNULL([ContoVoce], '') AS [Code]
      ,[Descrizione] AS [Description]
      ,0 AS [Value]
      ,[Percentuale] AS [Percentage]
      ,[Grassetto] AS [Bold]
      ,[Colore] AS [Color]
      ,[TabulazioneStampa] AS [Print Column]
      ,[StampaImporto] AS [Print Value]
      ,[ColoreSeNegativo] AS [Color If Negative]
      ,[Importo01] AS [Value 01]
      ,[Importo02] AS [Value 02]
      ,[Importo03] AS [Value 03]
      ,[Importo04] AS [Value 04]
      ,[Importo05] AS [Value 05]
      ,[Importo06] AS [Value 06]
      ,[Importo07] AS [Value 07]
      ,[Importo08] AS [Value 08]
      ,[Importo09] AS [Value 09]
      ,[Importo10] AS [Value 10]
      ,[Importo11] AS [Value 11]
      ,[Importo12] AS [Value 12]
      ,ISNULL([Gruppo], '') AS [Group]
      ,ISNULL([OrdineGruppo], 0) AS [Group Order]
      ,ISNULL([VoceGruppo], '') AS [Entry]
      ,[ImportoVariabile] AS [Variable Value]
      ,[ImportoFisso] AS [Fixed Value]
      ,[ImportoTotale] AS [Total Value]
      ,[Indice] AS [Index]
      ,0 AS [Total Value Perc_]
      ,0 AS [Is Total]
      ,0 AS [Variable Value 01]
      ,0 AS [Variable Value 02]
      ,0 AS [Variable Value 03]
      ,0 AS [Variable Value 04]
      ,0 AS [Variable Value 05]
      ,0 AS [Variable Value 06]
      ,0 AS [Variable Value 07]
      ,0 AS [Variable Value 08]
      ,0 AS [Variable Value 09]
      ,0 AS [Variable Value 10]
      ,0 AS [Variable Value 11]
      ,0 AS [Variable Value 12]
      ,0 AS [Fixed Value 01]
      ,0 AS [Fixed Value 02]
      ,0 AS [Fixed Value 03]
      ,0 AS [Fixed Value 04]
      ,0 AS [Fixed Value 05]
      ,0 AS [Fixed Value 06]
      ,0 AS [Fixed Value 07]
      ,0 AS [Fixed Value 08]
      ,0 AS [Fixed Value 09]
      ,0 AS [Fixed Value 10]
      ,0 AS [Fixed Value 11]
      ,0 AS [Fixed Value 12]
      ,'' AS [Entry Code]
      ,0 AS [Days]
      ,0 AS [Month]
      ,0 AS [Days P_]
      ,0 AS [Quantity]
      ,0 AS [Incoming]
      ,0 AS [Fixed Costs]
      ,0 AS [Variable Costs]
      ,0 AS [Total Costs]
      ,0 AS [Result]
      ,0 AS [Incoming Absolute]
      ,0 AS [Fixed Costs Absolute]
      ,0 AS [Variable Costs Absolute]
      ,0 AS [Total Costs Absolute]
      ,0 AS [Result Absolute]
FROM CGesAnalisiIndividualeRighe
UNION ALL
SELECT '' AS [timestamp]
      ,[RifProgressivo] + 2000000000 AS [No_]
      ,[Numero] AS [Row]
	  ,ISNULL([ContoVoce], '') AS [Code]
	  ,[Descrizione] AS [Description]
      ,0 AS [Value]
      ,0 AS [Percentage]
	  ,[Grassetto] AS [Bold]
	  ,[Colore] AS [Color]
      ,0 AS [Print Column]
	  ,[StampaImporto] AS [Print Value]
	  ,[ColoreSeNegativo] AS [Color If Negative]
	  ,[Importo01] AS [Value 01]
	  ,[Importo02] AS [Value 02]
	  ,[Importo03] AS [Value 03]
	  ,[Importo04] AS [Value 04]
	  ,[Importo05] AS [Value 05]
	  ,[Importo06] AS [Value 06]
	  ,[Importo07] AS [Value 07]
	  ,[Importo08] AS [Value 08]
	  ,[Importo09] AS [Value 09]
	  ,[Importo10] AS [Value 10]
	  ,[Importo11] AS [Value 11]
	  ,[Importo12] AS [Value 12]
      ,ISNULL([Gruppo], '') AS [Group]
      ,ISNULL([OrdineGruppo], 0) AS [Group Order]
      ,ISNULL([VoceGruppo], '') AS [Entry]
	  ,[ImportoVarTotale] AS [Variable Value]
	  ,[ImportoFisTotale] AS [Fixed Value]
	  ,[ImportoTotale] AS [Total Value]
      ,0 AS [Index]
	  ,[ImportoTotalePerc] AS [Total Value Perc_]
	  ,[Totale] AS [Is Total]
	  ,[ImportoVar01] AS [Variable Value 01]
	  ,[ImportoVar02] AS [Variable Value 02]
	  ,[ImportoVar03] AS [Variable Value 03]
	  ,[ImportoVar04] AS [Variable Value 04]
	  ,[ImportoVar05] AS [Variable Value 05]
	  ,[ImportoVar06] AS [Variable Value 06]
	  ,[ImportoVar07] AS [Variable Value 07]
	  ,[ImportoVar08] AS [Variable Value 08]
	  ,[ImportoVar09] AS [Variable Value 09]
	  ,[ImportoVar10] AS [Variable Value 10]
	  ,[ImportoVar11] AS [Variable Value 11]
	  ,[ImportoVar12] AS [Variable Value 12]
	  ,[ImportoFis01] AS [Fixed Value 01]
	  ,[ImportoFis02] AS [Fixed Value 02]
	  ,[ImportoFis03] AS [Fixed Value 03]
	  ,[ImportoFis04] AS [Fixed Value 04]
	  ,[ImportoFis05] AS [Fixed Value 05]
	  ,[ImportoFis06] AS [Fixed Value 06]
	  ,[ImportoFis07] AS [Fixed Value 07]
	  ,[ImportoFis08] AS [Fixed Value 08]
	  ,[ImportoFis09] AS [Fixed Value 09]
	  ,[ImportoFis10] AS [Fixed Value 10]
	  ,[ImportoFis11] AS [Fixed Value 11]
	  ,[ImportoFis12] AS [Fixed Value 12]
	  ,[Voce] AS [Entry Code]
      ,0 AS [Days]
      ,0 AS [Month]
      ,0 AS [Days P_]
      ,0 AS [Quantity]
      ,0 AS [Incoming]
      ,0 AS [Fixed Costs]
      ,0 AS [Variable Costs]
      ,0 AS [Total Costs]
      ,0 AS [Result]
      ,0 AS [Incoming Absolute]
      ,0 AS [Fixed Costs Absolute]
      ,0 AS [Variable Costs Absolute]
      ,0 AS [Total Costs Absolute]
      ,0 AS [Result Absolute]
FROM CGesReportFogliRiepilogoRighe
UNION ALL
SELECT '' AS [timestamp]
      ,[RifProgressivo] + 3000000000 AS [No_]
      ,[Numero] AS [Row]
      ,ISNULL([ContoVoce], '') AS [Code]
      ,[Descrizione] AS [Description]
      ,0 AS [Value]
      ,0 AS [Percentage]
      ,0 AS [Bold]
      ,0 AS [Color]
      ,0 AS [Print Column]
      ,0 AS [Print Value]
      ,0 AS [Color If Negative]
      ,0 AS [Value 01]
      ,0 AS [Value 02]
      ,0 AS [Value 03]
      ,0 AS [Value 04]
      ,0 AS [Value 05]
      ,0 AS [Value 06]
      ,0 AS [Value 07]
      ,0 AS [Value 08]
      ,0 AS [Value 09]
      ,0 AS [Value 10]
      ,0 AS [Value 11]
      ,0 AS [Value 12]
      ,'' AS [Group]
      ,0 AS [Group Order]
      ,'' AS [Entry]
      ,0 AS [Variable Value]
      ,0 AS [Fixed Value]
      ,0 AS [Total Value]
      ,0 AS [Index]
      ,0 AS [Total Value Perc_]
      ,0 AS [Is Total]
      ,0 AS [Variable Value 01]
      ,0 AS [Variable Value 02]
      ,0 AS [Variable Value 03]
      ,0 AS [Variable Value 04]
      ,0 AS [Variable Value 05]
      ,0 AS [Variable Value 06]
      ,0 AS [Variable Value 07]
      ,0 AS [Variable Value 08]
      ,0 AS [Variable Value 09]
      ,0 AS [Variable Value 10]
      ,0 AS [Variable Value 11]
      ,0 AS [Variable Value 12]
      ,0 AS [Fixed Value 01]
      ,0 AS [Fixed Value 02]
      ,0 AS [Fixed Value 03]
      ,0 AS [Fixed Value 04]
      ,0 AS [Fixed Value 05]
      ,0 AS [Fixed Value 06]
      ,0 AS [Fixed Value 07]
      ,0 AS [Fixed Value 08]
      ,0 AS [Fixed Value 09]
      ,0 AS [Fixed Value 10]
      ,0 AS [Fixed Value 11]
      ,0 AS [Fixed Value 12]
      ,'' AS [Entry Code]
      ,[Giorni] AS [Days]
      ,[Mese] AS [Month]
      ,[GiorniP] AS [Days P_]
      ,[Quantita] AS [Quantity]
      ,[Ricavi] AS [Incoming]
      ,[CostiFissi] AS [Fixed Costs]
      ,[CostiVariabili] AS [Variable Costs]
      ,[CostiTotali] AS [Total Costs]
      ,[Risultato] AS [Result]
      ,ABS([Ricavi]) AS [Incoming Absolute]
      ,ABS([CostiFissi]) AS [Fixed Costs Absolute]
      ,ABS([CostiVariabili]) AS [Variable Costs Absolute]
      ,ABS([CostiTotali]) AS [Total Costs Absolute]
      ,ABS([Risultato]) AS [Result Absolute]
FROM CGesCalcoloBEPRighe


GO
GRANT SELECT
    ON OBJECT::[dbo].[DA Row Report] TO [Metodo98]
    AS [dbo];

