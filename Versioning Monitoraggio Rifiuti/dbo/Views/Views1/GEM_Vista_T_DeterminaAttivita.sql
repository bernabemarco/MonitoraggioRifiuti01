
CREATE VIEW [dbo].[GEM_Vista_T_DeterminaAttivita]

AS
SELECT T.[IdRigaDetAttivita]	
      ,isnull(R.[idRiga],0) as idRiga
      ,T.[idTipologMezzo]
      ,T.[CodiceMezzo]
      ,T.[idModFatt]
      ,T.[idAttivita]
      ,T.[RadiceServizio]
      ,T.[ServizioPuntuale]
      ,isnull(R.[Tipologia],'') as Tipologia
FROM [GEMMADBG].[dbo].[GEM_T_Tab_Determina_Attivita] T left outer JOIN [GEMMADBG].[dbo].[GEM_T_Tab_Determina_AttivitaRighe] R
	on T.[IdRigaDetAttivita] = R.[IdRigaDetAttivita]
	

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_T_DeterminaAttivita] TO [Metodo98]
    AS [dbo];

