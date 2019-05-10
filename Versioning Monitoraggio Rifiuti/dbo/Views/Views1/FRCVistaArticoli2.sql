﻿
CREATE VIEW FRCVistaArticoli2 AS 
	SELECT ANAGRAFICAARTICOLI.CODICE AS CODART, ANAGRAFICAARTICOLI.DESCRIZIONE, RIGHT(ANAGRAFICAARTICOLI.CODICE, 50) 
	       + ' - ' + RIGHT(ANAGRAFICAARTICOLI.DESCRIZIONE, 150) AS ARTICOLO, ISNULL(ANAGRAFICAARTICOLI.GRUPPO, 0) AS GRUPPO, ISNULL(TABGRUPPI.DESCRIZIONE, '') AS DESCGRPART, 
		   ISNULL(ANAGRAFICAARTICOLI.CATEGORIA, 0) AS CATEGORIA, ISNULL(TABCATEGORIE.DESCRIZIONE, '') AS DESCCATART, ISNULL(ANAGRAFICAARTICOLI.CODCATEGORIASTAT, 0) AS CODCATEGORIASTAT, 
		   ISNULL(TABCATEGORIESTAT.DESCRIZIONE, '') AS DESCCATSTATART, ISNULL(ANAGRAFICAARTICOLI.SERIE, '') AS SERIE, ISNULL(TABELLASERIE.DESCRIZIONE, '') AS DESCSERIEART, 
		   ISNULL(ANAGRAFICAARTICOLI.MODELLO, '') AS MODELLO, ISNULL(TABELLAMODELLI.DESCRIZIONE, '') AS DESCMODART, ISNULL(ANAGRAFICAARTICOLI.PESONETTO, 0) AS PESONETTO, 
		   ISNULL(ANAGRAFICAARTICOLI.SUPERFICIE, 0) AS SUPERFICIE, ISNULL(ANAGRAFICAARTICOLI.CUBATURA, 0) AS CUBATURA, ISNULL(ANAGRAFICAARTICOLI.NRPEZZIIMBALLO, 0) AS NRPEZZIIMBALLO, 
		   ISNULL(ANAGRAFICAARTICOLI.RIFERIMIMBALLO, '') AS RIFERIMIMBALLO, ARTICOLIFATTORICONVERSIONE.UM1 AS UM_VENDITA, ARTICOLIFATTORICONVERSIONE.UM2 AS UM_BASE, 
		   ARTICOLIFATTORICONVERSIONE.FATTORE, ARTICOLIUMPREFERITE_1.TIPOUM, ANAGRAFICAARTICOLICOMM.CODIVA, ISNULL(TRATTAMENTOIVA.DESCRIZIONE, '') AS DESCIVA, 
		   ISNULL(TRATTAMENTOIVA.ALIQUOTA, 0) AS ALIQUOTA, ISNULL(TRATTAMENTOIVA.INDETRAIBILITA, 0) AS INDETRAIBILITA, ARTICOLIUMPREFERITE.TIPOUM AS TIPOUMBASE
	FROM TABELLASERIE RIGHT OUTER JOIN TABELLAMODELLI RIGHT OUTER JOIN TABCATEGORIE RIGHT OUTER JOIN ARTICOLIUMPREFERITE INNER JOIN
		 ARTICOLIFATTORICONVERSIONE INNER JOIN ARTICOLIUMPREFERITE AS ARTICOLIUMPREFERITE_1 ON ARTICOLIFATTORICONVERSIONE.CODART = ARTICOLIUMPREFERITE_1.CODART AND 
		 ARTICOLIFATTORICONVERSIONE.UM1 = ARTICOLIUMPREFERITE_1.UM ON ARTICOLIUMPREFERITE.CODART = ARTICOLIFATTORICONVERSIONE.CODART AND 
		 ARTICOLIUMPREFERITE.UM = ARTICOLIFATTORICONVERSIONE.UM2 RIGHT OUTER JOIN ANAGRAFICAARTICOLI ON ARTICOLIFATTORICONVERSIONE.CODART = ANAGRAFICAARTICOLI.CODICE ON 
		 TABCATEGORIE.CODICE = ANAGRAFICAARTICOLI.CATEGORIA LEFT OUTER JOIN TABGRUPPI ON ANAGRAFICAARTICOLI.GRUPPO = TABGRUPPI.CODICE ON TABELLAMODELLI.CODICE = ANAGRAFICAARTICOLI.MODELLO ON 
		 TABELLASERIE.CODICE = ANAGRAFICAARTICOLI.SERIE LEFT OUTER JOIN TABCATEGORIESTAT ON ANAGRAFICAARTICOLI.CODCATEGORIASTAT = TABCATEGORIESTAT.CODICE
		 INNER JOIN ANAGRAFICAARTICOLICOMM ON ANAGRAFICAARTICOLI.CODICE = ANAGRAFICAARTICOLICOMM.CODICEART AND ANAGRAFICAARTICOLICOMM.ESERCIZIO = (SELECT MAX(CODICE) FROM TABESERCIZI)
		 LEFT OUTER JOIN TRATTAMENTOIVA ON ANAGRAFICAARTICOLICOMM.CODIVA = TRATTAMENTOIVA.CODICE
	GROUP BY ANAGRAFICAARTICOLI.CODICE, ANAGRAFICAARTICOLI.DESCRIZIONE, ISNULL(ANAGRAFICAARTICOLI.GRUPPO, 0), ISNULL(TABGRUPPI.DESCRIZIONE, ''), 
			 ISNULL(ANAGRAFICAARTICOLI.CATEGORIA, 0), ISNULL(TABCATEGORIE.DESCRIZIONE, ''), ISNULL(ANAGRAFICAARTICOLI.CODCATEGORIASTAT, 0), 
			 ISNULL(TABCATEGORIESTAT.DESCRIZIONE, ''), ISNULL(ANAGRAFICAARTICOLI.SERIE, ''), ISNULL(TABELLASERIE.DESCRIZIONE, ''), ISNULL(ANAGRAFICAARTICOLI.MODELLO, ''), 
			 ISNULL(TABELLAMODELLI.DESCRIZIONE, ''), ISNULL(ANAGRAFICAARTICOLI.PESONETTO, 0), ISNULL(ANAGRAFICAARTICOLI.SUPERFICIE, 0), ISNULL(ANAGRAFICAARTICOLI.CUBATURA, 0), 
			 ISNULL(ANAGRAFICAARTICOLI.NRPEZZIIMBALLO, 0), ISNULL(ANAGRAFICAARTICOLI.RIFERIMIMBALLO, ''), ARTICOLIFATTORICONVERSIONE.UM1, 
			 ARTICOLIFATTORICONVERSIONE.UM2, ARTICOLIFATTORICONVERSIONE.FATTORE, ARTICOLIUMPREFERITE_1.TIPOUM, ANAGRAFICAARTICOLICOMM.CODIVA, ISNULL(TRATTAMENTOIVA.DESCRIZIONE, ''), 
			 ISNULL(TRATTAMENTOIVA.ALIQUOTA, 0), ISNULL(TRATTAMENTOIVA.INDETRAIBILITA, 0), ARTICOLIUMPREFERITE.TIPOUM
	HAVING ARTICOLIUMPREFERITE_1.TIPOUM = 3 AND ARTICOLIUMPREFERITE.TIPOUM = 1

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaArticoli2] TO [Metodo98]
    AS [dbo];

