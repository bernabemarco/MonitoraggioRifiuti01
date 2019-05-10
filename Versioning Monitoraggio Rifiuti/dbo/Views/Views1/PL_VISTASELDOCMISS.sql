

CREATE VIEW PL_VISTASELDOCMISS
AS SELECT DISTINCT 

    TabTesteMissioni.PROGRESSIVO  AS PROGRMISS,
    TabTesteMissioni.ESERCIZIO,
    TabTesteMissioni.NUMEROMISS,
    TabTesteMissioni.DESCRMISS,
    TabTesteMissioni.DATAMISS ,
    TabTesteMissioni.CODDEPOSITO,
    TabTesteMissioni.TIPOEMISSLISTE,
    TabTesteMissioni.IMPFILTRO,  
    TabTesteDocumentiMiss.CODCLI AS CODCLIFOR,
    (SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO=TabTesteDocumentiMiss.Codcli) AS DSCCLI,
    Testedocumenti.NUMDESTDIVERSAMERCI,
    Testedocumenti.RAGSOCDDM,
    Testedocumenti.INDIRIZZODDM,
    Testedocumenti.LOCALITADDM,    
    Testedocumenti.PROVINCIADDM,
    Testedocumenti.CAPDDM
FROM  TabTesteMissioni 
      INNER JOIN 
      TabTesteDocumentiMiss ON TabTesteMissioni.PROGRESSIVO=TabTesteDocumentiMiss.RIFPROGRTESTAMISS
      INNER JOIN Testedocumenti ON TabTesteDocumentiMiss.PROGRESSDOC = Testedocumenti.PROGRESSIVO 
      INNER JOIN TabRigheDocumentiMiss ON TabTesteDocumentiMiss.PROGRESSIVO = TabRigheDocumentiMiss.IDTesta And TabRigheDocumentiMiss.PRELEVATOPL = 0 
WHERE
TabTesteMissioni.STATO = 0  AND TabTesteDocumentiMiss.STATODOC = 0


GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_VISTASELDOCMISS] TO [Metodo98]
    AS [dbo];

