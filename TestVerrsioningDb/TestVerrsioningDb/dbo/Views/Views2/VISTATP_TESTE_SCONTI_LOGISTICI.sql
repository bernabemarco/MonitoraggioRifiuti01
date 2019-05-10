

CREATE VIEW dbo.VISTATP_TESTE_SCONTI_LOGISTICI
AS
SELECT     PROGRESSIVO, DADATA, ADATA, CODCLIFOR, CASE WHEN ANAGRAFICACF.DSCCONTO1 IS NULL 
                      THEN 'Tutti' ELSE ANAGRAFICACF.DSCCONTO1 END AS DSCCONTO1, 
                      CASE WHEN TipologiaDettaglio = 0 THEN 'Gruppo' ELSE CASE WHEN TipologiaDettaglio = 1 THEN 'Categoria' ELSE CASE WHEN TipologiaDettaglio = 2
                       THEN 'Categoria Statistica' ELSE CASE WHEN TipologiaDettaglio = 3 THEN 'Gruppo Prezzi Magazzino' ELSE 'Articolo' END END END END AS TipologiaDettaglio,
                       UM, QTAMIN, SCONTO, TIPOLOGIASCONTO, RifContratto
FROM         TP_TESTE_SCONTI_LOGISTICI LEFT OUTER JOIN
                      ANAGRAFICACF ON CODCLIFOR = ANAGRAFICACF.CODCONTO


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATP_TESTE_SCONTI_LOGISTICI] TO [Metodo98]
    AS [dbo];

