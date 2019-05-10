﻿CREATE VIEW VISTARESOCONTOACQUISTIXVENDITE
AS
SELECT STORICOMAG.PROGRESSIVO, STORICOMAG.QTA1UM, 
    LISTINIARTICOLI.PREZZO, LISTINIARTICOLI.PREZZOEURO, 
    LISTINIARTICOLI.PREZZO * STORICOMAG.QTA1UM AS PREZZOCOMP,
     LISTINIARTICOLI.PREZZOEURO * STORICOMAG.QTA1UM AS PREZZOCOMPEURO,
     LISTINIARTICOLI.UM, STORICOMAG.DATAMOV, 
    STORICOMAG.CODCLIFOR, 
    STORICOMAG.ESERCIZIO AS MAGESERCIZIO, 
    LISTINIARTICOLI.NRLISTINO, STORICOMAG.CODART, 
    TABLISTINI.TP_Tipo
FROM STORICOMAG INNER JOIN
    LISTINIARTICOLI ON 
    STORICOMAG.CODART = LISTINIARTICOLI.CODART INNER JOIN
    TABLISTINI ON 
    LISTINIARTICOLI.NRLISTINO = TABLISTINI.NRLISTINO
WHERE (STORICOMAG.CODCLIFOR LIKE 'C%') AND 
    (TABLISTINI.TP_Tipo = 'A')




GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTARESOCONTOACQUISTIXVENDITE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTARESOCONTOACQUISTIXVENDITE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTARESOCONTOACQUISTIXVENDITE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTARESOCONTOACQUISTIXVENDITE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTARESOCONTOACQUISTIXVENDITE] TO [Metodo98]
    AS [dbo];

