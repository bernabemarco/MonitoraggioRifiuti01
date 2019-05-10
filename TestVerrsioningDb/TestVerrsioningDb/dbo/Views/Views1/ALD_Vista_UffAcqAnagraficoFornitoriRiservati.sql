
CREATE VIEW [dbo].[ALD_Vista_UffAcqAnagraficoFornitoriRiservati]
AS
SELECT     TABDITTE.DITTA, AnaFRiserv.ESERCIZIO, (CASE WHEN LEFT(isnull(anaF.PARTITAIVA, '00000000000'), 11) 
                      = '00000000000' THEN CASE WHEN LEFT(isnull(anaF.CODFISCALE, '00000000000'), 11) 
                      = '00000000000' THEN anaF.DSCCONTO1 ELSE anaF.CODFISCALE END ELSE anaF.PARTITAIVA END) AS CodRicerca, anaF.CODCONTO, 
                      anaF.DSCCONTO1, anaF.PARTITAIVA, anaF.CODFISCALE, AnaFRiserv.CODPAG, AnaFRiserv.UTENTEMODIFICA, AnaFRiserv.DATAMODIFICA, 
                      SUM(isnull(RIGHEIVA.IMPONIBILEEURO,0)) AS Fatturato
FROM         ANAGRAFICACF AS anaF INNER JOIN
                      ANAGRAFICARISERVATICF AS AnaFRiserv ON anaF.CODCONTO = AnaFRiserv.CODCONTO LEFT OUTER JOIN
                      RIGHEIVA ON AnaFRiserv.ESERCIZIO = RIGHEIVA.ESERCIZIO AND AnaFRiserv.CODCONTO = RIGHEIVA.CONTO CROSS JOIN
                      TABDITTE
WHERE     (anaF.TIPOCONTO = 'F')
GROUP BY TABDITTE.DITTA, AnaFRiserv.ESERCIZIO, anaF.CODCONTO, anaF.DSCCONTO1, anaF.PARTITAIVA, anaF.CODFISCALE, AnaFRiserv.CODPAG, 
                      AnaFRiserv.UTENTEMODIFICA, AnaFRiserv.DATAMODIFICA
GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_UffAcqAnagraficoFornitoriRiservati] TO [Metodo98]
    AS [dbo];

