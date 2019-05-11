﻿
CREATE VIEW FRCVistaDistinteCicliEsplose AS 
	SELECT ID, ANNO AS Anno, COMPOSTO AS Composto, DSCCOMPOSTO AS Descrizione_Composto, QUANTITACOMPOSTO AS [Quantita'_Composto], 
		   DATAVALUTAZIONE AS Data_Valutazione, COMPONENTE AS Componente, DSCCOMPONENTE AS Descrizione_Componente, 
		   RIFCICLO AS Riferimento_Ciclo, RIFFASE AS Numero_Fase, TIPOFASE AS Tipo_Fase, 
		   OPERAZIONE AS Operazione, ISNULL((SELECT DESCRIZIONE FROM TABELLAOPERAZIONI WHERE CODICE = FRCDistinteCicliEsplose.OPERAZIONE), '') AS Descrizione_Operazione, 
		   CDLAVORO AS Centro_Lavoro, ISNULL((SELECT DESCRIZIONE FROM TABELLACDLAVORO WHERE CODICE = FRCDistinteCicliEsplose.CDLAVORO), '') AS Descrizione_Centro_Lavoro, 
		   MACCHINA AS Risorsa, ISNULL((SELECT DESCRIZIONE FROM TABELLAMACCHINE WHERE CODICE = FRCDistinteCicliEsplose.MACCHINA), '') AS Descrizione_Risorsa, 
		   TEMPOSETUP AS Tempo_Setup, UMTEMPOSETUP AS UM_Tempo_Setup, TEMPORISORSA AS Tempo_Risorsa, UMTEMPORISORSA AS UM_Tempo_Risorsa, 
		   TEMPOUOMO AS Tempo_Uomo, UMTEMPOUOMO AS UM_Tempo_Uomo, DURATA AS Durata, UMDURATA AS UM_Durata, TEMPOMOVIMENTAZIONE AS Tempo_Movimentazione, 
		   TEMPOCODA AS Tempo_Coda, TEMPOATTRAV AS Tempo_Attraversamento, COSTOSETUPEURO AS Costo_Setup, COSTORISORSAEURO AS Costo_Risorsa, 
		   COSTOUOMOEURO AS Costo_Uomo, COSTOESTERNOEURO AS Costo_Esterno, COSTOINDVAREURO AS Costo_Ind_Variabile, COSTOINDFISSOEURO AS Costo_Ind_Fisso, 
		   FORNITOREPREF AS Fornitore, ISNULL((SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO = FRCDistinteCicliEsplose.FORNITOREPREF), '') AS Ragione_Sociale_Fornitore, 
		   UMFASE AS UM_Fase, CDCProd AS Codice_Centro, ISNULL((SELECT DESCRIZIONE FROM TABCENTRICOSTO WHERE CODICE = FRCDistinteCicliEsplose.CDCProd), '') AS Descrizione_Centro, 
		   ISNULL((SELECT PESONETTO FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCDistinteCicliEsplose.COMPOSTO), 0) AS Peso_Netto_Composto, 
		   ISNULL((SELECT SUPERFICIE FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCDistinteCicliEsplose.COMPOSTO), 0) AS Superficie_Composto, 
		   ISNULL((SELECT CUBATURA FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCDistinteCicliEsplose.COMPOSTO), 0) AS Cubatura_Composto 
	FROM FRCDistinteCicliEsplose

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaDistinteCicliEsplose] TO [Metodo98]
    AS [dbo];
