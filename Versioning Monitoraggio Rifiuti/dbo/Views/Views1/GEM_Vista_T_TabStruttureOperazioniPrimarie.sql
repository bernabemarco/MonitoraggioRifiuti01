

CREATE VIEW dbo.GEM_Vista_T_TabStruttureOperazioniPrimarie
AS


SELECT [IdStrutturaOpPr]
      ,[Descrizione]
      ,[idTipologMezzo]
      ,[Revisione]
      ,[NrOperazioniTotali]
      ,[VersioneStd]
  FROM [GEMMADBG].[dbo].[GEM_T_TabStruttureOperazioniPrimarie]


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_T_TabStruttureOperazioniPrimarie] TO [Metodo98]
    AS [dbo];

