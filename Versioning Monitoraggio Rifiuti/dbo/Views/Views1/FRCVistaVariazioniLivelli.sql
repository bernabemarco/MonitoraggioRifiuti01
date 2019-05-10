
CREATE VIEW FRCVistaVariazioniLivelli AS 
	SELECT Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCVariazioniLivelli.Ambiente), '') AS DesAmbiente, 
		   Anno, MeseInizio, MeseFine, Riga, PercQuantita, PercPrezzo, 
		   Cliente, ISNULL((SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO = FRCVariazioniLivelli.Cliente), '') AS DesCliente, 
		   Settore, ISNULL((SELECT DESCRIZIONE FROM TABSETTORI WHERE CODICE = FRCVariazioniLivelli.Settore), '') AS DesSettore, 
		   Zona, ISNULL((SELECT DESCRIZIONE FROM TABZONE WHERE CODICE = FRCVariazioniLivelli.Zona), '') AS DesZona, 
		   CategoriaC, ISNULL((SELECT DSCCATEGORIA FROM CATEGORIECF WHERE CODCATEGORIA = FRCVariazioniLivelli.CategoriaC), '') AS DesCategoriaC, 
		   Agente1, ISNULL((SELECT DSCAGENTE FROM ANAGRAFICAAGENTI WHERE CODAGENTE = FRCVariazioniLivelli.Agente1), '') AS DesAgente1, 
		   Agente2, ISNULL((SELECT DSCAGENTE FROM ANAGRAFICAAGENTI WHERE CODAGENTE = FRCVariazioniLivelli.Agente2), '') AS DesAgente2, 
		   Agente3, ISNULL((SELECT DSCAGENTE FROM ANAGRAFICAAGENTI WHERE CODAGENTE = FRCVariazioniLivelli.Agente3), '') AS DesAgente3, 
		   Articolo, ISNULL((SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCVariazioniLivelli.Articolo), '') AS DesArticolo, 
		   Gruppo, ISNULL((SELECT DESCRIZIONE FROM TABGRUPPI WHERE CODICE = FRCVariazioniLivelli.Gruppo), '') AS DesGruppo, 
		   CategoriaA, ISNULL((SELECT DESCRIZIONE FROM TABCATEGORIE WHERE CODICE = FRCVariazioniLivelli.CategoriaA), '') AS DesCategoriaA, 
		   CategoriaStat, ISNULL((SELECT DESCRIZIONE FROM TABCATEGORIESTAT WHERE CODICE = FRCVariazioniLivelli.CategoriaStat), '') AS DesCategoriaStat, 
		   Serie, ISNULL((SELECT DESCRIZIONE FROM TABELLASERIE WHERE CODICE = FRCVariazioniLivelli.Serie), '') AS DesSerie, 
		   Modello, ISNULL((SELECT DESCRIZIONE FROM TABELLAMODELLI WHERE CODICE = FRCVariazioniLivelli.Modello), '') AS DesModello, 
		   Conto, ISNULL((SELECT DSCCONTO1 FROM ANAGRAFICAGENERICI WHERE CODCONTO = FRCVariazioniLivelli.Conto), '') AS DesConto, 
		   Centro, ISNULL((SELECT DESCRIZIONE FROM TABCENTRICOSTO WHERE CODICE = FRCVariazioniLivelli.Centro), '') AS DesCentro
	FROM FRCVariazioniLivelli

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaVariazioniLivelli] TO [Metodo98]
    AS [dbo];

