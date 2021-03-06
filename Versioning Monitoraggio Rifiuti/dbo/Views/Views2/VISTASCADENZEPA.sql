﻿
-- FINE RM: 6142 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- RM: 5572/6125 ------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW VISTASCADENZEPA AS
SELECT
(SELECT MODPAGPA FROM TABPAGAMENTI WHERE CODICE=CODPAG) AS CONDIZIONIPAG,
(CASE WHEN (SELECT TIPO FROM TIPIEFFETTI WHERE EFFETTO=TIPOEFFETTO)='R' THEN 
   (SELECT CODICEIBAN FROM BANCAAPPCF WHERE CODICE=TABSCADENZE.BANCAAPPOGGIO AND CODCONTO=CODCLIFOR)
 ELSE  
    (SELECT CODICEIBAN FROM ANAGRAFICABANCHE WHERE CODBANCA=BANCAINC) END) AS CODICEIBAN,
(CASE WHEN (SELECT TIPO FROM TIPIEFFETTI WHERE EFFETTO=TIPOEFFETTO)='R' THEN 
   (SELECT CODICEBIC FROM BANCAAPPCF WHERE CODICE=TABSCADENZE.BANCAAPPOGGIO AND CODCONTO=CODCLIFOR)
 ELSE  
   (SELECT CODICEBIC FROM ANAGRAFICABANCHE WHERE CODBANCA=BANCAINC) END) AS CODICEBIC,
(CASE WHEN (SELECT TIPO FROM TIPIEFFETTI WHERE EFFETTO=TIPOEFFETTO)='R' THEN 
   (SELECT RIGHT(ABI,5) FROM BANCAAPPCF WHERE CODICE=TABSCADENZE.BANCAAPPOGGIO AND CODCONTO=CODCLIFOR)
 ELSE  
   (SELECT RIGHT(ABI,5) FROM ANAGRAFICABANCHE WHERE CODBANCA=BANCAINC) END) AS ABI,
(CASE WHEN (SELECT TIPO FROM TIPIEFFETTI WHERE EFFETTO=TIPOEFFETTO)='R' THEN 
   (SELECT RIGHT(CAB,5) FROM BANCAAPPCF WHERE CODICE=TABSCADENZE.BANCAAPPOGGIO AND CODCONTO=CODCLIFOR)
 ELSE  
   (SELECT RIGHT(CAB,5) FROM ANAGRAFICABANCHE WHERE CODBANCA=BANCAINC) END) AS CAB,
(CASE WHEN (SELECT TIPO FROM TIPIEFFETTI WHERE EFFETTO=TIPOEFFETTO)='R' THEN 
   (SELECT BANCAAPPOGGIO FROM BANCAAPPCF WHERE CODICE=TABSCADENZE.BANCAAPPOGGIO AND CODCONTO=CODCLIFOR)
 ELSE
   (SELECT DSCBANCA FROM ANAGRAFICABANCHE WHERE CODBANCA=BANCAINC) END) AS DSCBANCA,
(SELECT MODPAGAMENTOPA FROM TIPIEFFETTI WHERE EFFETTO=TIPOEFFETTO) AS MODPAGAMENTOPA,
(SELECT TOP 1 MODPAGPA FROM FETS_CODIFICHEPAG PAG WHERE PAG.TIPOCICLO IN (0,2)  AND PAG.EFFETTO = TIPOEFFETTO) AS MODPAGB2B,
(SELECT CODPAGB2B FROM TABMODPAGAMENTOPA WHERE CODICE=(SELECT MODPAGAMENTOPA FROM TIPIEFFETTI WHERE EFFETTO=TIPOEFFETTO)) AS CODPAGB2B,
(SELECT TOP 1 TIPOPAGB2B FROM FETS_CODIFICHEPAG PAG WHERE PAG.TIPOCICLO IN (0,2) AND PAG.EFFETTO = TIPOEFFETTO) AS TIPOPAGB2B,
* FROM TABSCADENZE
WHERE NUMSCAD>0
GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASCADENZEPA] TO [Metodo98]
    AS [dbo];

