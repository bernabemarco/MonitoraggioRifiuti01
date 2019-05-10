

CREATE PROCEDURE [dbo].[PROC_CREA_DATARIORDINOxBUYER] (@DATAI nVarchar(8),
                                                        @DATAF nVarchar(8))
AS

BEGIN

DECLARE @DATAINIZIO      DATETIME
DECLARE @DATAFINE        DATETIME
DECLARE @DataCorrente    Datetime

DECLARE @CodFornitore    Varchar(7)
DECLARE @CodDeposito     Varchar(10)
DECLARE @CodTipo         smallint
DECLARE @Giorno          smallint
DECLARE @Settimana       smallint
    
    SET DATEFIRST 1;
    /*PROCEDO CON L'AGGIORNAMENTO DEI VALORI*/
    DECLARE PERIODI_CUR CURSOR FAST_FORWARD FOR
        SELECT
            C.CODDEPOSITO,
            C.CODFORNITORE,
            ISNULL(CP.TIPO,0) AS TIPO,
            COALESCE(
                        (CASE WHEN D1 = 1 THEN 1 ELSE NULL END),
                        (CASE WHEN D2 = 1 THEN 2 ELSE NULL END),
                        (CASE WHEN D3 = 1 THEN 3 ELSE NULL END),
                        (CASE WHEN D4 = 1 THEN 4 ELSE NULL END),
                        (CASE WHEN D5 = 1 THEN 5 ELSE NULL END),
                        (CASE WHEN D6 = 1 THEN 6 ELSE NULL END),
                        (CASE WHEN D7 = 1 THEN 7 ELSE NULL END),
                        1
                    ) As D,
            CP.S
        FROM
            TP_CONFIGURAZIONIPUNTOFISSORIORDINO C
        LEFT JOIN
            TP_CONFIGURAZIONIPUNTOFISSORIORDINO_PERIODI CP
        ON
            CP.CODDEPOSITO = C.CODDEPOSITO AND CP.CODFORNITORE = C.CODFORNITORE
        --WHERE C.CODFORNITORE = 'F    23'
    OPEN PERIODI_CUR
    FETCH NEXT FROM PERIODI_CUR
        INTO @CodDeposito,@CodFornitore,@CodTipo,@Giorno,@Settimana

        WHILE @@FETCH_STATUS = 0
            BEGIN
                SET @DATAINIZIO = @DATAI
                SET @DATAFINE    = @DATAF

                DELETE FROM TP_CONFIGURAZIONIPUNTOFISSORIORDINO_RIORDINO WHERE CODFORNITORE = @CodFornitore AND CODDEPOSITO = @CodDeposito;

                if @CodTipo = 0
                    begin
                        /*By week*/
                        WITH CTE AS
                        (
                            SELECT @DATAINIZIO AS cte_start_date
                            UNION ALL
                            SELECT DATEADD(WEEK, 1, cte_start_date)
                            FROM CTE
                            WHERE DATEADD(WEEK, 1, cte_start_date) <= @DATAFINE
                        )
                        INSERT INTO TP_CONFIGURAZIONIPUNTOFISSORIORDINO_RIORDINO(CODDEPOSITO,CODFORNITORE,DATARIORDINO,UTENTEMODIFICA,DATAMODIFICA)
                        SELECT DISTINCT
                            @CodDeposito As Deposito,
                            @CodFornitore As Fornitore,
                            DATEADD(WW, DATEDIFF(WW,@Giorno, cte_start_date),@Giorno) As DataRiordino,
                            User_Name() As UtenteModifica,
                            GetDate() As DataModifica
                        FROM
                            CTE
                        option (maxrecursion 0);
                    end

                if @CodTipo = 1
                    Begin
                        /*By week month*/
                        WITH CTE AS
                        (
                            SELECT @DATAINIZIO AS cte_start_date
                            UNION ALL
                            SELECT DATEADD(WEEK, 1, cte_start_date)
                            FROM CTE
                            WHERE DATEADD(WEEK, 1, cte_start_date) <= @DATAFINE
                        )
                        INSERT INTO TP_CONFIGURAZIONIPUNTOFISSORIORDINO_RIORDINO(CODDEPOSITO,CODFORNITORE,DATARIORDINO,UTENTEMODIFICA,DATAMODIFICA)
                        SELECT DISTINCT
                            @CodDeposito As Deposito,
                            @CodFornitore As Fornitore,
                            DATEADD(WW, DATEDIFF(WW,@Giorno, cte_start_date),@Giorno) As Data,
                            User_Name() As UtenteModifica,
                            GetDate() As DataModifica
                        FROM
                            CTE
                        WHERE
                            ((DAY(DATEADD(WW, DATEDIFF(WW,@Giorno, cte_start_date),@Giorno)) + (DATEPART(dw, DATEADD (MONTH, DATEDIFF (MONTH, 0, DATEADD(WW, DATEDIFF(WW,@Giorno, cte_start_date),@Giorno)), 0)) -1) -1)/7 + 1) = @Settimana
                        option (maxrecursion 0);
                    End


                FETCH NEXT FROM PERIODI_CUR
                INTO @CodDeposito,@CodFornitore,@CodTipo,@Giorno,@Settimana
            END

    CLOSE PERIODI_CUR
    DEALLOCATE PERIODI_CUR

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CREA_DATARIORDINOxBUYER] TO [Metodo98]
    AS [dbo];

