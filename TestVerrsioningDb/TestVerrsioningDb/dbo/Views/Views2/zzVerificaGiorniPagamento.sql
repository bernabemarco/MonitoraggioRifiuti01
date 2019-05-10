
CREATE VIEW [dbo].[zzVerificaGiorniPagamento]
AS
SELECT     dbo.zzDataInizioConteggioScadenza.PROGRESSIVO, dbo.TABSCADENZE.CODCLIFOR, dbo.TABSCADENZE.DATAFATTURA, 
                      dbo.TABSCADENZE.DATASCADENZA, dbo.TABSCADENZE.DATAPAGEFF, dbo.zzDataInizioConteggioScadenza.DataOK, DATEDIFF(d, 
                      dbo.zzDataInizioConteggioScadenza.DataOK, dbo.TABSCADENZE.DATAPAGEFF) AS GGPagamento, DATEDIFF(d, 
                      dbo.zzDataInizioConteggioScadenza.DataOK, dbo.TABSCADENZE.DATASCADENZA) AS GGRichiesti, YEAR(dbo.TABSCADENZE.DATASCADENZA) 
                      AS ESERCIZIO
FROM         dbo.zzDataInizioConteggioScadenza INNER JOIN
                      dbo.TABSCADENZE ON dbo.zzDataInizioConteggioScadenza.PROGRESSIVO = dbo.TABSCADENZE.PROGRESSIVO
WHERE     (dbo.TABSCADENZE.ESITO IN (2, 4))

GO
GRANT SELECT
    ON OBJECT::[dbo].[zzVerificaGiorniPagamento] TO [Metodo98]
    AS [dbo];

