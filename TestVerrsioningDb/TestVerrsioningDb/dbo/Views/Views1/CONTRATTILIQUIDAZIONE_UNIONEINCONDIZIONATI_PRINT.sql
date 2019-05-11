﻿

CREATE VIEW CONTRATTILIQUIDAZIONE_UNIONEINCONDIZIONATI_PRINT
as

SELECT     TOP (100) PERCENT 'INCONDIZIONATI' AS TIPOCONTRIBUTO, RIFPROGRESSIVO AS RifContratto, NRRIGA AS RifContributo, 0 AS RIFSOTTORIGA, 
                      0 AS RIFSOTTORIGACOND, DESCRIZIONE AS NOTA, 'VALORE' AS TIPOLOGIA, '' AS DADATA, '' AS ADATA, 0 AS BudgetQta, '' AS Um, 0 AS BudgetValore, 
                      0 AS BudgetQtaConValore, '' AS UmQtaConValore, VALORE AS PREMIOVALORE, 0 AS PREMIOPERCENTUALE, 0 AS CONSUNTIVATOQTA, 0 AS CONSUNTIVATOVALORE, 
                      VALORE AS PREMIOMATURATO, PERIODICITALIQUIDAZIONE, CASE WHEN TIPO IS NULL THEN 1 ELSE TIPO END AS TIPO, TIPOCALCOLOPREMIO, 
                      PREMIONONVALIDO
FROM         dbo.CONTRATTI_CL
WHERE     (VALORE > 0) AND (ESCLUSOLOGICAMENTE = 0)
union all
SELECT     TOP (100) PERCENT 'INCONDIZIONATI' AS TIPOCONTRIBUTO, RIFPROGRESSIVO AS RifContratto, NRRIGA AS RifContributo, 0 AS RIFSOTTORIGA, 
                      0 AS RIFSOTTORIGACOND, DESCRIZIONE AS NOTA, 'MERCEVALORE' AS TIPOLOGIA, '' AS DADATA, '' AS ADATA, 0 AS BudgetQta, '' AS Um, 0 AS BudgetValore, 
                      0 AS BudgetQtaConValore, '' AS UmQtaConValore, MERCEVALORE AS PREMIOVALORE, 0 AS PREMIOPERCENTUALE, 0 AS CONSUNTIVATOQTA, 
                      0 AS CONSUNTIVATOVALORE, MERCEVALORE AS PREMIOMATURATO, PERIODICITALIQUIDAZIONE, CASE WHEN TIPO IS NULL THEN 1 ELSE TIPO END AS TIPO, 
                      TIPOCALCOLOPREMIO, PREMIONONVALIDO
FROM         dbo.CONTRATTI_CL
WHERE     (MERCEVALORE > 0) AND (ESCLUSOLOGICAMENTE = 0)
union all
SELECT     TOP (100) PERCENT 'INCONDIZIONATI' AS TIPOCONTRIBUTO, dbo.CONTRATTI_CL.RIFPROGRESSIVO AS RifContratto, dbo.CONTRATTI_CL.NRRIGA AS RifContributo, 
                      0 AS RIFSOTTORIGA, 0 AS RIFSOTTORIGACOND, dbo.CONTRATTI_CL.DESCRIZIONE AS NOTA, 'MERCEQTA' AS TIPOLOGIA, '' AS DADATA, '' AS ADATA, 0 AS BudgetQta,
                       '' AS Um, 0 AS BudgetValore, 0 AS BudgetQtaConValore, '' AS UmQtaConValore, dbo.CONTRATTILIQUIDAZIONE_SOMMATORIAQTAMERCE.Expr1 AS PREMIOVALORE, 
                      0 AS PREMIOPERCENTUALE, 0 AS CONSUNTIVATOQTA, 0 AS CONSUNTIVATOVALORE, 
                      dbo.CONTRATTILIQUIDAZIONE_SOMMATORIAQTAMERCE.Expr1 AS PREMIOMATURATO, dbo.CONTRATTI_CL.PERIODICITALIQUIDAZIONE, 
                      CASE WHEN dbo.CONTRATTI_CL.TIPO IS NULL THEN 1 ELSE dbo.CONTRATTI_CL.TIPO END AS TIPO, dbo.CONTRATTI_CL.TIPOCALCOLOPREMIO, 
                      dbo.CONTRATTI_CL.PREMIONONVALIDO
FROM         dbo.CONTRATTI_CL INNER JOIN
                      dbo.CONTRATTILIQUIDAZIONE_SOMMATORIAQTAMERCE ON 
                      dbo.CONTRATTI_CL.RIFPROGRESSIVO = dbo.CONTRATTILIQUIDAZIONE_SOMMATORIAQTAMERCE.RIFPROGRESSIVOCL AND 
                      dbo.CONTRATTI_CL.NRRIGA = dbo.CONTRATTILIQUIDAZIONE_SOMMATORIAQTAMERCE.RIFPROGRESSIVO
WHERE     (dbo.CONTRATTI_CL.MERCEQTA > 0) AND (dbo.CONTRATTI_CL.ESCLUSOLOGICAMENTE = 0)
union all
SELECT     TOP (100) PERCENT 'INCONDIZIONATI-COND' AS TIPOCONTRIBUTO, dbo.CONTRATTI_CL.RIFPROGRESSIVO AS RifContratto, 
                      dbo.CONTRATTI_CL.NRRIGA AS RifContributo, CONTRATTICL_QTA.NRRIGA AS RIFSOTTORIGA, 0 AS RIFSOTTORIGACOND, dbo.CONTRATTI_CL.DESCRIZIONE AS NOTA, 
                      'PERCENTUALE' AS TIPOLOGIA, CONVERT(varchar, dbo.CONTRATTICL_QTA.DADATA, 105) AS DADATA, CONVERT(varchar, dbo.CONTRATTICL_QTA.ADATA, 105) 
                      AS ADATA, 0 AS BudgetQta, '' AS Um, dbo.CONTRATTICL_QTA.BUDGET AS BudgetValore, 0 AS BudgetQtaConValore, '' AS UmQtaConValore, 
                      dbo.CONTRATTI_CL.VALORE AS PREMIOVALORE, dbo.CONTRATTICL_QTA.PERCENTUALE AS PREMIOPERCENTUALE, 0 AS CONSUNTIVATOQTA, 
                      dbo.CONTRATTICL_QTA.CONSUNTIVO AS CONSUNTIVATOVALORE, dbo.CONTRATTICL_QTA.PREMIOMATURATO, dbo.CONTRATTICL_QTA.PERIODICITALIQUIDAZIONE, 
                      CASE WHEN dbo.CONTRATTICL_QTA.TIPO IS NULL THEN 1 ELSE dbo.CONTRATTICL_QTA.TIPO END AS TIPO, dbo.CONTRATTI_CL.TIPOCALCOLOPREMIO, 
                      dbo.CONTRATTICL_QTA.PREMIONONVALIDO
FROM         dbo.CONTRATTI_CL INNER JOIN
                      dbo.CONTRATTICL_QTA ON dbo.CONTRATTI_CL.RIFPROGRESSIVO = dbo.CONTRATTICL_QTA.RIFPROGRESSIVOCL AND 
                      dbo.CONTRATTI_CL.NRRIGA = dbo.CONTRATTICL_QTA.RIFPROGRESSIVO
WHERE     (dbo.CONTRATTI_CL.BOLISPERC = 1) AND (dbo.CONTRATTI_CL.ESCLUSOLOGICAMENTE = 0)


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTILIQUIDAZIONE_UNIONEINCONDIZIONATI_PRINT] TO [Metodo98]
    AS [dbo];
