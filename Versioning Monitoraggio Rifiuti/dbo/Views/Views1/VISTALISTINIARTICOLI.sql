﻿CREATE VIEW VISTALISTINIARTICOLI AS
    select TABLISTINI.NRLISTINO,
    TABLISTINI.DESCRIZIONE,
    TABLISTINI.CODCAMBIO,
    TABLISTINI.VINCOLAUM,
    TABCAMBI.DIVISA,
    TABCAMBI.DESCRIZIONE as DESCRDIVISA,
    LISTINIARTICOLI.CODART,
    LISTINIARTICOLI.UM,
    LISTINIARTICOLI.PREZZO,
    LISTINIARTICOLI.PREZZOEURO
    from TABLISTINI,LISTINIARTICOLI,TABCAMBI
    where TABLISTINI.CODCAMBIO=TABCAMBI.CODICE
    and LISTINIARTICOLI.NRLISTINO=TABLISTINI.NRLISTINO

GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTALISTINIARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTALISTINIARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTALISTINIARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTALISTINIARTICOLI] TO [Metodo98]
    AS [dbo];

