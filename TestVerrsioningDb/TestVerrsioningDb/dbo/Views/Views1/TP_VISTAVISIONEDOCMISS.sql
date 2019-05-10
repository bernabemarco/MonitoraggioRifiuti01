
CREATE VIEW TP_VISTAVISIONEDOCMISS
AS SELECT 

TabRigheDocumentiMiss.IDTESTA,
TabRigheDocumentiMiss.IDRIGA,
TabTesteMissioni.NUMEROMISS,
TabTesteMissioni.Stato,
TabTesteMissioni.ESERCIZIO,
TabTesteMissioni.DataMiss,
TabTesteMissioni.CODDEPOSITO,
TabTesteDocumentiMiss.Codcli,
(SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO=TabTesteDocumentiMiss.Codcli) AS DSCCLI,
TabTesteDocumentiMiss.TIPODOC,
TabTesteDocumentiMiss.NumeroDoc,
TabTesteDocumentiMiss.DataDoc,
TabRigheDocumentiMiss.CODART,
TabRigheDocumentiMiss.DESCART,
TabRigheDocumentiMiss.UM,
TabRigheDocumentiMiss.QTACONSEG,
TabRigheDocumentiMiss.NRRIFPARTITA,
TabRigheDocumentiMiss.DATACONSEGNA

FROM  TabTesteMissioni 
INNER JOIN TabTesteDocumentiMiss 
ON  
TabTesteMissioni.PROGRESSIVO=TabTesteDocumentiMiss.RIFPROGRTESTAMISS
INNER JOIN TabRigheDocumentiMiss
ON TabTesteDocumentiMiss.PROGRESSIVO=TabRigheDocumentiMiss.IDTESTA


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VISTAVISIONEDOCMISS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VISTAVISIONEDOCMISS] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_VISTAVISIONEDOCMISS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTAVISIONEDOCMISS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VISTAVISIONEDOCMISS] TO [Metodo98]
    AS [dbo];

