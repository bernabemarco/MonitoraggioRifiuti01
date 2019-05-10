

CREATE PROCEDURE PROC_CREA_OF_WINTER_PREVISIONI_STORICHE
--ENCRY--
AS
/*PREVISIONI SULLO STORICO*/
DECLARE @DEPOSITO   AS VARCHAR(10)
DECLARE @ALFA       AS DECIMAL(5,2)
DECLARE @BETA       AS DECIMAL(5,2)
    
    DECLARE DEPOSITI_CURSOR CURSOR FAST_FORWARD FOR 
    SELECT CodDeposito FROM TP_TABMagazzini
    OPEN DEPOSITI_CURSOR
    FETCH NEXT FROM DEPOSITI_CURSOR 
    INTO @DEPOSITO
    
    WHILE @@FETCH_STATUS = 0
        BEGIN
            SET @ALFA = 0.0;
            
            WHILE (@ALFA < 0.6)
                BEGIN
                    SET @ALFA = @ALFA + 0.1;
                    SET @BETA = 0.0;
                            
                    WHILE (@BETA < 0.4)
                        BEGIN
                            SET @BETA = @BETA + 0.1;
                            
                            WITH CTE_Previsione (CodArticolo, CodDeposito, Previsione, Trend, Periodo, Venduto, Mad)
                            AS
                            (
                            --@ALFA * @VENDUTO + (1 - @ALFA) * (@PREVISIONE_OLD + @TREND_OLD)
                            --@BETA * (@PREVISIONE - @PREVISIONE_OLD) + (1 - @BETA) * @TREND_OLD
                                SELECT 
                                    CodArticolo, 
                                    CodDeposito,    
                                    Cast((@ALFA * [1] + (1 - @ALFA) * (0 + 0)) AS Decimal(18,6)) AS Previsione,
                                    Cast((@BETA * ((@ALFA * [1] + (1 - @ALFA) * (0 + 0)) - 0) + (1 - @BETA) * 0) AS Decimal(18,6)) AS Trend,
                                    1 As Periodo,
                                    [1] As Venduto,
                                    Cast(0 AS Decimal(18,6)) As Mad
                                FROM TP_STAGIONALE_VENDUTO AS V
                                WHERE /*CODARTICOLO = '021100#01' AND*/ CodDeposito = @DEPOSITO
                                UNION ALL
                                SELECT 
                                    V.CodArticolo, 
                                    V.CodDeposito, 
                                    Cast((@ALFA * P.Venduto + (1 - @ALFA) * (P.Previsione + P.Trend)) AS Decimal(18,6)) AS Previsione,
                                    Cast((@BETA * (P.Previsione - (@ALFA * P.Venduto + (1 - @ALFA) * (P.Previsione + P.Trend))) + (1 - @BETA) * P.Trend) AS Decimal(18,6)) AS Trend,
                                    (Periodo + 1) As Periodo,
                                    (CASE (Periodo + 1)
                                                                                                  WHEN 36 THEN [1]  WHEN 35 THEN [2]  WHEN 34 THEN [3]  WHEN 33  THEN [4]  WHEN 32  THEN [5]  WHEN 31  THEN [6]  WHEN 30  THEN [7] 
                                            WHEN 29 THEN [8]  WHEN 28 THEN [9]  WHEN 27 THEN [10] WHEN 26 THEN [11] WHEN 25 THEN [12] WHEN 24 THEN [13] WHEN 23  THEN [14] WHEN 22  THEN [15] WHEN 21  THEN [16] WHEN 20  THEN [17]
                                            WHEN 19 THEN [18] WHEN 18 THEN [19] WHEN 17 THEN [20] WHEN 16 THEN [21] WHEN 15 THEN [22] WHEN 14 THEN [23] WHEN 13  THEN [24] WHEN 12  THEN [25] WHEN 11  THEN [26] WHEN 10  THEN [27] 
                                            WHEN  9 THEN [28] WHEN  8 THEN [29] WHEN  7 THEN [30] WHEN  6 THEN [31] WHEN  5 THEN [32] WHEN  4 THEN [33] WHEN  3  THEN [34] WHEN  2  THEN [35] WHEN  1  THEN [36] 
                                        ELSE 0
                                     END) As Venduto,
                                     Cast((P.Mad +(P.Venduto - P.Previsione)) AS Decimal(18,6)) As Mad
                                FROM TP_STAGIONALE_VENDUTO AS V
                                INNER JOIN CTE_Previsione AS P
                                    ON P.CodArticolo = V.CodArticolo AND P.CodDeposito = V.CodDeposito
                                WHERE Periodo <=35
                            )
                            -- Statement that executes the CTE
                            UPDATE TP_STORICO_WINTER
                                SET 
                                    A1B1 = (CASE WHEN @ALFA = 0.1 AND @BETA = 0.1 THEN C.Previsione ELSE TP_STORICO_WINTER.A1B1 END),
                                    A1B2 = (CASE WHEN @ALFA = 0.1 AND @BETA = 0.2 THEN C.Previsione ELSE TP_STORICO_WINTER.A1B2 END),
                                    A1B3 = (CASE WHEN @ALFA = 0.1 AND @BETA = 0.3 THEN C.Previsione ELSE TP_STORICO_WINTER.A1B3 END),
                                    A1B4 = (CASE WHEN @ALFA = 0.1 AND @BETA = 0.4 THEN C.Previsione ELSE TP_STORICO_WINTER.A1B4 END),
                                    A2B1 = (CASE WHEN @ALFA = 0.2 AND @BETA = 0.1 THEN C.Previsione ELSE TP_STORICO_WINTER.A2B1 END),
                                    A2B2 = (CASE WHEN @ALFA = 0.2 AND @BETA = 0.2 THEN C.Previsione ELSE TP_STORICO_WINTER.A2B2 END),
                                    A2B3 = (CASE WHEN @ALFA = 0.2 AND @BETA = 0.3 THEN C.Previsione ELSE TP_STORICO_WINTER.A2B3 END),
                                    A2B4 = (CASE WHEN @ALFA = 0.2 AND @BETA = 0.4 THEN C.Previsione ELSE TP_STORICO_WINTER.A2B4 END),
                                    A3B1 = (CASE WHEN @ALFA = 0.3 AND @BETA = 0.1 THEN C.Previsione ELSE TP_STORICO_WINTER.A3B1 END),
                                    A3B2 = (CASE WHEN @ALFA = 0.3 AND @BETA = 0.2 THEN C.Previsione ELSE TP_STORICO_WINTER.A3B2 END),
                                    A3B3 = (CASE WHEN @ALFA = 0.3 AND @BETA = 0.3 THEN C.Previsione ELSE TP_STORICO_WINTER.A3B3 END),
                                    A3B4 = (CASE WHEN @ALFA = 0.3 AND @BETA = 0.4 THEN C.Previsione ELSE TP_STORICO_WINTER.A3B4 END),
                                    A4B1 = (CASE WHEN @ALFA = 0.4 AND @BETA = 0.1 THEN C.Previsione ELSE TP_STORICO_WINTER.A4B1 END),
                                    A4B2 = (CASE WHEN @ALFA = 0.4 AND @BETA = 0.2 THEN C.Previsione ELSE TP_STORICO_WINTER.A4B2 END),
                                    A4B3 = (CASE WHEN @ALFA = 0.4 AND @BETA = 0.3 THEN C.Previsione ELSE TP_STORICO_WINTER.A4B3 END),
                                    A4B4 = (CASE WHEN @ALFA = 0.4 AND @BETA = 0.4 THEN C.Previsione ELSE TP_STORICO_WINTER.A4B4 END),
                                    A5B1 = (CASE WHEN @ALFA = 0.5 AND @BETA = 0.1 THEN C.Previsione ELSE TP_STORICO_WINTER.A5B1 END),
                                    A5B2 = (CASE WHEN @ALFA = 0.5 AND @BETA = 0.2 THEN C.Previsione ELSE TP_STORICO_WINTER.A5B2 END),
                                    A5B3 = (CASE WHEN @ALFA = 0.5 AND @BETA = 0.3 THEN C.Previsione ELSE TP_STORICO_WINTER.A5B3 END),
                                    A5B4 = (CASE WHEN @ALFA = 0.5 AND @BETA = 0.4 THEN C.Previsione ELSE TP_STORICO_WINTER.A5B4 END),
                                    A6B1 = (CASE WHEN @ALFA = 0.6 AND @BETA = 0.1 THEN C.Previsione ELSE TP_STORICO_WINTER.A6B1 END),
                                    A6B2 = (CASE WHEN @ALFA = 0.6 AND @BETA = 0.2 THEN C.Previsione ELSE TP_STORICO_WINTER.A6B2 END),
                                    A6B3 = (CASE WHEN @ALFA = 0.6 AND @BETA = 0.3 THEN C.Previsione ELSE TP_STORICO_WINTER.A6B3 END),
                                    A6B4 = (CASE WHEN @ALFA = 0.6 AND @BETA = 0.4 THEN C.Previsione ELSE TP_STORICO_WINTER.A6B4 END),
                                    TA1B1 = (CASE WHEN @ALFA = 0.1 AND @BETA = 0.1 THEN C.Trend ELSE TP_STORICO_WINTER.TA1B1 END),
                                    TA1B2 = (CASE WHEN @ALFA = 0.1 AND @BETA = 0.2 THEN C.Trend ELSE TP_STORICO_WINTER.TA1B2 END),
                                    TA1B3 = (CASE WHEN @ALFA = 0.1 AND @BETA = 0.3 THEN C.Trend ELSE TP_STORICO_WINTER.TA1B3 END),
                                    TA1B4 = (CASE WHEN @ALFA = 0.1 AND @BETA = 0.4 THEN C.Trend ELSE TP_STORICO_WINTER.TA1B4 END),
                                    TA2B1 = (CASE WHEN @ALFA = 0.2 AND @BETA = 0.1 THEN C.Trend ELSE TP_STORICO_WINTER.TA2B1 END),
                                    TA2B2 = (CASE WHEN @ALFA = 0.2 AND @BETA = 0.2 THEN C.Trend ELSE TP_STORICO_WINTER.TA2B2 END),
                                    TA2B3 = (CASE WHEN @ALFA = 0.2 AND @BETA = 0.3 THEN C.Trend ELSE TP_STORICO_WINTER.TA2B3 END),
                                    TA2B4 = (CASE WHEN @ALFA = 0.2 AND @BETA = 0.4 THEN C.Trend ELSE TP_STORICO_WINTER.TA2B4 END),
                                    TA3B1 = (CASE WHEN @ALFA = 0.3 AND @BETA = 0.1 THEN C.Trend ELSE TP_STORICO_WINTER.TA3B1 END),
                                    TA3B2 = (CASE WHEN @ALFA = 0.3 AND @BETA = 0.2 THEN C.Trend ELSE TP_STORICO_WINTER.TA3B2 END),
                                    TA3B3 = (CASE WHEN @ALFA = 0.3 AND @BETA = 0.3 THEN C.Trend ELSE TP_STORICO_WINTER.TA3B3 END),
                                    TA3B4 = (CASE WHEN @ALFA = 0.3 AND @BETA = 0.4 THEN C.Trend ELSE TP_STORICO_WINTER.TA3B4 END),
                                    TA4B1 = (CASE WHEN @ALFA = 0.4 AND @BETA = 0.1 THEN C.Trend ELSE TP_STORICO_WINTER.TA4B1 END),
                                    TA4B2 = (CASE WHEN @ALFA = 0.4 AND @BETA = 0.2 THEN C.Trend ELSE TP_STORICO_WINTER.TA4B2 END),
                                    TA4B3 = (CASE WHEN @ALFA = 0.4 AND @BETA = 0.3 THEN C.Trend ELSE TP_STORICO_WINTER.TA4B3 END),
                                    TA4B4 = (CASE WHEN @ALFA = 0.4 AND @BETA = 0.4 THEN C.Trend ELSE TP_STORICO_WINTER.TA4B4 END),
                                    TA5B1 = (CASE WHEN @ALFA = 0.5 AND @BETA = 0.1 THEN C.Trend ELSE TP_STORICO_WINTER.TA5B1 END),
                                    TA5B2 = (CASE WHEN @ALFA = 0.5 AND @BETA = 0.2 THEN C.Trend ELSE TP_STORICO_WINTER.TA5B2 END),
                                    TA5B3 = (CASE WHEN @ALFA = 0.5 AND @BETA = 0.3 THEN C.Trend ELSE TP_STORICO_WINTER.TA5B3 END),
                                    TA5B4 = (CASE WHEN @ALFA = 0.5 AND @BETA = 0.4 THEN C.Trend ELSE TP_STORICO_WINTER.TA5B4 END),
                                    TA6B1 = (CASE WHEN @ALFA = 0.6 AND @BETA = 0.1 THEN C.Trend ELSE TP_STORICO_WINTER.TA6B1 END),
                                    TA6B2 = (CASE WHEN @ALFA = 0.6 AND @BETA = 0.2 THEN C.Trend ELSE TP_STORICO_WINTER.TA6B2 END),
                                    TA6B3 = (CASE WHEN @ALFA = 0.6 AND @BETA = 0.3 THEN C.Trend ELSE TP_STORICO_WINTER.TA6B3 END),
                                    TA6B4 = (CASE WHEN @ALFA = 0.6 AND @BETA = 0.4 THEN C.Trend ELSE TP_STORICO_WINTER.TA6B4 END),
                                    MA1B1 = (CASE WHEN @ALFA = 0.1 AND @BETA = 0.1 THEN C.Mad ELSE TP_STORICO_WINTER.MA1B1 END),
                                    MA1B2 = (CASE WHEN @ALFA = 0.1 AND @BETA = 0.2 THEN C.Mad ELSE TP_STORICO_WINTER.MA1B2 END),
                                    MA1B3 = (CASE WHEN @ALFA = 0.1 AND @BETA = 0.3 THEN C.Mad ELSE TP_STORICO_WINTER.MA1B3 END),
                                    MA1B4 = (CASE WHEN @ALFA = 0.1 AND @BETA = 0.4 THEN C.Mad ELSE TP_STORICO_WINTER.MA1B4 END),
                                    MA2B1 = (CASE WHEN @ALFA = 0.2 AND @BETA = 0.1 THEN C.Mad ELSE TP_STORICO_WINTER.MA2B1 END),
                                    MA2B2 = (CASE WHEN @ALFA = 0.2 AND @BETA = 0.2 THEN C.Mad ELSE TP_STORICO_WINTER.MA2B2 END),
                                    MA2B3 = (CASE WHEN @ALFA = 0.2 AND @BETA = 0.3 THEN C.Mad ELSE TP_STORICO_WINTER.MA2B3 END),
                                    MA2B4 = (CASE WHEN @ALFA = 0.2 AND @BETA = 0.4 THEN C.Mad ELSE TP_STORICO_WINTER.MA2B4 END),
                                    MA3B1 = (CASE WHEN @ALFA = 0.3 AND @BETA = 0.1 THEN C.Mad ELSE TP_STORICO_WINTER.MA3B1 END),
                                    MA3B2 = (CASE WHEN @ALFA = 0.3 AND @BETA = 0.2 THEN C.Mad ELSE TP_STORICO_WINTER.MA3B2 END),
                                    MA3B3 = (CASE WHEN @ALFA = 0.3 AND @BETA = 0.3 THEN C.Mad ELSE TP_STORICO_WINTER.MA3B3 END),
                                    MA3B4 = (CASE WHEN @ALFA = 0.3 AND @BETA = 0.4 THEN C.Mad ELSE TP_STORICO_WINTER.MA3B4 END),
                                    MA4B1 = (CASE WHEN @ALFA = 0.4 AND @BETA = 0.1 THEN C.Mad ELSE TP_STORICO_WINTER.MA4B1 END),
                                    MA4B2 = (CASE WHEN @ALFA = 0.4 AND @BETA = 0.2 THEN C.Mad ELSE TP_STORICO_WINTER.MA4B2 END),
                                    MA4B3 = (CASE WHEN @ALFA = 0.4 AND @BETA = 0.3 THEN C.Mad ELSE TP_STORICO_WINTER.MA4B3 END),
                                    MA4B4 = (CASE WHEN @ALFA = 0.4 AND @BETA = 0.4 THEN C.Mad ELSE TP_STORICO_WINTER.MA4B4 END),
                                    MA5B1 = (CASE WHEN @ALFA = 0.5 AND @BETA = 0.1 THEN C.Mad ELSE TP_STORICO_WINTER.MA5B1 END),
                                    MA5B2 = (CASE WHEN @ALFA = 0.5 AND @BETA = 0.2 THEN C.Mad ELSE TP_STORICO_WINTER.MA5B2 END),
                                    MA5B3 = (CASE WHEN @ALFA = 0.5 AND @BETA = 0.3 THEN C.Mad ELSE TP_STORICO_WINTER.MA5B3 END),
                                    MA5B4 = (CASE WHEN @ALFA = 0.5 AND @BETA = 0.4 THEN C.Mad ELSE TP_STORICO_WINTER.MA5B4 END),
                                    MA6B1 = (CASE WHEN @ALFA = 0.6 AND @BETA = 0.1 THEN C.Mad ELSE TP_STORICO_WINTER.MA6B1 END),
                                    MA6B2 = (CASE WHEN @ALFA = 0.6 AND @BETA = 0.2 THEN C.Mad ELSE TP_STORICO_WINTER.MA6B2 END),
                                    MA6B3 = (CASE WHEN @ALFA = 0.6 AND @BETA = 0.3 THEN C.Mad ELSE TP_STORICO_WINTER.MA6B3 END),
                                    MA6B4 = (CASE WHEN @ALFA = 0.6 AND @BETA = 0.4 THEN C.Mad ELSE TP_STORICO_WINTER.MA6B4 END),
                                    UtenteModifica = User_Name(),
                                    DataModifica = GetDate()
                            FROM TP_STORICO_WINTER
                            INNER JOIN
                            (
                                SELECT 
                                    CodArticolo, 
                                    CodDeposito, 
                                    Previsione,
                                    Trend, 
                                    Periodo, 
                                    Venduto, 
                                    Mad
                                FROM CTE_Previsione
                                WHERE Periodo = 36
                            ) C
                            ON
                                TP_STORICO_WINTER.CodArticolo = C.CodArticolo AND
                                TP_STORICO_WINTER.CodDeposito = C.CodDeposito; 

                        END
                END
                
            FETCH NEXT FROM DEPOSITI_CURSOR 
            INTO @DEPOSITO
        END

    CLOSE DEPOSITI_CURSOR
    DEALLOCATE DEPOSITI_CURSOR

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CREA_OF_WINTER_PREVISIONI_STORICHE] TO [Metodo98]
    AS [dbo];

