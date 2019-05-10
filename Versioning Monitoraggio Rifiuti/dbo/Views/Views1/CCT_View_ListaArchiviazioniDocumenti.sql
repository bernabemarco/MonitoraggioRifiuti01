

CREATE VIEW [dbo].[CCT_View_ListaArchiviazioniDocumenti] 
AS
    SELECT
        ISNULL(LA.Progressivo,0) AS PROGRESSIVO,
        TD.PROGRESSIVO AS RIFERIMENTO,
        TD.TIPODOC,
        TD.ESERCIZIO,
        TD.NUMERODOC,
        TD.NUMRIFDOC,
        TD.DATADOC,
        TD.DATARIFDOC,
        TD.CODCLIFOR,
        TD.BIS,
        IsNull(LA.CodArchiviazione,0) AS CodArchiviazione,
        IsNull(LA.StatoArchiviazione,0) AS CodStatoArchiviazione,
        IsNull(SA.Descrizione,'') AS StatoArchiviazione,
        IsNull(LA.StatoInvio,0) AS StatoInvio,
        LA.Datainvio,
        PT.CodTipologia As TipologiaServizi,
        TS.Descrizione As DscTipologiaServizi,
        TS.CliFor
    FROM
        TESTEDOCUMENTI TD
    INNER JOIN
        CCT_PARAMETRI_TIPOLOGIA PT
    ON
            PT.CodTipoDocumento = TD.TIPODOC
        AND TD.ESERCIZIO = (SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = USER_NAME())
    INNER JOIN
        CCT_TIPOLOGIA_SERVIZI TS
    ON
        TS.Codice = PT.CodTipologia
    LEFT JOIN
        CCT_LISTA_ARCHIVIAZIONI LA
    ON
        LA.Riferimento = TD.PROGRESSIVO AND LA.CodTipologia = PT.CodTipologia
    LEFT JOIN
        CCT_STATI_ARCHIVIAZIONE SA
    ON
        SA.Codice = LA.StatoArchiviazione
    WHERE
        TS.VisualizzaParametri = 1


GO
GRANT SELECT
    ON OBJECT::[dbo].[CCT_View_ListaArchiviazioniDocumenti] TO [Metodo98]
    AS [dbo];

