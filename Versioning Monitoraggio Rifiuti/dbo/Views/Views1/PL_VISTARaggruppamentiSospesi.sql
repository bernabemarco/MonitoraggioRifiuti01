


CREATE VIEW PL_VISTARaggruppamentiSospesi
AS

SELECT     PL_PackingTesta.Esercizio, PL_PackingTesta.Data, PL_PackingTesta.NUMPL, PL_PackingTesta.CliFor, ANAGRAFICACF.DSCCONTO1,             
           PL_PackingTesta.DestinazioneDiversa, PL_PackingRaggSospeso.DicituraRaggruppamento, PL_PackingRaggSospeso.Legame, 
           PL_PackingRaggSospeso.RifProgressivo
FROM       PL_PackingRaggSospeso INNER JOIN
        PL_PackingTesta ON PL_PackingRaggSospeso.RifProgressivo = PL_PackingTesta.Progressivo INNER JOIN
        ANAGRAFICACF ON PL_PackingTesta.CliFor  = ANAGRAFICACF.CODCONTO
GROUP BY PL_PackingTesta.Esercizio, PL_PackingTesta.Data, PL_PackingTesta.NUMPL, PL_PackingTesta.CliFor, ANAGRAFICACF.DSCCONTO1, 
         PL_PackingTesta.DestinazioneDiversa, PL_PackingRaggSospeso.DicituraRaggruppamento, PL_PackingRaggSospeso.Legame, 
         PL_PackingRaggSospeso.RifProgressivo



GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_VISTARaggruppamentiSospesi] TO [Metodo98]
    AS [dbo];

