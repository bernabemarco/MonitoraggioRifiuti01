﻿

CREATE VIEW DF_AC_ULTIMI5PREZZI
AS

/*ULTIMI 5 PREZZI*/
WITH ULTIMI5PREZZI AS
(
    SELECT 
        ROW_NUMBER() OVER (PARTITION BY VISTADOCUMENTIBASE.CODART,VISTADOCUMENTIBASE.CODCLIFOR,VISTADOCUMENTIBASE.TIPODOC ORDER BY DATADOC DESC) AS 'ROWNUMBER', 
        VISTADOCUMENTIBASE.* 
    FROM  
        VISTADOCUMENTIBASE 
    WHERE  
        VISTADOCUMENTIBASE.ESERCIZIO IN(SELECT CODICE FROM TABESERCIZI) AND 
        VISTADOCUMENTIBASE.TIPORIGA = 'N' AND 
        VISTADOCUMENTIBASE.SCONTORIGA <> 100 AND 
        VISTADOCUMENTIBASE.TIPODOC IN(SELECT CODICE FROM DOCULTIMI5PREZZI)
)   
SELECT 
    ULTIMI5PREZZI.IDTESTA,
    ULTIMI5PREZZI.PROGRIGADOC AS IDRIGA, 
    ULTIMI5PREZZI.ESERCIZIO,
    ULTIMI5PREZZI.NUMERODOC,    
    ULTIMI5PREZZI.NUMRIFDOC,
    ULTIMI5PREZZI.CODCLIFOR AS CODCONTO,   
    LEFT(ULTIMI5PREZZI.CODCLIFOR,1) AS TIPO,
    ULTIMI5PREZZI.CODART AS CODARTICOLO,    
    ULTIMI5PREZZI.DESCRIZIONEART,
    ULTIMI5PREZZI.UMGEST,
    ISNULL(ULTIMI5PREZZI.NUMLISTINO,0) AS CODLISTINO,  
    ISNULL((SELECT LISTINIARTICOLI.PREZZOEURO FROM LISTINIARTICOLI WHERE LISTINIARTICOLI.CODART = ULTIMI5PREZZI.CODART AND LISTINIARTICOLI.UM = ULTIMI5PREZZI.UMPREZZO AND LISTINIARTICOLI.NRLISTINO = ULTIMI5PREZZI.NUMLISTINO),0) AS PREZZOLST,   
    ULTIMI5PREZZI.QTAGEST,
    ULTIMI5PREZZI.DATADOC,    
    ULTIMI5PREZZI.SCONTIESTESI AS SCONTOESTESO,
    ULTIMI5PREZZI.TIPODOC,   
    ULTIMI5PREZZI.PREZZOUNITLORDO,
    ULTIMI5PREZZI.PREZZOUNITNETTO,    
    ULTIMI5PREZZI.PREZZOUNITLORDOEURO,
    ULTIMI5PREZZI.PREZZOUNITNETTOEURO,    
    ULTIMI5PREZZI.PROVVAG1,
    ULTIMI5PREZZI.PROVVAG2,
    ULTIMI5PREZZI.PROVVAG3,
    ISNULL(TP_EXTRARIGHEDOC.DESCPROMOZIONE,'') AS DESCRIZIONEPROMOZIONE 
FROM ULTIMI5PREZZI 
LEFT JOIN TP_EXTRARIGHEDOC ON TP_EXTRARIGHEDOC.IDTESTA = ULTIMI5PREZZI.IDTESTA AND TP_EXTRARIGHEDOC.IDRIGA = ULTIMI5PREZZI.PROGRIGADOC 
LEFT JOIN [LISTINIARTICOLI] L ON L.CODART = ULTIMI5PREZZI.CODART AND L.UM = ULTIMI5PREZZI.UMPREZZO AND L.NRLISTINO = ULTIMI5PREZZI.NUMLISTINO
WHERE ULTIMI5PREZZI.ROWNUMBER <= 5 
--ORDER BY ULTIMI5PREZZI.CODART,ULTIMI5PREZZI.IDTESTA,ULTIMI5PREZZI.PROGRIGADOC

GO
GRANT SELECT
    ON OBJECT::[dbo].[DF_AC_ULTIMI5PREZZI] TO [Metodo98]
    AS [dbo];

