
CREATE VIEW [ALD_Vista_ALD_TabStoricoValutazioneFornitori]
AS
SELECT  CODCONTO, MAX(DISTINCT ESERCIZIO) AS Esercizio
FROM         ALD_TabStoricoValutazioneFornitori
--where      (ESERCIZIO < 2011)
GROUP BY CODCONTO

GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_ALD_TabStoricoValutazioneFornitori] TO [Metodo98]
    AS [dbo];

