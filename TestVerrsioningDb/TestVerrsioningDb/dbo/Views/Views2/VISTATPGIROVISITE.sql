﻿CREATE VIEW VISTATPGIROVISITE AS
SELECT   TP_GIROVISITE_TESTA.CODAGENTE, ANAGRAFICAAGENTI.DSCAGENTE, TP_GIROVISITE_RIGHE.CODCONTO, 
	 ANAGRAFICACF.DSCCONTO1, TP_GIROVISITE_RIGHE.OrarioPMAM, TP_GIROVISITE_RIGHE.Periodicita, 
	 TP_GIROVISITE_RIGHE.OrarioVisite, TP_GIROVISITE_RIGHE.Giorno
FROM    TP_GIROVISITE_TESTA 
	INNER JOIN TP_GIROVISITE_RIGHE ON TP_GIROVISITE_TESTA.Progressivo = TP_GIROVISITE_RIGHE.RIFProgressivo 
	INNER JOIN ANAGRAFICAAGENTI ON TP_GIROVISITE_TESTA.CODAGENTE = ANAGRAFICAAGENTI.CODAGENTE
	INNER JOIN ANAGRAFICACF ON TP_GIROVISITE_RIGHE.CODCONTO = ANAGRAFICACF.CODCONTO


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATPGIROVISITE] TO [Metodo98]
    AS [dbo];

