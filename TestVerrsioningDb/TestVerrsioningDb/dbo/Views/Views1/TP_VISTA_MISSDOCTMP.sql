
CREATE VIEW TP_VISTA_MISSDOCTMP AS 

SELECT  TabTesteMissioni.ESERCIZIO, 
        TabTesteMissioni.NUMEROMISS, 
        TabTesteMissioni.DATAMISS,  
        TabTesteMissioni.DESCRMISS, 
        TabTesteMissioni.STATO,  
        TabTesteMissioni.DATAEVAS,  
        TabTesteMissioni.EVADFINODATA, 
        TabTesteMissioni.CODDEPOSITO,
        TMPTabTesteDocumentiMiss.* , 
        (CAST(ISNULL(TMPTabTesteDocumentiMiss.CODICESPED,0) AS VARCHAR(10))  + ' -- ' + ISNULL(TABSPEDIZ.RAGIONESOCIALE,' ')) AS SPED  
FROM TMPTabTesteDocumentiMiss 
INNER JOIN TabTesteMissioni ON 
TMPTabTesteDocumentiMiss.RIFPROGRTESTAMISS = TabTesteMissioni.PROGRESSIVO 
LEFT OUTER JOIN TABSPEDIZ  ON
TABSPEDIZ.CODICE = TMPTabTesteDocumentiMiss.CODICESPED


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTA_MISSDOCTMP] TO [Metodo98]
    AS [dbo];

