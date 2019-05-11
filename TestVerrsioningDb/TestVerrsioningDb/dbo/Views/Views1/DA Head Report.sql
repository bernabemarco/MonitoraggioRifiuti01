﻿
CREATE VIEW [dbo].[DA Head Report] AS 

SELECT '' AS [timestamp]
      ,[Progressivo] AS [No_]
      ,'BIL' AS [Report]
      ,[TipoReport] AS [Type]
      ,CASE WHEN ISNULL([Nome],'')='' THEN 'Senza Nome' ELSE [Nome] END AS [Report Name]
      ,[Ambiente] AS [Environment Code]
      ,[AnnoInizio] AS [Start Year]
      ,[MeseInizio] AS [Start Month]
      ,[AnnoFine] AS [End Year]
      ,[MeseFine] AS [End Month]
      ,ISNULL([DesIntestazione], '') AS [Header]
      ,[Mese01] AS [Month 01]
      ,[Mese02] AS [Month 02]
      ,[Mese03] AS [Month 03]
      ,[Mese04] AS [Month 04]
      ,[Mese05] AS [Month 05]
      ,[Mese06] AS [Month 06]
      ,[Mese07] AS [Month 07]
      ,[Mese08] AS [Month 08]
      ,[Mese09] AS [Month 09]
      ,[Mese10] AS [Month 10]
      ,[Mese11] AS [Month 11]
      ,[Mese12] AS [Month 12]
      ,[DesTotale] AS [Total]
      ,[TipoRiclassificazione] AS [Type Refiling Code]
      ,'' AS [Destination No_]
      ,'' AS [Destination Description]
      ,'' AS [Type Description]
      ,'' AS [Division Description]
      ,'' AS [Responsible Description]
      ,'' AS [UM1 Description]
      ,'' AS [UM2 Description]
      ,'' AS [UM1 Sec_ Description]
      ,'' AS [UM2 Sec_ Description]
      ,0 AS [Type Destination Typology]
      ,0 AS [Measurement Type]
      ,'' AS [Description Foot 1]
      ,'' AS [Description Foot 2]
      ,'' AS [Description Foot 3]
      ,'' AS [Description Foot 4]
      ,'' AS [Description Foot 5]
      ,0 AS [Production 1]
      ,0 AS [Variable Index 1]
      ,0 AS [Fixed Index 1]
      ,0 AS [Total Index 1]
      ,0 AS [Production 2]
      ,0 AS [Variable Index 2]
      ,0 AS [Fixed Index 2]
      ,0 AS [Total Index 2]
      ,0 AS [Production Sec_ 1]
      ,0 AS [Variable Index Sec_ 1]
      ,0 AS [Fixed Index Sec_ 1]
      ,0 AS [Total Index Sec_ 1]
      ,0 AS [Production Sec_ 2]
      ,0 AS [Variable Index Sec_ 2]
      ,0 AS [Fixed Index Sec_ 2]
      ,0 AS [Total Index Sec_ 2]
      ,0 AS [Production 1 01]
      ,0 AS [Production 1 02]
      ,0 AS [Production 1 03]
      ,0 AS [Production 1 04]
      ,0 AS [Production 1 05]
      ,0 AS [Production 1 06]
      ,0 AS [Production 1 07]
      ,0 AS [Production 1 08]
      ,0 AS [Production 1 09]
      ,0 AS [Production 1 10]
      ,0 AS [Production 1 11]
      ,0 AS [Production 1 12]
      ,0 AS [Variable Index 1 01]
      ,0 AS [Variable Index 1 02]
      ,0 AS [Variable Index 1 03]
      ,0 AS [Variable Index 1 04]
      ,0 AS [Variable Index 1 05]
      ,0 AS [Variable Index 1 06]
      ,0 AS [Variable Index 1 07]
      ,0 AS [Variable Index 1 08]
      ,0 AS [Variable Index 1 09]
      ,0 AS [Variable Index 1 10]
      ,0 AS [Variable Index 1 11]
      ,0 AS [Variable Index 1 12]
      ,0 AS [Production 2 01]
      ,0 AS [Production 2 02]
      ,0 AS [Production 2 03]
      ,0 AS [Production 2 04]
      ,0 AS [Production 2 05]
      ,0 AS [Production 2 06]
      ,0 AS [Production 2 07]
      ,0 AS [Production 2 08]
      ,0 AS [Production 2 09]
      ,0 AS [Production 2 10]
      ,0 AS [Production 2 11]
      ,0 AS [Production 2 12]
      ,0 AS [Fixed Index 2 01]
      ,0 AS [Fixed Index 2 02]
      ,0 AS [Fixed Index 2 03]
      ,0 AS [Fixed Index 2 04]
      ,0 AS [Fixed Index 2 05]
      ,0 AS [Fixed Index 2 06]
      ,0 AS [Fixed Index 2 07]
      ,0 AS [Fixed Index 2 08]
      ,0 AS [Fixed Index 2 09]
      ,0 AS [Fixed Index 2 10]
      ,0 AS [Fixed Index 2 11]
      ,0 AS [Fixed Index 2 12]
      ,0 AS [Production Sec_ 1 01]
      ,0 AS [Production Sec_ 1 02]
      ,0 AS [Production Sec_ 1 03]
      ,0 AS [Production Sec_ 1 04]
      ,0 AS [Production Sec_ 1 05]
      ,0 AS [Production Sec_ 1 06]
      ,0 AS [Production Sec_ 1 07]
      ,0 AS [Production Sec_ 1 08]
      ,0 AS [Production Sec_ 1 09]
      ,0 AS [Production Sec_ 1 10]
      ,0 AS [Production Sec_ 1 11]
      ,0 AS [Production Sec_ 1 12]
      ,0 AS [Variable Index Sec_ 1 01]
      ,0 AS [Variable Index Sec_ 1 02]
      ,0 AS [Variable Index Sec_ 1 03]
      ,0 AS [Variable Index Sec_ 1 04]
      ,0 AS [Variable Index Sec_ 1 05]
      ,0 AS [Variable Index Sec_ 1 06]
      ,0 AS [Variable Index Sec_ 1 07]
      ,0 AS [Variable Index Sec_ 1 08]
      ,0 AS [Variable Index Sec_ 1 09]
      ,0 AS [Variable Index Sec_ 1 10]
      ,0 AS [Variable Index Sec_ 1 11]
      ,0 AS [Variable Index Sec_ 1 12]
      ,0 AS [Production Sec_ 2 01]
      ,0 AS [Production Sec_ 2 02]
      ,0 AS [Production Sec_ 2 03]
      ,0 AS [Production Sec_ 2 04]
      ,0 AS [Production Sec_ 2 05]
      ,0 AS [Production Sec_ 2 06]
      ,0 AS [Production Sec_ 2 07]
      ,0 AS [Production Sec_ 2 08]
      ,0 AS [Production Sec_ 2 09]
      ,0 AS [Production Sec_ 2 10]
      ,0 AS [Production Sec_ 2 11]
      ,0 AS [Production Sec_ 2 12]
      ,0 AS [Fixed Index Sec_ 2 01]
      ,0 AS [Fixed Index Sec_ 2 02]
      ,0 AS [Fixed Index Sec_ 2 03]
      ,0 AS [Fixed Index Sec_ 2 04]
      ,0 AS [Fixed Index Sec_ 2 05]
      ,0 AS [Fixed Index Sec_ 2 06]
      ,0 AS [Fixed Index Sec_ 2 07]
      ,0 AS [Fixed Index Sec_ 2 08]
      ,0 AS [Fixed Index Sec_ 2 09]
      ,0 AS [Fixed Index Sec_ 2 10]
      ,0 AS [Fixed Index Sec_ 2 11]
      ,0 AS [Fixed Index Sec_ 2 12]
      ,'' AS [Summary Sheet Code]
      ,0 AS [Sheet Number]
      ,0 AS [Last Sheet]
      ,'' AS [Destination No_ 01]
      ,'' AS [Destination No_ 02]
      ,'' AS [Destination No_ 03]
      ,'' AS [Destination No_ 04]
      ,'' AS [Destination No_ 05]
      ,'' AS [Destination No_ 06]
      ,'' AS [Destination No_ 07]
      ,'' AS [Destination No_ 08]
      ,'' AS [Destination No_ 09]
      ,'' AS [Destination No_ 10]
      ,'' AS [Destination No_ 11]
      ,'' AS [Destination No_ 12]
      ,'' AS [UM1 Description 01]
      ,'' AS [UM1 Description 02]
      ,'' AS [UM1 Description 03]
      ,'' AS [UM1 Description 04]
      ,'' AS [UM1 Description 05]
      ,'' AS [UM1 Description 06]
      ,'' AS [UM1 Description 07]
      ,'' AS [UM1 Description 08]
      ,'' AS [UM1 Description 09]
      ,'' AS [UM1 Description 10]
      ,'' AS [UM1 Description 11]
      ,'' AS [UM1 Description 12]
      ,'' AS [UM2 Description 01]
      ,'' AS [UM2 Description 02]
      ,'' AS [UM2 Description 03]
      ,'' AS [UM2 Description 04]
      ,'' AS [UM2 Description 05]
      ,'' AS [UM2 Description 06]
      ,'' AS [UM2 Description 07]
      ,'' AS [UM2 Description 08]
      ,'' AS [UM2 Description 09]
      ,'' AS [UM2 Description 10]
      ,'' AS [UM2 Description 11]
      ,'' AS [UM2 Description 12]
      ,'' AS [UM1 Sec_ Description 01]
      ,'' AS [UM1 Sec_ Description 02]
      ,'' AS [UM1 Sec_ Description 03]
      ,'' AS [UM1 Sec_ Description 04]
      ,'' AS [UM1 Sec_ Description 05]
      ,'' AS [UM1 Sec_ Description 06]
      ,'' AS [UM1 Sec_ Description 07]
      ,'' AS [UM1 Sec_ Description 08]
      ,'' AS [UM1 Sec_ Description 09]
      ,'' AS [UM1 Sec_ Description 10]
      ,'' AS [UM1 Sec_ Description 11]
      ,'' AS [UM1 Sec_ Description 12]
      ,'' AS [UM2 Sec_ Description 01]
      ,'' AS [UM2 Sec_ Description 02]
      ,'' AS [UM2 Sec_ Description 03]
      ,'' AS [UM2 Sec_ Description 04]
      ,'' AS [UM2 Sec_ Description 05]
      ,'' AS [UM2 Sec_ Description 06]
      ,'' AS [UM2 Sec_ Description 07]
      ,'' AS [UM2 Sec_ Description 08]
      ,'' AS [UM2 Sec_ Description 09]
      ,'' AS [UM2 Sec_ Description 10]
      ,'' AS [UM2 Sec_ Description 11]
      ,'' AS [UM2 Sec_ Description 12]
FROM CGesBilancioTeste
UNION ALL
SELECT '' AS [timestamp]
      ,[Progressivo] + 1000000000 AS [No_]
      ,CASE WHEN [TipoReport] = 0 OR [TipoReport] = 2 THEN 'AID' ELSE 'AIG' END AS [Report]
      ,CASE WHEN [TipoReport] > 2 THEN [TipoReport] - 2 ELSE [TipoReport] END AS [Type]
      ,CASE WHEN ISNULL([Nome],'')='' THEN 'Senza Nome' ELSE [Nome] END AS [Report Name]
      ,[Ambiente] AS [Environment Code]
      ,[AnnoInizio] AS [Start Year]
      ,[MeseInizio] AS [Start Month]
      ,[AnnoFine] AS [End Year]
      ,[MeseFine] AS [End Month]
      ,ISNULL([DesIntestazione], '') AS [Header]
      ,[Mese01] AS [Month 01]
      ,[Mese02] AS [Month 02]
      ,[Mese03] AS [Month 03]
      ,[Mese04] AS [Month 04]
      ,[Mese05] AS [Month 05]
      ,[Mese06] AS [Month 06]
      ,[Mese07] AS [Month 07]
      ,[Mese08] AS [Month 08]
      ,[Mese09] AS [Month 09]
      ,[Mese10] AS [Month 10]
      ,[Mese11] AS [Month 11]
      ,[Mese12] AS [Month 12]
      ,[DesTotale] AS [Total]
      ,[TipoRiclassificazione] AS [Type Refiling Code]
      ,[CodDestinazione] AS [Destination No_]
      ,[DesDestinazione] AS [Destination Description]
      ,[DesTipo] AS [Type Description]
      ,[DesDivisione] AS [Division Description]
      ,[DesResponsabile] AS [Responsible Description]
      ,[DesUM1] AS [UM1 Description]
      ,[DesUM2] AS [UM2 Description]
      ,[DesUM1Sec] AS [UM1 Sec_ Description]
      ,[DesUM2Sec] AS [UM2 Sec_ Description]
      ,[TipoDestinazione] AS [Type Destination Typology]
      ,[TipoMisurazione] AS [Measurement Type]
      ,[DesPiede1] AS [Description Foot 1]
      ,[DesPiede2] AS [Description Foot 2]
      ,[DesPiede3] AS [Description Foot 3]
      ,[DesPiede4] AS [Description Foot 4]
      ,[DesPiede5] AS [Description Foot 5]
      ,[Produzione1] AS [Production 1]
      ,[IndiceVar1] AS [Variable Index 1]
      ,[IndiceFis1] AS [Fixed Index 1]
      ,[IndiceTot1] AS [Total Index 1]
      ,[Produzione2] AS [Production 2]
      ,[IndiceVar2] AS [Variable Index 2]
      ,[IndiceFis2] AS [Fixed Index 2]
      ,[IndiceTot2] AS [Total Index 2]
      ,[Produzione1Sec] AS [Production Sec_ 1]
      ,[IndiceVar1Sec] AS [Variable Index Sec_ 1]
      ,[IndiceFis1Sec] AS [Fixed Index Sec_ 1]
      ,[IndiceTot1Sec] AS [Total Index Sec_ 1]
      ,[Produzione2Sec] AS [Production Sec_ 2]
      ,[IndiceVar2Sec] AS [Variable Index Sec_ 2]
      ,[IndiceFis2Sec] AS [Fixed Index Sec_ 2]
      ,[IndiceTot2Sec] AS [Total Index Sec_ 2]
      ,[Produzione101] AS [Production 1 01]
      ,[Produzione102] AS [Production 1 02]
      ,[Produzione103] AS [Production 1 03]
      ,[Produzione104] AS [Production 1 04]
      ,[Produzione105] AS [Production 1 05]
      ,[Produzione106] AS [Production 1 06]
      ,[Produzione107] AS [Production 1 07]
      ,[Produzione108] AS [Production 1 08]
      ,[Produzione109] AS [Production 1 09]
      ,[Produzione110] AS [Production 1 10]
      ,[Produzione111] AS [Production 1 11]
      ,[Produzione112] AS [Production 1 12]
      ,[IndiceVar101] AS [Variable Index 1 01]
      ,[IndiceVar102] AS [Variable Index 1 02]
      ,[IndiceVar103] AS [Variable Index 1 03]
      ,[IndiceVar104] AS [Variable Index 1 04]
      ,[IndiceVar105] AS [Variable Index 1 05]
      ,[IndiceVar106] AS [Variable Index 1 06]
      ,[IndiceVar107] AS [Variable Index 1 07]
      ,[IndiceVar108] AS [Variable Index 1 08]
      ,[IndiceVar109] AS [Variable Index 1 09]
      ,[IndiceVar110] AS [Variable Index 1 10]
      ,[IndiceVar111] AS [Variable Index 1 11]
      ,[IndiceVar112] AS [Variable Index 1 12]
      ,[Produzione201] AS [Production 2 01]
      ,[Produzione202] AS [Production 2 02]
      ,[Produzione203] AS [Production 2 03]
      ,[Produzione204] AS [Production 2 04]
      ,[Produzione205] AS [Production 2 05]
      ,[Produzione206] AS [Production 2 06]
      ,[Produzione207] AS [Production 2 07]
      ,[Produzione208] AS [Production 2 08]
      ,[Produzione209] AS [Production 2 09]
      ,[Produzione210] AS [Production 2 10]
      ,[Produzione211] AS [Production 2 11]
      ,[Produzione212] AS [Production 2 12]
      ,[IndiceFis201] AS [Fixed Index 2 01]
      ,[IndiceFis202] AS [Fixed Index 2 02]
      ,[IndiceFis203] AS [Fixed Index 2 03]
      ,[IndiceFis204] AS [Fixed Index 2 04]
      ,[IndiceFis205] AS [Fixed Index 2 05]
      ,[IndiceFis206] AS [Fixed Index 2 06]
      ,[IndiceFis207] AS [Fixed Index 2 07]
      ,[IndiceFis208] AS [Fixed Index 2 08]
      ,[IndiceFis209] AS [Fixed Index 2 09]
      ,[IndiceFis210] AS [Fixed Index 2 10]
      ,[IndiceFis211] AS [Fixed Index 2 11]
      ,[IndiceFis212] AS [Fixed Index 2 12]
      ,[Produzione1Sec01] AS [Production Sec_ 1 01]
      ,[Produzione1Sec02] AS [Production Sec_ 1 02]
      ,[Produzione1Sec03] AS [Production Sec_ 1 03]
      ,[Produzione1Sec04] AS [Production Sec_ 1 04]
      ,[Produzione1Sec05] AS [Production Sec_ 1 05]
      ,[Produzione1Sec06] AS [Production Sec_ 1 06]
      ,[Produzione1Sec07] AS [Production Sec_ 1 07]
      ,[Produzione1Sec08] AS [Production Sec_ 1 08]
      ,[Produzione1Sec09] AS [Production Sec_ 1 09]
      ,[Produzione1Sec10] AS [Production Sec_ 1 10]
      ,[Produzione1Sec11] AS [Production Sec_ 1 11]
      ,[Produzione1Sec12] AS [Production Sec_ 1 12]
      ,[IndiceVar1Sec01] AS [Variable Index Sec_ 1 01]
      ,[IndiceVar1Sec02] AS [Variable Index Sec_ 1 02]
      ,[IndiceVar1Sec03] AS [Variable Index Sec_ 1 03]
      ,[IndiceVar1Sec04] AS [Variable Index Sec_ 1 04]
      ,[IndiceVar1Sec05] AS [Variable Index Sec_ 1 05]
      ,[IndiceVar1Sec06] AS [Variable Index Sec_ 1 06]
      ,[IndiceVar1Sec07] AS [Variable Index Sec_ 1 07]
      ,[IndiceVar1Sec08] AS [Variable Index Sec_ 1 08]
      ,[IndiceVar1Sec09] AS [Variable Index Sec_ 1 09]
      ,[IndiceVar1Sec10] AS [Variable Index Sec_ 1 10]
      ,[IndiceVar1Sec11] AS [Variable Index Sec_ 1 11]
      ,[IndiceVar1Sec12] AS [Variable Index Sec_ 1 12]
      ,[Produzione2Sec01] AS [Production Sec_ 2 01]
      ,[Produzione2Sec02] AS [Production Sec_ 2 02]
      ,[Produzione2Sec03] AS [Production Sec_ 2 03]
      ,[Produzione2Sec04] AS [Production Sec_ 2 04]
      ,[Produzione2Sec05] AS [Production Sec_ 2 05]
      ,[Produzione2Sec06] AS [Production Sec_ 2 06]
      ,[Produzione2Sec07] AS [Production Sec_ 2 07]
      ,[Produzione2Sec08] AS [Production Sec_ 2 08]
      ,[Produzione2Sec09] AS [Production Sec_ 2 09]
      ,[Produzione2Sec10] AS [Production Sec_ 2 10]
      ,[Produzione2Sec11] AS [Production Sec_ 2 11]
      ,[Produzione2Sec12] AS [Production Sec_ 2 12]
      ,[IndiceFis2Sec01] AS [Fixed Index Sec_ 2 01]
      ,[IndiceFis2Sec02] AS [Fixed Index Sec_ 2 02]
      ,[IndiceFis2Sec03] AS [Fixed Index Sec_ 2 03]
      ,[IndiceFis2Sec04] AS [Fixed Index Sec_ 2 04]
      ,[IndiceFis2Sec05] AS [Fixed Index Sec_ 2 05]
      ,[IndiceFis2Sec06] AS [Fixed Index Sec_ 2 06]
      ,[IndiceFis2Sec07] AS [Fixed Index Sec_ 2 07]
      ,[IndiceFis2Sec08] AS [Fixed Index Sec_ 2 08]
      ,[IndiceFis2Sec09] AS [Fixed Index Sec_ 2 09]
      ,[IndiceFis2Sec10] AS [Fixed Index Sec_ 2 10]
      ,[IndiceFis2Sec11] AS [Fixed Index Sec_ 2 11]
      ,[IndiceFis2Sec12] AS [Fixed Index Sec_ 2 12]
      ,'' AS [Summary Sheet Code]
      ,0 AS [Sheet Number]
      ,0 AS [Last Sheet]
      ,'' AS [Destination No_ 01]
      ,'' AS [Destination No_ 02]
      ,'' AS [Destination No_ 03]
      ,'' AS [Destination No_ 04]
      ,'' AS [Destination No_ 05]
      ,'' AS [Destination No_ 06]
      ,'' AS [Destination No_ 07]
      ,'' AS [Destination No_ 08]
      ,'' AS [Destination No_ 09]
      ,'' AS [Destination No_ 10]
      ,'' AS [Destination No_ 11]
      ,'' AS [Destination No_ 12]
      ,'' AS [UM1 Description 01]
      ,'' AS [UM1 Description 02]
      ,'' AS [UM1 Description 03]
      ,'' AS [UM1 Description 04]
      ,'' AS [UM1 Description 05]
      ,'' AS [UM1 Description 06]
      ,'' AS [UM1 Description 07]
      ,'' AS [UM1 Description 08]
      ,'' AS [UM1 Description 09]
      ,'' AS [UM1 Description 10]
      ,'' AS [UM1 Description 11]
      ,'' AS [UM1 Description 12]
      ,'' AS [UM2 Description 01]
      ,'' AS [UM2 Description 02]
      ,'' AS [UM2 Description 03]
      ,'' AS [UM2 Description 04]
      ,'' AS [UM2 Description 05]
      ,'' AS [UM2 Description 06]
      ,'' AS [UM2 Description 07]
      ,'' AS [UM2 Description 08]
      ,'' AS [UM2 Description 09]
      ,'' AS [UM2 Description 10]
      ,'' AS [UM2 Description 11]
      ,'' AS [UM2 Description 12]
      ,'' AS [UM1 Sec_ Description 01]
      ,'' AS [UM1 Sec_ Description 02]
      ,'' AS [UM1 Sec_ Description 03]
      ,'' AS [UM1 Sec_ Description 04]
      ,'' AS [UM1 Sec_ Description 05]
      ,'' AS [UM1 Sec_ Description 06]
      ,'' AS [UM1 Sec_ Description 07]
      ,'' AS [UM1 Sec_ Description 08]
      ,'' AS [UM1 Sec_ Description 09]
      ,'' AS [UM1 Sec_ Description 10]
      ,'' AS [UM1 Sec_ Description 11]
      ,'' AS [UM1 Sec_ Description 12]
      ,'' AS [UM2 Sec_ Description 01]
      ,'' AS [UM2 Sec_ Description 02]
      ,'' AS [UM2 Sec_ Description 03]
      ,'' AS [UM2 Sec_ Description 04]
      ,'' AS [UM2 Sec_ Description 05]
      ,'' AS [UM2 Sec_ Description 06]
      ,'' AS [UM2 Sec_ Description 07]
      ,'' AS [UM2 Sec_ Description 08]
      ,'' AS [UM2 Sec_ Description 09]
      ,'' AS [UM2 Sec_ Description 10]
      ,'' AS [UM2 Sec_ Description 11]
      ,'' AS [UM2 Sec_ Description 12]
FROM CGesAnalisiIndividualeTeste
UNION ALL
SELECT '' AS [timestamp]
      ,[Progressivo] + 2000000000 AS [No_]
      ,'FOG' AS [Report]
      ,[TipoReport] AS [Type]
      ,CASE WHEN ISNULL([Nome],'')='' THEN 'Senza Nome' ELSE [Nome] END AS [Report Name]
      ,[Ambiente] AS [Environment Code]
      ,[AnnoInizio] AS [Start Year]
      ,[MeseInizio] AS [Start Month]
      ,[AnnoFine] AS [End Year]
      ,[MeseFine] AS [End Month]
      ,ISNULL([DesIntestazione], '') AS [Header]
      ,'' AS [Month 01]
      ,'' AS [Month 02]
      ,'' AS [Month 03]
      ,'' AS [Month 04]
      ,'' AS [Month 05]
      ,'' AS [Month 06]
      ,'' AS [Month 07]
      ,'' AS [Month 08]
      ,'' AS [Month 09]
      ,'' AS [Month 10]
      ,'' AS [Month 11]
      ,'' AS [Month 12]
      ,'' AS [Total]
      ,'' AS [Type Refiling Code]
      ,'' AS [Destination No_]
      ,'' AS [Destination Description]
      ,'' AS [Type Description]
      ,'' AS [Division Description]
      ,'' AS [Responsible Description]
	  ,[DesUM1] AS [UM1 Description]
	  ,[DesUM2] AS [UM2 Description]
	  ,[DesUM1Sec] AS [UM1 Sec_ Description]
	  ,[DesUM2Sec] AS [UM2 Sec_ Description]
      ,0 AS [Type Destination Typology]
      ,0 AS [Measurement Type]
      ,'' AS [Description Foot 1]
      ,'' AS [Description Foot 2]
      ,'' AS [Description Foot 3]
      ,'' AS [Description Foot 4]
      ,'' AS [Description Foot 5]
	  ,[Produzione1] AS [Production 1]
	  ,[IndiceVar1] AS [Variable Index 1]
      ,0 AS [Fixed Index 1]
      ,0 AS [Total Index 1]
	  ,[Produzione2] AS [Production 2]
      ,0 AS [Variable Index 2]
	  ,[IndiceFis2] AS [Fixed Index 2]
      ,0 AS [Total Index 2]
	  ,[Produzione1Sec] AS [Production Sec_ 1]
	  ,[IndiceVar1Sec] AS [Variable Index Sec_ 1]
      ,0 AS [Fixed Index Sec_ 1]
      ,0 AS [Total Index Sec_ 1]
	  ,[Produzione2Sec] AS [Production Sec_ 2]
      ,0 AS [Variable Index Sec_ 2]
	  ,[IndiceFis2Sec] AS [Fixed Index Sec_ 2]
      ,0 AS [Total Index Sec_ 2]
	  ,[Produzione101] AS [Production 1 01]
	  ,[Produzione102] AS [Production 1 02]
	  ,[Produzione103] AS [Production 1 03]
	  ,[Produzione104] AS [Production 1 04]
	  ,[Produzione105] AS [Production 1 05]
	  ,[Produzione106] AS [Production 1 06]
	  ,[Produzione107] AS [Production 1 07]
	  ,[Produzione108] AS [Production 1 08]
	  ,[Produzione109] AS [Production 1 09]
	  ,[Produzione110] AS [Production 1 10]
	  ,[Produzione111] AS [Production 1 11]
	  ,[Produzione112] AS [Production 1 12]
	  ,[IndiceVar101] AS [Variable Index 1 01]
	  ,[IndiceVar102] AS [Variable Index 1 02]
	  ,[IndiceVar103] AS [Variable Index 1 03]
	  ,[IndiceVar104] AS [Variable Index 1 04]
	  ,[IndiceVar105] AS [Variable Index 1 05]
	  ,[IndiceVar106] AS [Variable Index 1 06]
	  ,[IndiceVar107] AS [Variable Index 1 07]
	  ,[IndiceVar108] AS [Variable Index 1 08]
	  ,[IndiceVar109] AS [Variable Index 1 09]
	  ,[IndiceVar110] AS [Variable Index 1 10]
	  ,[IndiceVar111] AS [Variable Index 1 11]
	  ,[IndiceVar112] AS [Variable Index 1 12]
	  ,[Produzione201] AS [Production 2 01]
	  ,[Produzione202] AS [Production 2 02]
	  ,[Produzione203] AS [Production 2 03]
	  ,[Produzione204] AS [Production 2 04]
	  ,[Produzione205] AS [Production 2 05]
	  ,[Produzione206] AS [Production 2 06]
	  ,[Produzione207] AS [Production 2 07]
	  ,[Produzione208] AS [Production 2 08]
	  ,[Produzione209] AS [Production 2 09]
	  ,[Produzione210] AS [Production 2 10]
	  ,[Produzione211] AS [Production 2 11]
	  ,[Produzione212] AS [Production 2 12]
	  ,[IndiceFis201] AS [Fixed Index 2 01]
	  ,[IndiceFis202] AS [Fixed Index 2 02]
	  ,[IndiceFis203] AS [Fixed Index 2 03]
	  ,[IndiceFis204] AS [Fixed Index 2 04]
	  ,[IndiceFis205] AS [Fixed Index 2 05]
	  ,[IndiceFis206] AS [Fixed Index 2 06]
	  ,[IndiceFis207] AS [Fixed Index 2 07]
	  ,[IndiceFis208] AS [Fixed Index 2 08]
	  ,[IndiceFis209] AS [Fixed Index 2 09]
	  ,[IndiceFis210] AS [Fixed Index 2 10]
	  ,[IndiceFis211] AS [Fixed Index 2 11]
	  ,[IndiceFis212] AS [Fixed Index 2 12]
	  ,[Produzione1Sec01] AS [Production Sec_ 1 01]
	  ,[Produzione1Sec02] AS [Production Sec_ 1 02]
	  ,[Produzione1Sec03] AS [Production Sec_ 1 03]
	  ,[Produzione1Sec04] AS [Production Sec_ 1 04]
	  ,[Produzione1Sec05] AS [Production Sec_ 1 05]
	  ,[Produzione1Sec06] AS [Production Sec_ 1 06]
	  ,[Produzione1Sec07] AS [Production Sec_ 1 07]
	  ,[Produzione1Sec08] AS [Production Sec_ 1 08]
	  ,[Produzione1Sec09] AS [Production Sec_ 1 09]
	  ,[Produzione1Sec10] AS [Production Sec_ 1 10]
	  ,[Produzione1Sec11] AS [Production Sec_ 1 11]
	  ,[Produzione1Sec12] AS [Production Sec_ 1 12]
	  ,[IndiceVar1Sec01] AS [Variable Index Sec_ 1 01]
	  ,[IndiceVar1Sec02] AS [Variable Index Sec_ 1 02]
	  ,[IndiceVar1Sec03] AS [Variable Index Sec_ 1 03]
	  ,[IndiceVar1Sec04] AS [Variable Index Sec_ 1 04]
	  ,[IndiceVar1Sec05] AS [Variable Index Sec_ 1 05]
	  ,[IndiceVar1Sec06] AS [Variable Index Sec_ 1 06]
	  ,[IndiceVar1Sec07] AS [Variable Index Sec_ 1 07]
	  ,[IndiceVar1Sec08] AS [Variable Index Sec_ 1 08]
	  ,[IndiceVar1Sec09] AS [Variable Index Sec_ 1 09]
	  ,[IndiceVar1Sec10] AS [Variable Index Sec_ 1 10]
	  ,[IndiceVar1Sec11] AS [Variable Index Sec_ 1 11]
	  ,[IndiceVar1Sec12] AS [Variable Index Sec_ 1 12]
	  ,[Produzione2Sec01] AS [Production Sec_ 2 01]
	  ,[Produzione2Sec02] AS [Production Sec_ 2 02]
	  ,[Produzione2Sec03] AS [Production Sec_ 2 03]
	  ,[Produzione2Sec04] AS [Production Sec_ 2 04]
	  ,[Produzione2Sec05] AS [Production Sec_ 2 05]
	  ,[Produzione2Sec06] AS [Production Sec_ 2 06]
	  ,[Produzione2Sec07] AS [Production Sec_ 2 07]
	  ,[Produzione2Sec08] AS [Production Sec_ 2 08]
	  ,[Produzione2Sec09] AS [Production Sec_ 2 09]
	  ,[Produzione2Sec10] AS [Production Sec_ 2 10]
	  ,[Produzione2Sec11] AS [Production Sec_ 2 11]
	  ,[Produzione2Sec12] AS [Production Sec_ 2 12]
	  ,[IndiceFis2Sec01] AS [Fixed Index Sec_ 2 01]
	  ,[IndiceFis2Sec02] AS [Fixed Index Sec_ 2 02]
	  ,[IndiceFis2Sec03] AS [Fixed Index Sec_ 2 03]
	  ,[IndiceFis2Sec04] AS [Fixed Index Sec_ 2 04]
	  ,[IndiceFis2Sec05] AS [Fixed Index Sec_ 2 05]
	  ,[IndiceFis2Sec06] AS [Fixed Index Sec_ 2 06]
	  ,[IndiceFis2Sec07] AS [Fixed Index Sec_ 2 07]
	  ,[IndiceFis2Sec08] AS [Fixed Index Sec_ 2 08]
	  ,[IndiceFis2Sec09] AS [Fixed Index Sec_ 2 09]
	  ,[IndiceFis2Sec10] AS [Fixed Index Sec_ 2 10]
	  ,[IndiceFis2Sec11] AS [Fixed Index Sec_ 2 11]
	  ,[IndiceFis2Sec12] AS [Fixed Index Sec_ 2 12]
      ,[Codice] AS [Summary Sheet Code]
      ,[NumFoglio] AS [Sheet Number]
      ,[UltimoFoglio] AS [Last Sheet]
      ,[CodDestinazione01] AS [Destination No_ 01]
      ,[CodDestinazione02] AS [Destination No_ 02]
      ,[CodDestinazione03] AS [Destination No_ 03]
      ,[CodDestinazione04] AS [Destination No_ 04]
      ,[CodDestinazione05] AS [Destination No_ 05]
      ,[CodDestinazione06] AS [Destination No_ 06]
      ,[CodDestinazione07] AS [Destination No_ 07]
      ,[CodDestinazione08] AS [Destination No_ 08]
      ,[CodDestinazione09] AS [Destination No_ 09]
      ,[CodDestinazione10] AS [Destination No_ 10]
      ,[CodDestinazione11] AS [Destination No_ 11]
      ,[CodDestinazione12] AS [Destination No_ 12]
      ,[DesUM101] AS [UM1 Description 01]
      ,[DesUM102] AS [UM1 Description 02]
      ,[DesUM103] AS [UM1 Description 03]
      ,[DesUM104] AS [UM1 Description 04]
      ,[DesUM105] AS [UM1 Description 05]
      ,[DesUM106] AS [UM1 Description 06]
      ,[DesUM107] AS [UM1 Description 07]
      ,[DesUM108] AS [UM1 Description 08]
      ,[DesUM109] AS [UM1 Description 09]
      ,[DesUM110] AS [UM1 Description 10]
      ,[DesUM111] AS [UM1 Description 11]
      ,[DesUM112] AS [UM1 Description 12]
      ,[DesUM201] AS [UM2 Description 01]
      ,[DesUM202] AS [UM2 Description 02]
      ,[DesUM203] AS [UM2 Description 03]
      ,[DesUM204] AS [UM2 Description 04]
      ,[DesUM205] AS [UM2 Description 05]
      ,[DesUM206] AS [UM2 Description 06]
      ,[DesUM207] AS [UM2 Description 07]
      ,[DesUM208] AS [UM2 Description 08]
      ,[DesUM209] AS [UM2 Description 09]
      ,[DesUM210] AS [UM2 Description 10]
      ,[DesUM211] AS [UM2 Description 11]
      ,[DesUM212] AS [UM2 Description 12]
      ,[DesUM1Sec01] AS [UM1 Sec_ Description 01]
      ,[DesUM1Sec02] AS [UM1 Sec_ Description 02]
      ,[DesUM1Sec03] AS [UM1 Sec_ Description 03]
      ,[DesUM1Sec04] AS [UM1 Sec_ Description 04]
      ,[DesUM1Sec05] AS [UM1 Sec_ Description 05]
      ,[DesUM1Sec06] AS [UM1 Sec_ Description 06]
      ,[DesUM1Sec07] AS [UM1 Sec_ Description 07]
      ,[DesUM1Sec08] AS [UM1 Sec_ Description 08]
      ,[DesUM1Sec09] AS [UM1 Sec_ Description 09]
      ,[DesUM1Sec10] AS [UM1 Sec_ Description 10]
      ,[DesUM1Sec11] AS [UM1 Sec_ Description 11]
      ,[DesUM1Sec12] AS [UM1 Sec_ Description 12]
      ,[DesUM2Sec01] AS [UM2 Sec_ Description 01]
      ,[DesUM2Sec02] AS [UM2 Sec_ Description 02]
      ,[DesUM2Sec03] AS [UM2 Sec_ Description 03]
      ,[DesUM2Sec04] AS [UM2 Sec_ Description 04]
      ,[DesUM2Sec05] AS [UM2 Sec_ Description 05]
      ,[DesUM2Sec06] AS [UM2 Sec_ Description 06]
      ,[DesUM2Sec07] AS [UM2 Sec_ Description 07]
      ,[DesUM2Sec08] AS [UM2 Sec_ Description 08]
      ,[DesUM2Sec09] AS [UM2 Sec_ Description 09]
      ,[DesUM2Sec10] AS [UM2 Sec_ Description 10]
      ,[DesUM2Sec11] AS [UM2 Sec_ Description 11]
      ,[DesUM2Sec12] AS [UM2 Sec_ Description 12]
FROM CGesReportFogliRiepilogoTeste
UNION ALL
SELECT '' AS [timestamp]
      ,[Progressivo] + 3000000000 AS [No_]
      ,'BEP' AS [Report]
      ,[TipoReport] AS [Type]
      ,CASE WHEN ISNULL([Nome],'')='' THEN 'Senza Nome' ELSE [Nome] END AS [Report Name]
      ,[Ambiente] AS [Environment Code]
      ,[AnnoInizio] AS [Start Year]
      ,[MeseInizio] AS [Start Month]
      ,[AnnoFine] AS [End Year]
      ,[MeseFine] AS [End Month]
      ,'' AS [Header]
      ,'' AS [Month 01]
      ,'' AS [Month 02]
      ,'' AS [Month 03]
      ,'' AS [Month 04]
      ,'' AS [Month 05]
      ,'' AS [Month 06]
      ,'' AS [Month 07]
      ,'' AS [Month 08]
      ,'' AS [Month 09]
      ,'' AS [Month 10]
      ,'' AS [Month 11]
      ,'' AS [Month 12]
      ,'' AS [Total]
      ,'' AS [Type Refiling Code]
      ,'' AS [Destination No_]
      ,'' AS [Destination Description]
      ,'' AS [Type Description]
      ,'' AS [Division Description]
      ,'' AS [Responsible Description]
      ,'' AS [UM1 Description]
      ,'' AS [UM2 Description]
      ,'' AS [UM1 Sec_ Description]
      ,'' AS [UM2 Sec_ Description]
      ,0 AS [Type Destination Typology]
      ,0 AS [Measurement Type]
      ,[DesPiede1] AS [Description Foot 1]
      ,[DesPiede2] AS [Description Foot 2]
      ,[DesPiede3] AS [Description Foot 3]
      ,[DesPiede4] AS [Description Foot 4]
      ,[DesPiede5] AS [Description Foot 5]
      ,0 AS [Production 1]
      ,0 AS [Variable Index 1]
      ,0 AS [Fixed Index 1]
      ,0 AS [Total Index 1]
      ,0 AS [Production 2]
      ,0 AS [Variable Index 2]
      ,0 AS [Fixed Index 2]
      ,0 AS [Total Index 2]
      ,0 AS [Production Sec_ 1]
      ,0 AS [Variable Index Sec_ 1]
      ,0 AS [Fixed Index Sec_ 1]
      ,0 AS [Total Index Sec_ 1]
      ,0 AS [Production Sec_ 2]
      ,0 AS [Variable Index Sec_ 2]
      ,0 AS [Fixed Index Sec_ 2]
      ,0 AS [Total Index Sec_ 2]
      ,0 AS [Production 1 01]
      ,0 AS [Production 1 02]
      ,0 AS [Production 1 03]
      ,0 AS [Production 1 04]
      ,0 AS [Production 1 05]
      ,0 AS [Production 1 06]
      ,0 AS [Production 1 07]
      ,0 AS [Production 1 08]
      ,0 AS [Production 1 09]
      ,0 AS [Production 1 10]
      ,0 AS [Production 1 11]
      ,0 AS [Production 1 12]
      ,0 AS [Variable Index 1 01]
      ,0 AS [Variable Index 1 02]
      ,0 AS [Variable Index 1 03]
      ,0 AS [Variable Index 1 04]
      ,0 AS [Variable Index 1 05]
      ,0 AS [Variable Index 1 06]
      ,0 AS [Variable Index 1 07]
      ,0 AS [Variable Index 1 08]
      ,0 AS [Variable Index 1 09]
      ,0 AS [Variable Index 1 10]
      ,0 AS [Variable Index 1 11]
      ,0 AS [Variable Index 1 12]
      ,0 AS [Production 2 01]
      ,0 AS [Production 2 02]
      ,0 AS [Production 2 03]
      ,0 AS [Production 2 04]
      ,0 AS [Production 2 05]
      ,0 AS [Production 2 06]
      ,0 AS [Production 2 07]
      ,0 AS [Production 2 08]
      ,0 AS [Production 2 09]
      ,0 AS [Production 2 10]
      ,0 AS [Production 2 11]
      ,0 AS [Production 2 12]
      ,0 AS [Fixed Index 2 01]
      ,0 AS [Fixed Index 2 02]
      ,0 AS [Fixed Index 2 03]
      ,0 AS [Fixed Index 2 04]
      ,0 AS [Fixed Index 2 05]
      ,0 AS [Fixed Index 2 06]
      ,0 AS [Fixed Index 2 07]
      ,0 AS [Fixed Index 2 08]
      ,0 AS [Fixed Index 2 09]
      ,0 AS [Fixed Index 2 10]
      ,0 AS [Fixed Index 2 11]
      ,0 AS [Fixed Index 2 12]
      ,0 AS [Production Sec_ 1 01]
      ,0 AS [Production Sec_ 1 02]
      ,0 AS [Production Sec_ 1 03]
      ,0 AS [Production Sec_ 1 04]
      ,0 AS [Production Sec_ 1 05]
      ,0 AS [Production Sec_ 1 06]
      ,0 AS [Production Sec_ 1 07]
      ,0 AS [Production Sec_ 1 08]
      ,0 AS [Production Sec_ 1 09]
      ,0 AS [Production Sec_ 1 10]
      ,0 AS [Production Sec_ 1 11]
      ,0 AS [Production Sec_ 1 12]
      ,0 AS [Variable Index Sec_ 1 01]
      ,0 AS [Variable Index Sec_ 1 02]
      ,0 AS [Variable Index Sec_ 1 03]
      ,0 AS [Variable Index Sec_ 1 04]
      ,0 AS [Variable Index Sec_ 1 05]
      ,0 AS [Variable Index Sec_ 1 06]
      ,0 AS [Variable Index Sec_ 1 07]
      ,0 AS [Variable Index Sec_ 1 08]
      ,0 AS [Variable Index Sec_ 1 09]
      ,0 AS [Variable Index Sec_ 1 10]
      ,0 AS [Variable Index Sec_ 1 11]
      ,0 AS [Variable Index Sec_ 1 12]
      ,0 AS [Production Sec_ 2 01]
      ,0 AS [Production Sec_ 2 02]
      ,0 AS [Production Sec_ 2 03]
      ,0 AS [Production Sec_ 2 04]
      ,0 AS [Production Sec_ 2 05]
      ,0 AS [Production Sec_ 2 06]
      ,0 AS [Production Sec_ 2 07]
      ,0 AS [Production Sec_ 2 08]
      ,0 AS [Production Sec_ 2 09]
      ,0 AS [Production Sec_ 2 10]
      ,0 AS [Production Sec_ 2 11]
      ,0 AS [Production Sec_ 2 12]
      ,0 AS [Fixed Index Sec_ 2 01]
      ,0 AS [Fixed Index Sec_ 2 02]
      ,0 AS [Fixed Index Sec_ 2 03]
      ,0 AS [Fixed Index Sec_ 2 04]
      ,0 AS [Fixed Index Sec_ 2 05]
      ,0 AS [Fixed Index Sec_ 2 06]
      ,0 AS [Fixed Index Sec_ 2 07]
      ,0 AS [Fixed Index Sec_ 2 08]
      ,0 AS [Fixed Index Sec_ 2 09]
      ,0 AS [Fixed Index Sec_ 2 10]
      ,0 AS [Fixed Index Sec_ 2 11]
      ,0 AS [Fixed Index Sec_ 2 12]
      ,'' AS [Summary Sheet Code]
      ,0 AS [Sheet Number]
      ,0 AS [Last Sheet]
      ,'' AS [Destination No_ 01]
      ,'' AS [Destination No_ 02]
      ,'' AS [Destination No_ 03]
      ,'' AS [Destination No_ 04]
      ,'' AS [Destination No_ 05]
      ,'' AS [Destination No_ 06]
      ,'' AS [Destination No_ 07]
      ,'' AS [Destination No_ 08]
      ,'' AS [Destination No_ 09]
      ,'' AS [Destination No_ 10]
      ,'' AS [Destination No_ 11]
      ,'' AS [Destination No_ 12]
      ,'' AS [UM1 Description 01]
      ,'' AS [UM1 Description 02]
      ,'' AS [UM1 Description 03]
      ,'' AS [UM1 Description 04]
      ,'' AS [UM1 Description 05]
      ,'' AS [UM1 Description 06]
      ,'' AS [UM1 Description 07]
      ,'' AS [UM1 Description 08]
      ,'' AS [UM1 Description 09]
      ,'' AS [UM1 Description 10]
      ,'' AS [UM1 Description 11]
      ,'' AS [UM1 Description 12]
      ,'' AS [UM2 Description 01]
      ,'' AS [UM2 Description 02]
      ,'' AS [UM2 Description 03]
      ,'' AS [UM2 Description 04]
      ,'' AS [UM2 Description 05]
      ,'' AS [UM2 Description 06]
      ,'' AS [UM2 Description 07]
      ,'' AS [UM2 Description 08]
      ,'' AS [UM2 Description 09]
      ,'' AS [UM2 Description 10]
      ,'' AS [UM2 Description 11]
      ,'' AS [UM2 Description 12]
      ,'' AS [UM1 Sec_ Description 01]
      ,'' AS [UM1 Sec_ Description 02]
      ,'' AS [UM1 Sec_ Description 03]
      ,'' AS [UM1 Sec_ Description 04]
      ,'' AS [UM1 Sec_ Description 05]
      ,'' AS [UM1 Sec_ Description 06]
      ,'' AS [UM1 Sec_ Description 07]
      ,'' AS [UM1 Sec_ Description 08]
      ,'' AS [UM1 Sec_ Description 09]
      ,'' AS [UM1 Sec_ Description 10]
      ,'' AS [UM1 Sec_ Description 11]
      ,'' AS [UM1 Sec_ Description 12]
      ,'' AS [UM2 Sec_ Description 01]
      ,'' AS [UM2 Sec_ Description 02]
      ,'' AS [UM2 Sec_ Description 03]
      ,'' AS [UM2 Sec_ Description 04]
      ,'' AS [UM2 Sec_ Description 05]
      ,'' AS [UM2 Sec_ Description 06]
      ,'' AS [UM2 Sec_ Description 07]
      ,'' AS [UM2 Sec_ Description 08]
      ,'' AS [UM2 Sec_ Description 09]
      ,'' AS [UM2 Sec_ Description 10]
      ,'' AS [UM2 Sec_ Description 11]
      ,'' AS [UM2 Sec_ Description 12]
FROM CGesCalcoloBEPTeste


GO
GRANT SELECT
    ON OBJECT::[dbo].[DA Head Report] TO [Metodo98]
    AS [dbo];
