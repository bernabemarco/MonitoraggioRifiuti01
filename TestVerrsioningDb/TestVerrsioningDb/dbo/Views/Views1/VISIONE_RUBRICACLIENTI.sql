
CREATE VIEW VISIONE_RUBRICACLIENTI AS
SELECT     TOP (100) PERCENT cf.CODCONTO, cf.DSCCONTO1, APP.DestDiv, dd.RAGIONESOCIALE, CASE WHEN dd.indirizzo IS NULL 
                      THEN cf.indirizzo ELSE dd.indirizzo END AS indirizzo, CASE WHEN dd.cap IS NULL THEN cf.cap ELSE dd.cap END AS cap, CASE WHEN dd.localita IS NULL 
                      THEN cf.localita ELSE dd.localita END AS localita, cf.CODFISCALE, cf.PARTITAIVA, cf.CODMASTRO, APP.Data, APP.Ora, APP.Stato, APP.Utente, APP.Supervisor


FROM         dbo.ANAGRAFICACF AS cf INNER JOIN
                      dbo.TP_AGENDAUTENTEORDINI_A AS APP ON APP.CodCliente = cf.CODCONTO LEFT OUTER JOIN
                      dbo.DESTINAZIONIDIVERSE AS dd ON dd.CODCONTO = APP.CodCliente AND dd.CODICE = APP.DestDiv
ORDER BY cf.CODCONTO, APP.DestDiv

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISIONE_RUBRICACLIENTI] TO [Metodo98]
    AS [dbo];

