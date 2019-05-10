

CREATE VIEW VISTA_CONTRATTI_COSTIFICAZIONE
AS
Select TIPIDOC.TIPO
,CASE TIPIDOC.TIPO WHEN 0 THEN 'Passivo' ELSE 'Attivo' END NaturaContratto
,TC.ESERCIZIO
,tc.progressivo
,tc.NUMEROCONTRATTO
,TC.BIS
,tC.DESCRIZIONECONTRATTO
,TC.CODICE
,idcond ID_CONTRIBUTO
,CONTR_Righe.CODICECOSTO CodiceCosto
,Sc.DESCRIZIONE As Descrizione_Costo
,CASE tipocontributo WHEN 'I' THEN 'Incondizionato' ELSE 'Condizionato' END TipoContributo
,CASE tipocontributo WHEN 'I' THEN   GETDATE() ELSE KCON.DADATA  END DaData_Contributo
,CASE tipocontributo WHEN 'I' THEN   GETDATE()  ELSE KCON.ADATA   END AData_Contributo
,CAST(idcond AS VARCHAR(6)) + ' - ' + CASE tipocontributo WHEN 'I' THEN ISNULL(KINCON.DESCRIZIONE,'Nessuna Nota')   ELSE ISNULL(KCON.NOTE,'Nessuna Nota') END DescrizioneContributo
, rd.IDTESTA
, rd.idriga
,Td.TIPODOC
,TD.NUMERODOC
,TD.DATADOC
,TD.CODCLIFOR
,rd.CODART
,ART.DESCRIZIONE DESCRIZIONE_ARTICOLO
, UMP.UM
,UMP.TIPOUM
, (RD.QTAGEST * FC.FATTORE) QTAGEST 
,CONTR_Righe.valorerigapremio Premio
,Incidenzacond + incidenzaincond IncidenzaPremio
,CASE (RD.QTAGEST * FC.FATTORE)  WHEN 0 THEN 0 ELSE CONTR_Righe.valorerigapremio / (RD.QTAGEST * FC.FATTORE)  END AS ValoreUM
,rd.totnettorigaeuro * td.SEGNO totnettorigaeuro
from CONTRATTI_COSTIFICAZIONERIGHE CONTR_Righe
Inner join Righedocumenti RD ON rd.Idtesta = CONTR_Righe.Idtestadoc and rd.idriga = CONTR_Righe.Idrigadoc
INNER JOIN Testedocumenti TD ON Td.PROGRESSIVO = rd.IDTESTA
INNER JOIN TESTE_CONTRATTI TC ON TC.PROGRESSIVO = CONTR_Righe.contratto
INNER JOIN ANAGRAFICAARTICOLI ART ON ART.CODICE = RD.CODART
INNER JOIN ARTICOLIFATTORICONVERSIONE AS FC ON FC.CODART = RD.CODART AND RD.UMGEST = FC.UM1
                               INNER JOIN ARTICOLIUMPREFERITE UMP ON UMP.CODART = RD.CODART
                               INNER JOIN ( 
                                                                              
                                                                              SELECT (SELECT TOP 1 DOCPASSTUTTI FROM CONTRATTI_PARAMETRI) TuttiGliEsercizi, 0 AS TIPO, TIPODOC, DADATA, ADATA FROM CONTRATTI_CONSDOC_pass
                                                                              UNION 
                                                                              SELECT (SELECT TOP 1 DOCPASSTUTTI FROM CONTRATTI_PARAMETRI) TuttiGliEsercizi, 1 AS TIPO, TIPODOC, DADATA, ADATA FROM CONTRATTI_CONSDOC_ATT
                                                                              ) TIPIDOC ON RD.TIPODOC = TIPIDOC.TIPODOC
LEFT OUTER JOIN CONTRATTI_CON KCON   ON KCON.RIFCONTRATTO               = CONTR_Righe.contratto AND KCON.PROGRESSIVO=CONTR_Righe.idcond
LEFT OUTER JOIN CONTRATTI_CL  KINCON ON KINCON.RIFPROGRESSIVO           = CONTR_Righe.contratto AND KINCON.NRRIGA=CONTR_Righe.idcond
LEFT OUTER JOIN CONTRATTI_CONFIGSCONTI SC ON SC.CODICE = CONTR_Righe.CODICECOSTO
Where
   RD.QTAGEST >0 AND FC.UM2 = UMP.UM 
                
AND 
TD.DATADOC BETWEEN
(CASE  TIPIDOC.TuttiGliEsercizi WHEN 1 THEN  CAST(CONVERT(VARCHAR(4),RD.ESERCIZIO) +  Right('0' + CONVERT(VARCHAR(2),MONTH(TIPIDOC.DADATA)),2) + Right('0'+ CONVERT(VARCHAR(2),DAY(TIPIDOC.DADATA)),2) AS DATETIME)  
ELSE 
                TIPIDOC.DADATA
END )
AND 
(CASE  TIPIDOC.TuttiGliEsercizi WHEN 1 THEN  CAST(CONVERT(VARCHAR(4),RD.ESERCIZIO) + Right('0' + CONVERT(VARCHAR(2),MONTH(TIPIDOC.ADATA)),2) + Right('0'+  CONVERT(VARCHAR(2),DAY(TIPIDOC.ADATA)),2) AS DATETIME)  
ELSE 
                TIPIDOC.ADATA
END )


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_CONTRATTI_COSTIFICAZIONE] TO [Metodo98]
    AS [dbo];

