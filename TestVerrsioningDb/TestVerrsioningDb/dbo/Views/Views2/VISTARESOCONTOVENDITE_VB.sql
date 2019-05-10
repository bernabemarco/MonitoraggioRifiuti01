﻿CREATE VIEW VISTARESOCONTOVENDITE_VB
AS
SELECT     STORICOMAG.PROGRESSIVO, STORICOMAG.DATAMOV, STORICOMAG.CODART, ARTICOLIUMPREFERITE1.UM, 
                      STORICOMAG.QTA1UM, STORICOMAG.IMPORTOTOTNETTO AS IMPORSINEIVA, 
                      STORICOMAG.IMPORTOTOTNETTO * (ISNULL(TRATTAMENTOIVA.ALIQUOTA, 0) / 100 + 1) AS IMPORTOTOTNETTO, 
                      STORICOMAG.IMPORTOTOTNETTOEURO AS IMPOREUROSINEIVA, 
                      STORICOMAG.IMPORTOTOTNETTOEURO * (ISNULL(TRATTAMENTOIVA.ALIQUOTA, 0) / 100 + 1) AS IMPORTOTOTNETTOEURO, 
                      TABGRUPPI.CODICE, TABGRUPPI.DESCRIZIONE, TRATTAMENTOIVA.ALIQUOTA, STORICOMAG.CODCLIFOR, 
                      STORICOMAG.ESERCIZIO AS MAGESERCIZIO, ANAGRAFICAARTICOLICOMM.ESERCIZIO AS COMMESERCIZIO, 
                      STORICOMAG.GIACENZA
FROM         ARTICOLIUMPREFERITE ARTICOLIUMPREFERITE1 RIGHT OUTER JOIN
                      STORICOMAG INNER JOIN
                      ANAGRAFICAARTICOLI ON STORICOMAG.CODART = ANAGRAFICAARTICOLI.CODICE INNER JOIN
                      TABGRUPPI ON ANAGRAFICAARTICOLI.GRUPPO = TABGRUPPI.CODICE ON 
                      ARTICOLIUMPREFERITE1.CODART = ANAGRAFICAARTICOLI.CODICE LEFT OUTER JOIN
                      TRATTAMENTOIVA RIGHT OUTER JOIN
                      ANAGRAFICAARTICOLICOMM ON TRATTAMENTOIVA.CODICE = ANAGRAFICAARTICOLICOMM.CODIVA ON 
                      ANAGRAFICAARTICOLI.CODICE = ANAGRAFICAARTICOLICOMM.CODICEART
WHERE     (STORICOMAG.CODCLIFOR LIKE 'C%') AND (ARTICOLIUMPREFERITE1.TIPOUM = 1)


GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTARESOCONTOVENDITE_VB] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTARESOCONTOVENDITE_VB] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTARESOCONTOVENDITE_VB] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTARESOCONTOVENDITE_VB] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTARESOCONTOVENDITE_VB] TO [Metodo98]
    AS [dbo];

