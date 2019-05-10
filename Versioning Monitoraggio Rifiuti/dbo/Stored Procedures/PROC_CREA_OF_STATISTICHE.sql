﻿

CREATE PROCEDURE [dbo].[PROC_CREA_OF_STATISTICHE]
AS

BEGIN

SET NOCOUNT ON

DECLARE @DATAODIERNA        DATETIME
DECLARE @COUNTPERIODI       INT
DECLARE @COUNTSTAGIONALE    INT
DECLARE @ESERCIZIO          INT

    SET @COUNTPERIODI = 0
    SET @ESERCIZIO = YEAR(GETDATE())
    SET @DATAODIERNA = GETDATE()
    
    SELECT @COUNTPERIODI = COUNT(Periodo) FROM TP_PERIODI_CALCOLATI WHERE Cambiato = 1
    SELECT @COUNTSTAGIONALE = COUNT(Periodo) FROM TP_STAGIONALE_CALCOLATI WHERE Cambiato = 1
    
    SELECT @COUNTPERIODI = (CASE WHEN @COUNTPERIODI >= 36 THEN 0 ELSE @COUNTPERIODI END)
    SELECT @COUNTSTAGIONALE = (CASE WHEN @COUNTSTAGIONALE >= 36 THEN 0 ELSE @COUNTSTAGIONALE END)
    
    /* DEBUG
    SET @DATAODIERNA = DATEADD(mm,-11,GETDATE())
    */
    
    /*CALCOLA PERIODI DI OSSERVAZIONE*/
    EXEC PROC_CREA_OF_PERIODIOSSERVAZIONE @DATAODIERNA;
    
    /*CALCOLA STATISTICHE PER ANNO*/
    EXEC PROC_CREA_OF_STATISTICHE_ANNI @COUNTPERIODI;

    /*CALCOLA STATISTICHE PER PERIODO*/
    EXEC PROC_CREA_OF_STATISTICHE_PERIODI @COUNTPERIODI;
    
    /*CALCOLA STATISTICHE PER PERIODO STAGIONALE*/
    EXEC PROC_CREA_OF_STATISTICHE_STAGIONALI @COUNTSTAGIONALE;
    
    /*CALCOLA STORICO GIACENZE*/
    EXEC PROC_CREA_GIACENZE_STORICO;
    
    /*CALCOLA GIACENZE*/
    EXEC PROC_CREA_GIACENZE @ESERCIZIO;
    
RETURN

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CREA_OF_STATISTICHE] TO [Metodo98]
    AS [dbo];

