CREATE VIEW VISTASTAMPACAUSCONT AS SELECT TC.*,RC.MASTRO,RC.CONTO,RC.PROGRIGHE,RC.RIPETIZIONE,RC.SEGNO,RC.TIPODESCRIZIONE,
(SELECT Descrizione FROM TipoRegistroIva WHERE Codice=NrRegistro) AS DscRegistro,
(SELECT Descrizione FROM TipoRegistroIva WHERE Codice=NrGiornale) AS DscGiornale,
(SELECT Descrizione FROM TabContatori WHERE Codice=ContNAccr AND Esercizio=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=CAST(USER_NAME() AS VARCHAR(25)))) AS DscContatore,
(SELECT Descrizione FROM TabCausaliCes WHERE Codice=CodCausMovCes) AS DscCausCes,
(SELECT Descrizione FROM CausaliContabili WHERE CausaliContabili.CodiceCausale=CausCollegata) AS DscCausColleg,
(SELECT Descrizione FROM TabMastri WHERE Codice=RC.Mastro) AS DscMastro,
(SELECT DscConto1 FROM AnagraficaCF WHERE CodConto=RC.Conto) AS DscContoCF,
(SELECT DscConto1 FROM AnagraficaGenerici WHERE CodConto=RC.Conto) AS DscContoGen
FROM CausaliContabili TC, CausaliContabiliRighe RC
WHERE TC.CodiceCausale=RC.CodiceCausale


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASTAMPACAUSCONT] TO [Metodo98]
    AS [dbo];

