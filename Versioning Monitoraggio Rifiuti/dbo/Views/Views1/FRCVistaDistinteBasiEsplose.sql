﻿
CREATE VIEW FRCVistaDistinteBasiEsplose AS 
	SELECT ID, NomeEsplosione AS Nome_Esplosione, ANNO AS Anno, RIFDISTINTA AS Riferimento_Distinta, RIFNRRIGA AS Riga_Distinta, COMPOSTO AS Composto, DSCCOMPOSTO AS Descrizione_Composto, 
		   QUANTITACOMPOSTO AS [Quantita'_Composto], DATAVALUTAZIONE AS Data_Valutazione, UMCOMPOSTO AS UM_Composto, LIVPRODUZIONECOMPOSTO AS Liv_Prod_Composto, 
		   COMPONENTE AS Componente, DSCCOMPONENTE AS Descrizione_Componente, TIPO AS Tipo_Componente, LIVELLO AS Livello_Componente, 
		   LIVPRODUZIONE AS Liv_Prod_Componente, UMCOMPONENTE AS UM_Componente, QUANTITA AS [Quantita'_Componente], COSTOUNIEURO AS Costo_Unitario, COSTOTOTEURO AS Costo_Totale, 
		   CONTOACQITA AS Conto_ITA, ISNULL((SELECT DSCCONTO1 FROM ANAGRAFICAGENERICI WHERE CODCONTO = FRCDistinteBasiEsplose.CONTOACQITA), '') AS Descrizione_Conto_ITA, 
		   CONTOACQEST AS Conto_EST, ISNULL((SELECT DSCCONTO1 FROM ANAGRAFICAGENERICI WHERE CODCONTO = FRCDistinteBasiEsplose.CONTOACQEST), '') AS Descrizione_Conto_EST, 
		   ISNULL((SELECT PESONETTO FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCDistinteBasiEsplose.COMPOSTO), 0) AS Peso_Netto_Composto, 
		   ISNULL((SELECT SUPERFICIE FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCDistinteBasiEsplose.COMPOSTO), 0) AS Superficie_Composto, 
		   ISNULL((SELECT CUBATURA FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCDistinteBasiEsplose.COMPOSTO), 0) AS Cubatura_Composto, 
		   ISNULL((SELECT PESONETTO FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCDistinteBasiEsplose.COMPONENTE), 0) AS Peso_Netto_Componente, 
		   ISNULL((SELECT SUPERFICIE FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCDistinteBasiEsplose.COMPONENTE), 0) AS Superficie_Componente, 
		   ISNULL((SELECT CUBATURA FROM ANAGRAFICAARTICOLI WHERE CODICE = FRCDistinteBasiEsplose.COMPONENTE), 0) AS Cubatura_Componente 
	FROM FRCDistinteBasiEsplose

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaDistinteBasiEsplose] TO [Metodo98]
    AS [dbo];

