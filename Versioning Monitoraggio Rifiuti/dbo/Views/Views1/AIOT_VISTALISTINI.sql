﻿

CREATE VIEW [dbo].[AIOT_VISTALISTINI]
AS

SELECT     
    dbo.LISTINIARTICOLI.CODART, 
    dbo.LISTINIARTICOLI.NRLISTINO, 
    dbo.TABLISTINI.DESCRIZIONE, 
    dbo.LISTINIARTICOLI.UM, 
    dbo.LISTINIARTICOLI.PREZZO, 
    dbo.LISTINIARTICOLI.PREZZOEURO, 
    dbo.TABLISTINI.TP_Tipo, 
    dbo.TABCAMBI.DESCRIZIONE AS VALUTA, 
    dbo.LISTINIARTICOLI.TP_PrezzoPart, 
    dbo.LISTINIARTICOLI.TP_PrezzoPartEuro, 
    dbo.LISTINIARTICOLI.TP_Sconti, 
    dbo.LISTINIARTICOLI.TP_FormulaSct,
    dbo.LISTINIARTICOLI.DATAVALIDITA
FROM         
    dbo.LISTINIARTICOLI 
INNER JOIN
    dbo.TABLISTINI 
ON 
    dbo.LISTINIARTICOLI.NRLISTINO = dbo.TABLISTINI.NRLISTINO 
INNER JOIN
    dbo.TABCAMBI 
ON 
    dbo.TABLISTINI.CODCAMBIO = dbo.TABCAMBI.CODICE


GO
GRANT DELETE
    ON OBJECT::[dbo].[AIOT_VISTALISTINI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AIOT_VISTALISTINI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AIOT_VISTALISTINI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AIOT_VISTALISTINI] TO [Metodo98]
    AS [dbo];
