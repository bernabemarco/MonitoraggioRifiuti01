
CREATE VIEW FRCVistaDatiCicli AS 
	SELECT ID, AMBIENTE AS Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCDatiCicli.AMBIENTE), '') AS Descrizione_Ambiente, ANNO AS Anno, 
		   MESEDOC AS Mese, COMPOSTO AS Composto, DSCCOMPOSTO AS Descrizione_Composto, UMGEST AS UM_Gestione, QTAGEST AS [Quantita'_Gestione], 
		   UMPREZZO AS UM_Prezzo, QTAPREZZO AS [Quantita'_Prezzo], FATTORE AS Fattore_Conversione, QUANTITA AS [Quantita'], 
		   CDRMercato AS CDR_Mercato, ISNULL((SELECT DESCRIZIONE FROM TABCENTRICOSTO WHERE CODICE = FRCDatiCicli.CDRMercato), '') AS Descrizione_CDR_Mercato, 
		   CDRProdotto AS CDR_Prodotto, ISNULL((SELECT DESCRIZIONE FROM TABCENTRICOSTO WHERE CODICE = FRCDatiCicli.CDRProdotto), '') AS Descrizione_CDR_Prodotto, 
		   COMPONENTE AS Componente, DSCCOMPONENTE AS Descrizione_Componente, RIFCICLO AS Riferimento_Ciclo, RIFFASE AS Numero_Fase, TIPOFASE AS Tipo_Fase, 
		   OPERAZIONE AS Operazione, ISNULL((SELECT DESCRIZIONE FROM TABELLAOPERAZIONI WHERE CODICE = FRCDatiCicli.OPERAZIONE), '') AS Descrizione_Operazione, 
		   CDLAVORO AS Centro_Lavoro, ISNULL((SELECT DESCRIZIONE FROM TABELLACDLAVORO WHERE CODICE = FRCDatiCicli.CDLAVORO), '') AS Descrizione_Centro_Lavoro, 
		   MACCHINA AS Risorsa, ISNULL((SELECT DESCRIZIONE FROM TABELLAMACCHINE WHERE CODICE = FRCDatiCicli.MACCHINA), '') AS Descrizione_Risorsa, 
		   TEMPOSETUP AS Tempo_Setup, UMTEMPOSETUP AS UM_Tempo_Setup, TEMPORISORSA AS Tempo_Risorsa, UMTEMPORISORSA AS UM_Tempo_Risorsa, 
		   TEMPOUOMO AS Tempo_Uomo, UMTEMPOUOMO AS UM_Tempo_Uomo, DURATA AS Durata, UMDURATA AS UM_Durata, TEMPOMOVIMENTAZIONE AS Tempo_Movimentazione, 
		   TEMPOCODA AS Tempo_Coda, TEMPOATTRAV AS Tempo_Attraversamento, COSTOSETUPEURO AS Costo_Setup, COSTORISORSAEURO AS Costo_Risorsa, 
		   COSTOUOMOEURO AS Costo_Uomo, COSTOESTERNOEURO AS Costo_Esterno, COSTOINDVAREURO AS Costo_Ind_Variabile, COSTOINDFISSOEURO AS Costo_Ind_Fisso, 
		   FORNITOREPREF AS Fornitore, ISNULL((SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO = FRCDatiCicli.FORNITOREPREF), '') AS Ragione_Sociale_Fornitore, 
		   UMFASE AS UM_Fase, CDCProd AS Centro_Prod, ISNULL((SELECT DESCRIZIONE FROM TABCENTRICOSTO WHERE CODICE = FRCDatiCicli.CDCProd), '') AS Descrizione_Centro_Prod, 
		   RendimentoProd AS Rendimento_Prod, CDCMop AS Centro_Mop, 
		   ISNULL((SELECT DESCRIZIONE FROM TABCENTRICOSTO WHERE CODICE = FRCDatiCicli.CDCMop), '') AS Descrizione_Centro_Mop, RendimentoMop AS Rendimento_Mop, 
		   CDCSetup AS Centro_Setup, ISNULL((SELECT DESCRIZIONE FROM TABCENTRICOSTO WHERE CODICE = FRCDatiCicli.CDCSetup), '') AS Descrizione_Centro_Setup, 
		   RendimentoSetup AS Rendimento_Setup, TEMPOSETUPTOT AS Tempo_Totale_Setup, TEMPORISORSATOT AS Tempo_Totale_Risorsa, TEMPOUOMOTOT AS Tempo_Totale_Uomo, 
		   COSTOLAVESTERNETOT AS Costo_Totale_Lavorazioni_Esterne, AmbienteIndici AS Ambiente_Indici, AnnoInizioIndici AS Anno_Inizio_Indici, MeseInizioIndici AS Mese_Inizio_Indici, 
		   AnnoFineIndici AS Anno_Fine_Indici, MeseFineIndici AS Mese_Fine_Indici, IndiceUnitVarSetup AS Indice_Unit_Var_Setup, IndiceUnitFisSetup AS Indice_Unit_Fis_Setup, 
		   CostoTrasfVarSetup AS Costo_Trasf_Var_Setup, CostoTrasfFisSetup AS Costo_Trasf_Fis_Setup, IndiceUnitVarUomo AS Indice_Unit_Var_Uomo, IndiceUnitFisUomo AS Indice_Unit_Fis_Uomo, 
		   CostoTrasfVarUomo AS Costo_Trasf_Var_Uomo, CostoTrasfFisUomo AS Costo_Trasf_Fis_Uomo, IndiceUnitVarMacchina AS Indice_Unit_Var_Macchina, IndiceUnitFisMacchina AS Indice_Unit_Fis_Macchina, 
		   CostoTrasfVarMacchina AS Costo_Trasf_Var_Macchina, CostoTrasfFisMacchina AS Costo_Trasf_Fis_Macchina, IDBudgetOrig AS ID_Budget_Origine, 
		   ISNULL((SELECT PESONETTO FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCDatiCicli.COMPOSTO), 0) AS Peso_Netto_Composto, 
		   ISNULL((SELECT SUPERFICIE FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCDatiCicli.COMPOSTO), 0) AS Superficie_Composto, 
		   ISNULL((SELECT CUBATURA FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCDatiCicli.COMPOSTO), 0) AS Cubatura_Composto, 
		   ISNULL((SELECT PESONETTO FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCDatiCicli.COMPONENTE), 0) AS Peso_Netto_Componente, 
		   ISNULL((SELECT SUPERFICIE FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCDatiCicli.COMPONENTE), 0) AS Superficie_Componente, 
		   ISNULL((SELECT CUBATURA FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCDatiCicli.COMPONENTE), 0) AS Cubatura_Componente 
	FROM FRCDatiCicli

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaDatiCicli] TO [Metodo98]
    AS [dbo];

