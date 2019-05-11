﻿
CREATE VIEW [dbo].[CONTRATTILIQUIDAZIONE_CLVALORE]
AS
SELECT     TOP (100) PERCENT 'INCONDIZIONATI' AS TIPOCONTRIBUTO, RIFPROGRESSIVO AS RifContratto, NRRIGA AS RifContributo, 0 AS RIFSOTTORIGA, 
                      0 AS RIFSOTTORIGACOND, DESCRIZIONE AS NOTA, 'VALORE' AS TIPOLOGIA, '' AS DADATA, '' AS ADATA, 0 AS BudgetQta, '' AS Um, 0 AS BudgetValore, 
                      0 AS BudgetQtaConValore, '' AS UmQtaConValore, VALORE AS PREMIOVALORE, 0 AS PREMIOPERCENTUALE, 0 AS CONSUNTIVATOQTA, 0 AS CONSUNTIVATOVALORE, 
                      VALORE AS PREMIOMATURATO, PERIODICITALIQUIDAZIONE, CASE WHEN TIPO IS NULL THEN 1 ELSE TIPO END AS TIPO, TIPOCALCOLOPREMIO, 
                      PREMIONONVALIDO
FROM         dbo.CONTRATTI_CL
WHERE     (VALORE > 0) AND (ESCLUSOLOGICAMENTE = 0)
ORDER BY RifContratto, RifContributo, RIFSOTTORIGA


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTILIQUIDAZIONE_CLVALORE] TO [Metodo98]
    AS [dbo];
