

CREATE VIEW CONTRATTILIQUIDAZIONE_CON
AS
SELECT     'CONDIZIONATI' AS TIPOCONTRIBUTO, dbo.CONTRATTI_CON.RIFCONTRATTO, dbo.CONTRATTI_CON.PROGRESSIVO AS RIFCONTRIBUTO, 
                      dbo.ContrattiRange_CON.NRRIGA AS RIFSOTTORIGA, dbo.ContrattiRange_CON.NOTE AS NOTA, '' AS TIPOLOGIA, CONVERT(varchar, 
                      dbo.CONTRATTI_CON.DADATA, 105) AS DADATA, CONVERT(varchar, dbo.CONTRATTI_CON.ADATA, 105) AS ADATA, 
                      dbo.ContrattiRange_CON.QTA AS BudgetQta, dbo.ContrattiRange_CON.UM, dbo.ContrattiRange_CON.VALORE AS BudgetValore, 
                      dbo.ContrattiRange_CON.QTA2 AS BudgetQtaConValore, dbo.ContrattiRange_CON.UM2 AS UmQtaConValore, dbo.ContrattiRange_CON.PREMIOVALORE, 
                      dbo.ContrattiRange_CON.PREMIOPERCENT AS PREMIOPERCENTUALE, dbo.ContrattiRange_CON.CONSUNTIVATOQTA, 
                      dbo.ContrattiRange_CON.CONSUNTIVATOVALORE, dbo.ContrattiRange_CON.PREMIOMATURATO, CASE WHEN dbo.ContrattiRange_CON.TIPO IS NULL 
                      THEN 1 ELSE dbo.ContrattiRange_CON.TIPO END AS TIPO, dbo.CONTRATTI_CON.TIPOCALCOLOPREMIO
FROM         dbo.CONTRATTI_CON INNER JOIN
                      dbo.ContrattiRange_CON ON dbo.CONTRATTI_CON.PROGRESSIVO = dbo.ContrattiRange_CON.RIFPROGRESSIVO


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTILIQUIDAZIONE_CON] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTILIQUIDAZIONE_CON] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTILIQUIDAZIONE_CON] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTILIQUIDAZIONE_CON] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTILIQUIDAZIONE_CON] TO [Metodo98]
    AS [dbo];

