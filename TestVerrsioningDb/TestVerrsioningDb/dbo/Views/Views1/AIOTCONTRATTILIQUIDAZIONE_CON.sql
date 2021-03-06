﻿
CREATE VIEW [dbo].[AIOTCONTRATTILIQUIDAZIONE_CON]
AS
SELECT     TIPOCONTRIBUTO, RIFCONTRATTO, RIFCONTRIBUTO, RIFSOTTORIGA, NOTA, TIPOLOGIA, DADATA, ADATA, BudgetQta, UM, BudgetValore, BudgetQtaConValore, 
                      UmQtaConValore, PREMIOVALORE, PREMIOPERCENTUALE, CONSUNTIVATOQTA, CONSUNTIVATOVALORE, PREMIOMATURATO, TIPO, TIPOCALCOLOPREMIO, 
                      CASE WHEN budgetvalore = 0 THEN 0 ELSE ((consuntivatovalore / budgetvalore * 100) - 100) END AS Delta, 0 AS PREMIONONVALIDO
FROM         dbo.CONTRATTILIQUIDAZIONE_CON


GO
GRANT SELECT
    ON OBJECT::[dbo].[AIOTCONTRATTILIQUIDAZIONE_CON] TO [Metodo98]
    AS [dbo];

