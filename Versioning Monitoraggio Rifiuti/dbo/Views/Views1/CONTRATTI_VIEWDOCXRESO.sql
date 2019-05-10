
CREATE VIEW CONTRATTI_VIEWDOCXRESO
AS
SELECT     cost.contratto, con.PROGRESSIVO AS condizionato, rd.CODART AS codart, SUM(cost.valorerigapremio) AS TotNettoRiga, con.TIPODOC_COST_MANCRES AS TipoDoc, 
                      CASE WHEN tc.natura = 'A' THEN isnull(tc.cliente, tc.codice) ELSE isnull(tc.fornitore, tc.codice) END AS CliFor, cost.CODICECOSTO AS codicecosto
FROM         dbo.CONTRATTI_COSTIFICAZIONERIGHE AS cost INNER JOIN
                      dbo.CONTRATTI_CON AS con ON con.RIFCONTRATTO = cost.contratto AND con.PROGRESSIVO = cost.idcond INNER JOIN
                      dbo.RIGHEDOCUMENTI AS rd ON rd.IDTESTA = cost.idtestadoc AND rd.IDRIGA = cost.idrigadoc INNER JOIN
                      dbo.TESTE_CONTRATTI AS tc ON tc.PROGRESSIVO = cost.contratto
WHERE     (con.TIPORESO = 1) AND (GETDATE() >= con.ADATA) AND (con.RIFPROGRESSIVODOC_COST_MANCRES IS NULL OR
                      con.RIFPROGRESSIVODOC_COST_MANCRES = 0)
GROUP BY cost.contratto, con.PROGRESSIVO, rd.CODART, con.TIPODOC_COST_MANCRES, CASE WHEN tc.natura = 'A' THEN isnull(tc.cliente, tc.codice) ELSE isnull(tc.fornitore, 
                      tc.codice) END, cost.CODICECOSTO

GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_VIEWDOCXRESO] TO [Metodo98]
    AS [dbo];

