
CREATE VIEW FRCVistaCDRProdotti AS 
	SELECT T1.Ambiente, T2.Descrizione AS DesAmbiente, T1.CDRProdotto, T3.DESCRIZIONE AS DesCDRProdotto,
		   'Categoria Prodotto' AS Tipo, T1.Categoria AS Codice, T4.DESCRIZIONE AS Descrizione
	FROM FRCProdottoCategoriaArticolo T1 INNER JOIN CGesAmbienti T2 ON T1.Ambiente = T2.Codice
		 INNER JOIN TABCENTRICOSTO T3 ON T1.CDRProdotto = T3.CODICE
		 INNER JOIN TABCATEGORIE T4 ON T1.Categoria = T4.CODICE
	UNION ALL
	SELECT T1.Ambiente, T2.Descrizione AS DesAmbiente, T1.CDRProdotto, T3.DESCRIZIONE AS DesCDRProdotto,
		   'Categoria Statistica Prodotto' AS Tipo, T1.CategoriaStat AS Codice, T4.DESCRIZIONE AS Descrizione
	FROM FRCProdottoCategoriaStatArticolo T1 INNER JOIN CGesAmbienti T2 ON T1.Ambiente = T2.Codice
		 INNER JOIN TABCENTRICOSTO T3 ON T1.CDRProdotto = T3.CODICE
		 INNER JOIN TABCATEGORIESTAT T4 ON T1.CategoriaStat = T4.CODICE
	UNION ALL
	SELECT T1.Ambiente, T2.Descrizione AS DesAmbiente, T1.CDRProdotto, T3.DESCRIZIONE AS DesCDRProdotto,
		   'Gruppo Prodotto' AS Tipo, T1.Gruppo AS Codice, T4.DESCRIZIONE AS Descrizione
	FROM FRCProdottoGruppoArticolo T1 INNER JOIN CGesAmbienti T2 ON T1.Ambiente = T2.Codice
		 INNER JOIN TABCENTRICOSTO T3 ON T1.CDRProdotto = T3.CODICE
		 INNER JOIN TABGRUPPI T4 ON T1.Gruppo = T4.CODICE
	UNION ALL
	SELECT T1.Ambiente, T2.Descrizione AS DesAmbiente, T1.CDRProdotto, T3.DESCRIZIONE AS DesCDRProdotto,
		   'Modello Prodotto' AS Tipo, T1.Modello AS Codice, T4.DESCRIZIONE AS Descrizione
	FROM FRCProdottoModelloArticolo T1 INNER JOIN CGesAmbienti T2 ON T1.Ambiente = T2.Codice
		 INNER JOIN TABCENTRICOSTO T3 ON T1.CDRProdotto = T3.CODICE
		 INNER JOIN TABELLAMODELLI T4 ON T1.Modello = T4.CODICE
	UNION ALL
	SELECT T1.Ambiente, T2.Descrizione AS DesAmbiente, T1.CDRProdotto, T3.DESCRIZIONE AS DesCDRProdotto,
		   'Serie Prodotto' AS Tipo, T1.Serie AS Codice, T4.DESCRIZIONE AS Descrizione
	FROM FRCProdottoSerieArticolo T1 INNER JOIN CGesAmbienti T2 ON T1.Ambiente = T2.Codice
		 INNER JOIN TABCENTRICOSTO T3 ON T1.CDRProdotto = T3.CODICE
		 INNER JOIN TABELLASERIE T4 ON T1.Serie = T4.CODICE

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaCDRProdotti] TO [Metodo98]
    AS [dbo];

