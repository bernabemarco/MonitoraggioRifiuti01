

CREATE VIEW [dbo].[CCT_View_VerificaStati]
AS
    SELECT 
        ISNULL(LA.Progressivo,0) AS PROGRESSIVO,
        LA.RIFERIMENTO AS RIFERIMENTO,
		(CASE WHEN FAC.PROGRARCHIVIAZIONE IS NULL THEN TS.Descrizione + ' - ' + CONVERT(Varchar(50),TD.DataDoc,103) ELSE FAC.RifOperazione END) AS DESCRIZIONE,
        TD.TIPODOC,
        TD.ESERCIZIO,
        TD.NUMERODOC,
        TD.NUMRIFDOC,
        TD.DATADOC,
        TD.DATARIFDOC,
        TD.CODCLIFOR,
        TD.BIS,
        IsNull(LA.StatoArchiviazione,0) AS CodStatoArchiviazione,
        IsNull(SA.Descrizione,'') AS StatoArchiviazione,
        IsNull(LA.StatoInvio,0) AS StatoInvio,
        LA.Datainvio,
        LA.CodTipologia As TipologiaServizi,
        TS.Descrizione As DscTipologiaServizi,
        ISNULL(LA.CodArchiviazione,0) As CodArchiviazione
    FROM 
        CCT_LISTA_ARCHIVIAZIONI LA
	LEFT JOIN
		CCT_FILES_ARCHIVIAZIONI_CONT FAC
	ON
		FAC.PROGRARCHIVIAZIONE = LA.Progressivo
    LEFT JOIN 
        TESTEDOCUMENTI TD
    ON
            LA.Riferimento = TD.PROGRESSIVO 
        AND TD.ESERCIZIO = (SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = USER_NAME())
    LEFT JOIN
        CCT_STATI_ARCHIVIAZIONE SA
    ON
        SA.Codice = LA.StatoArchiviazione
    LEFT JOIN
        CCT_TIPOLOGIA_SERVIZI TS
    ON
        LA.CodTipologia = TS.Codice


GO
GRANT SELECT
    ON OBJECT::[dbo].[CCT_View_VerificaStati] TO [Metodo98]
    AS [dbo];

