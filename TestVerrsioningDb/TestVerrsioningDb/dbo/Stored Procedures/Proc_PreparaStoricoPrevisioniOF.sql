

CREATE PROCEDURE [dbo].[Proc_PreparaStoricoPrevisioniOF]

AS

BEGIN

declare @year           int 
declare @month          int 
declare @day            int
declare @DataOdierna    Datetime
DECLARE @COUNTPERIODI    INT
DECLARE @COUNTSTAGIONALE INT
DECLARE @ESERCIZIO      INT

declare @counter        int
    
    DELETE FROM TP_PERIODI_CALCOLATI;
    DELETE FROM TP_STAGIONALE_CALCOLATI;
    DELETE FROM TP_STAGIONALE_PREVISIONI
    DELETE FROM TP_STAGIONALE_PREVISIONI_STORICO
    DELETE FROM TP_PERIODI_VENDUTO;
    DELETE FROM TP_PERIODI_ACQUISTATO;
    DELETE FROM TP_PERIODI_ORDINATO;
    DELETE FROM TP_STAGIONALE_VENDUTO;
    DELETE FROM TP_STAGIONALE_VENDUTO_MEDIA;
    DELETE FROM TP_STAGIONALE_ACQUISTATO;
    DELETE FROM TP_STAGIONALE_ORDINATO;

    SELECT @year = YEAR(DATEADD(YY,-3,getdate())), @month = MONTH(GETDATE()), @day = 01;
    SELECT @DataOdierna = CONVERT(datetime, cast(@day as varchar)+'/'+cast(@month as varchar)+'/'+cast(@year as varchar), 103);
    SELECT @counter = 0
    
    WHILE (@DataOdierna < GETDATE())
        BEGIN
            SET @COUNTPERIODI = 0
            SET @COUNTSTAGIONALE = 0
            SET @ESERCIZIO = YEAR(@DATAODIERNA)
            
            SELECT @COUNTPERIODI = COUNT(Periodo) FROM TP_PERIODI_CALCOLATI WHERE Cambiato = 1
            SELECT @COUNTSTAGIONALE = COUNT(Periodo) FROM TP_STAGIONALE_CALCOLATI WHERE Cambiato = 1
            --SELECT @DataOdierna;
            
            SELECT @COUNTPERIODI = (CASE WHEN @COUNTPERIODI >= 36 THEN 0 ELSE @COUNTPERIODI END)
            SELECT @COUNTSTAGIONALE = (CASE WHEN @COUNTSTAGIONALE >= 36 THEN 0 ELSE @COUNTSTAGIONALE END)
            
            /*CALCOLA PERIODI DI OSSERVAZIONE*/
            EXEC PROC_CREA_OF_PERIODIOSSERVAZIONE @DATAODIERNA;
            
            /*CALCOLA STATISTICHE PER PERIODO/ANNO*/
            EXEC PROC_CREA_OF_STATISTICHE_PERIODI @COUNTPERIODI;
            
            /*CALCOLA STATISTICHE PER PERIODO STAGIONALE*/
            EXEC PROC_CREA_OF_STATISTICHE_STAGIONALI @COUNTSTAGIONALE;
            
            /*CALCOLA STORICO GIACENZE*/
            EXEC PROC_CREA_GIACENZE_STORICO;
            
            /*CALCOLA GIACENZE*/
            EXEC PROC_CREA_GIACENZE @ESERCIZIO;
            
            /*PREVISIONI*/
            exec PROC_CREA_OF_PREVISIONI;
            
            SET @DataOdierna = DATEADD(MM,+1,@DataOdierna)
            SET @counter = @counter + 1;
        END
        
    exec PROC_CREA_OF_SOTTOSCORTA;

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Proc_PreparaStoricoPrevisioniOF] TO [Metodo98]
    AS [dbo];

