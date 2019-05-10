

CREATE VIEW [dbo].[GEM_Vista_Controllo_Fatturazione]
AS
SELECT	
		'O' as TipoRapporto
		,[idRiga]
      ,[idAttivita]
      ,[idTipologMezzo]
      ,[idTipoFatt]
      ,[VisitaConsuntiva]
      ,[PeriodiAccumulo]
      ,[ARata]
      ,[NonFatturare]
      ,[PeriodiDaAccumulare]
      ,[TipoFatturazione]
      ,[Validita]
  FROM [GEMMADBG].[dbo].[GEM_T_Tab_Controllo_Fatturazione]
UNION ALL

SELECT 		'S' as TipoRapporto
		,[idRiga]
      ,[idAttivita]
      ,[idTipologMezzo]
      ,[idTipoFatt]
      ,[VisitaConsuntiva]
      ,0 AS PeriodiAccumulo
      ,0 AS ARata
      ,[NonFatturare]
      ,0 AS PeriodiDaAccumulare
      ,[TipoFatturazione]
      ,[Validita]
  FROM [GEMMADBG].[dbo].[GEM_T_TAB_CONTROLLO_FATTURAZIONE_STRAORD]


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_Controllo_Fatturazione] TO [Metodo98]
    AS [dbo];

