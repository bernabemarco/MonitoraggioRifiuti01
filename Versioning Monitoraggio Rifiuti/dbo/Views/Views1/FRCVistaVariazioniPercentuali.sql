
CREATE VIEW FRCVistaVariazioniPercentuali AS 
	SELECT Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCVariazioniCliente.Ambiente), '') AS DesAmbiente, 
		   Anno, MeseInizio, MeseFine, PercQuantita, PercPrezzo, 'Cliente' AS Tipo,
		   Cliente AS Codice, ISNULL((SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO = FRCVariazioniCliente.Cliente), '') AS Descrizione
	FROM FRCVariazioniCliente
	UNION ALL
	SELECT Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCVariazioniSettoreCliente.Ambiente), '') AS DesAmbiente, 
		   Anno, MeseInizio, MeseFine, PercQuantita, PercPrezzo, 'Settore' AS Tipo,
		   Settore AS Codice, ISNULL((SELECT DESCRIZIONE FROM TABSETTORI WHERE CODICE = FRCVariazioniSettoreCliente.Settore), '') AS Descrizione
	FROM FRCVariazioniSettoreCliente
	UNION ALL
	SELECT Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCVariazioniZonaCliente.Ambiente), '') AS DesAmbiente, 
		   Anno, MeseInizio, MeseFine, PercQuantita, PercPrezzo, 'Zona' AS Tipo,
		   Zona AS Codice, ISNULL((SELECT DESCRIZIONE FROM TABZONE WHERE CODICE = FRCVariazioniZonaCliente.Zona), '') AS Descrizione
	FROM FRCVariazioniZonaCliente
	UNION ALL
	SELECT Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCVariazioniCategoriaCliente.Ambiente), '') AS DesAmbiente, 
		   Anno, MeseInizio, MeseFine, PercQuantita, PercPrezzo, 'Categoria Cliente' AS Tipo,
		   Categoria AS Codice, ISNULL((SELECT DSCCATEGORIA FROM CATEGORIECF WHERE CODCATEGORIA = FRCVariazioniCategoriaCliente.Categoria), '') AS Descrizione
	FROM FRCVariazioniCategoriaCliente
	UNION ALL
	SELECT Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCVariazioniAgente1.Ambiente), '') AS DesAmbiente, 
		   Anno, MeseInizio, MeseFine, PercQuantita, PercPrezzo, 'Agente 1' AS Tipo,
		   Agente AS Codice, ISNULL((SELECT DSCAGENTE FROM ANAGRAFICAAGENTI WHERE CODAGENTE = FRCVariazioniAgente1.Agente), '') AS Descrizione
	FROM FRCVariazioniAgente1
	UNION ALL
	SELECT Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCVariazioniAgente2.Ambiente), '') AS DesAmbiente, 
		   Anno, MeseInizio, MeseFine, PercQuantita, PercPrezzo, 'Agente 2' AS Tipo,
		   Agente AS Codice, ISNULL((SELECT DSCAGENTE FROM ANAGRAFICAAGENTI WHERE CODAGENTE = FRCVariazioniAgente2.Agente), '') AS Descrizione
	FROM FRCVariazioniAgente2
	UNION ALL
	SELECT Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCVariazioniAgente3.Ambiente), '') AS DesAmbiente, 
		   Anno, MeseInizio, MeseFine, PercQuantita, PercPrezzo, 'Agente 3' AS Tipo,
		   Agente AS Codice, ISNULL((SELECT DSCAGENTE FROM ANAGRAFICAAGENTI WHERE CODAGENTE = FRCVariazioniAgente3.Agente), '') AS Descrizione
	FROM FRCVariazioniAgente3
	UNION ALL
	SELECT Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCVariazioniArticolo.Ambiente), '') AS DesAmbiente, 
		   Anno, MeseInizio, MeseFine, PercQuantita, PercPrezzo, 'Articolo' AS Tipo,
		   Articolo AS Codice, ISNULL((SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCVariazioniArticolo.Articolo), '') AS Descrizione
	FROM FRCVariazioniArticolo
	UNION ALL
	SELECT Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCVariazioniGruppoArticolo.Ambiente), '') AS DesAmbiente, 
		   Anno, MeseInizio, MeseFine, PercQuantita, PercPrezzo, 'Gruppo Articolo' AS Tipo,
		   Gruppo AS Codice, ISNULL((SELECT DESCRIZIONE FROM TABGRUPPI WHERE CODICE = FRCVariazioniGruppoArticolo.Gruppo), '') AS Descrizione
	FROM FRCVariazioniGruppoArticolo
	UNION ALL
	SELECT Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCVariazioniCategoriaArticolo.Ambiente), '') AS DesAmbiente, 
		   Anno, MeseInizio, MeseFine, PercQuantita, PercPrezzo, 'Categoria Articolo' AS Tipo,
		   Categoria AS Codice, ISNULL((SELECT DESCRIZIONE FROM TABCATEGORIE WHERE CODICE = FRCVariazioniCategoriaArticolo.Categoria), '') AS Descrizione
	FROM FRCVariazioniCategoriaArticolo
	UNION ALL
	SELECT Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCVariazioniCategoriaStatArticolo.Ambiente), '') AS DesAmbiente, 
		   Anno, MeseInizio, MeseFine, PercQuantita, PercPrezzo, 'Categoria Statistica Articolo' AS Tipo,
		   CategoriaStat AS Codice, ISNULL((SELECT DESCRIZIONE FROM TABCATEGORIESTAT WHERE CODICE = FRCVariazioniCategoriaStatArticolo.CategoriaStat), '') AS Descrizione
	FROM FRCVariazioniCategoriaStatArticolo
	UNION ALL
	SELECT Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCVariazioniSerieArticolo.Ambiente), '') AS DesAmbiente, 
		   Anno, MeseInizio, MeseFine, PercQuantita, PercPrezzo, 'Serie Articolo' AS Tipo,
		   Serie AS Codice, ISNULL((SELECT DESCRIZIONE FROM TABELLASERIE WHERE CODICE = FRCVariazioniSerieArticolo.Serie), '') AS Descrizione
	FROM FRCVariazioniSerieArticolo
	UNION ALL
	SELECT Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCVariazioniModelloArticolo.Ambiente), '') AS DesAmbiente, 
		   Anno, MeseInizio, MeseFine, PercQuantita, PercPrezzo, 'Modello Articolo' AS Tipo,
		   Modello AS Codice, ISNULL((SELECT DESCRIZIONE FROM TABELLAMODELLI WHERE CODICE = FRCVariazioniModelloArticolo.Modello), '') AS Descrizione
	FROM FRCVariazioniModelloArticolo
	UNION ALL
	SELECT Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCVariazioniContropartita.Ambiente), '') AS DesAmbiente, 
		   Anno, MeseInizio, MeseFine, PercQuantita, PercPrezzo, 'Conto Contropartita' AS Tipo,
		   Conto AS Codice, ISNULL((SELECT DSCCONTO1 FROM ANAGRAFICAGENERICI WHERE CODCONTO = FRCVariazioniContropartita.Conto), '') AS Descrizione
	FROM FRCVariazioniContropartita
	UNION ALL
	SELECT Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCVariazioniCentroCosto.Ambiente), '') AS DesAmbiente, 
		   Anno, MeseInizio, MeseFine, PercQuantita, PercPrezzo, 'Centro di Costo' AS Tipo,
		   Centro AS Codice, ISNULL((SELECT DESCRIZIONE FROM TABCENTRICOSTO WHERE CODICE = FRCVariazioniCentroCosto.Centro), '') AS Descrizione
	FROM FRCVariazioniCentroCosto

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaVariazioniPercentuali] TO [Metodo98]
    AS [dbo];

