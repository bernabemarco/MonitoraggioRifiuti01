CREATE VIEW VISTALIVPRODCALC_ARTGENUPD AS
-- LIVELLI PRODUZIONE ARTICOLI GENERATI 
-- Il livello di produzione da considerare per ogni articolo generato è il MAX dei due
-- riportati dalla vista: uno è relativo al generico, l'altro al codice generato
SELECT CODART, MAX(LIVPRODNUM) AS LIVPRODNUM_MAX 
	FROM VISTALIVPRODCALC_ARTGEN 
	GROUP BY CODART

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTALIVPRODCALC_ARTGENUPD] TO [Metodo98]
    AS [dbo];

