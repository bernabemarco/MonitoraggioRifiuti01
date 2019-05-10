
CREATE view dbo.GEM_Vista_T_TabStruttureOperazioniPrimarieRighe
AS

SELECT [IdStrutturaOpPr]
      ,[Revisione]
      ,[IdRiga]
      ,[idAttivita]
      ,[NumOperazioniAnno]
      ,[MesiSlittamentoPrimaVisita]
      ,[MesiCadenzeVisiteSuccessive]
      ,[FlagVisitaUnaTantum]
  FROM [GEMMADBG].[dbo].[GEM_T_TabStruttureOperazioniPrimarieRighe]


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_T_TabStruttureOperazioniPrimarieRighe] TO [Metodo98]
    AS [dbo];

