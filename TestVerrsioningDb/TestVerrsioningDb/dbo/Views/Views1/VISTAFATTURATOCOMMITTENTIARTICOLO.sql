﻿
CREATE VIEW [dbo].[VISTAFATTURATOCOMMITTENTIARTICOLO]
AS
SELECT     TOP (100) PERCENT T.ANNO, T.GRUPPOACQ, D.IDSOCIO, T.CODCLIFOR, CF.DSCCONTO1, T.ARTICOLO, ART.DESCRIZIONE, T.UM, T.MESE, D.VALORE
FROM         dbo.CONTRATTI_TESTECONSUNTIVGRUPPIACQ AS T INNER JOIN
                      dbo.CONTRATTI_DETTCONSUNTIVGRUPPIACQ AS D ON D.RIFPROGRESSIVO = T.PROGRESSIVO INNER JOIN
                      dbo.ANAGRAFICACF AS CF ON CF.CODCONTO = T.CODCLIFOR INNER JOIN
                      dbo.ANAGRAFICAARTICOLI AS ART ON ART.CODICE = T.ARTICOLO
ORDER BY T.ANNO, T.GRUPPOACQ, T.CODCLIFOR, T.MESE, T.ARTICOLO


GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTAFATTURATOCOMMITTENTIARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTAFATTURATOCOMMITTENTIARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTAFATTURATOCOMMITTENTIARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAFATTURATOCOMMITTENTIARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTAFATTURATOCOMMITTENTIARTICOLO] TO [Metodo98]
    AS [dbo];

