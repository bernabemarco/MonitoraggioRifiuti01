

CREATE PROCEDURE PROC_CREA_OF_EXPONENTIALSMOOTHING_PREVISIONI_FUTURE
--ENCRY--
AS
/*Previsioni Future*/   
WITH CTE_Previsione (CodArticolo, CodDeposito, Alfa,Beta,Previsione,Trend, Periodo)
AS
(
--@ALFA * @VENDUTO + (1 - @ALFA) * (@PREVISIONE_OLD + @TREND_OLD)
--@BETA * (@PREVISIONE - @PREVISIONE_OLD) + (1 - @BETA) * @TREND_OLD
        SELECT
            CodArticolo,
            CodDeposito,
            Alfa,
            Beta,
            Previsione,
            Trend,
            Periodo
        FROM
        (
            SELECT
                ES.CodArticolo,
                ES.CodDeposito,
                ES.ALFA AS Alfa,
                ES.BETA AS Beta,
                (
                    CASE WHEN ES.ALFA = 0.1 AND ES.BETA = 0.1 THEN ES.A1B1
                         WHEN ES.ALFA = 0.1 AND ES.BETA = 0.2 THEN ES.A1B2
                         WHEN ES.ALFA = 0.1 AND ES.BETA = 0.3 THEN ES.A1B3
                         WHEN ES.ALFA = 0.1 AND ES.BETA = 0.4 THEN ES.A1B4
                         WHEN ES.ALFA = 0.2 AND ES.BETA = 0.1 THEN ES.A2B1
                         WHEN ES.ALFA = 0.2 AND ES.BETA = 0.2 THEN ES.A2B2
                         WHEN ES.ALFA = 0.2 AND ES.BETA = 0.3 THEN ES.A2B3
                         WHEN ES.ALFA = 0.2 AND ES.BETA = 0.4 THEN ES.A2B4
                         WHEN ES.ALFA = 0.3 AND ES.BETA = 0.1 THEN ES.A3B1
                         WHEN ES.ALFA = 0.3 AND ES.BETA = 0.2 THEN ES.A3B2
                         WHEN ES.ALFA = 0.3 AND ES.BETA = 0.3 THEN ES.A3B3
                         WHEN ES.ALFA = 0.3 AND ES.BETA = 0.4 THEN ES.A3B4
                         WHEN ES.ALFA = 0.4 AND ES.BETA = 0.1 THEN ES.A4B1
                         WHEN ES.ALFA = 0.4 AND ES.BETA = 0.2 THEN ES.A4B2
                         WHEN ES.ALFA = 0.4 AND ES.BETA = 0.3 THEN ES.A4B3
                         WHEN ES.ALFA = 0.4 AND ES.BETA = 0.4 THEN ES.A4B4
                         WHEN ES.ALFA = 0.5 AND ES.BETA = 0.1 THEN ES.A5B1
                         WHEN ES.ALFA = 0.5 AND ES.BETA = 0.2 THEN ES.A5B2
                         WHEN ES.ALFA = 0.5 AND ES.BETA = 0.3 THEN ES.A5B3
                         WHEN ES.ALFA = 0.5 AND ES.BETA = 0.4 THEN ES.A5B4
                         WHEN ES.ALFA = 0.6 AND ES.BETA = 0.1 THEN ES.A6B1
                         WHEN ES.ALFA = 0.6 AND ES.BETA = 0.2 THEN ES.A6B2
                         WHEN ES.ALFA = 0.6 AND ES.BETA = 0.3 THEN ES.A6B3
                         WHEN ES.ALFA = 0.6 AND ES.BETA = 0.4 THEN ES.A6B4
                         ELSE 0
                    END
                ) AS Previsione,
                (
                    CASE WHEN ES.ALFA = 0.1 AND ES.BETA = 0.1 THEN ES.TA1B1
                         WHEN ES.ALFA = 0.1 AND ES.BETA = 0.2 THEN ES.TA1B2
                         WHEN ES.ALFA = 0.1 AND ES.BETA = 0.3 THEN ES.TA1B3
                         WHEN ES.ALFA = 0.1 AND ES.BETA = 0.4 THEN ES.TA1B4
                         WHEN ES.ALFA = 0.2 AND ES.BETA = 0.1 THEN ES.TA2B1
                         WHEN ES.ALFA = 0.2 AND ES.BETA = 0.2 THEN ES.TA2B2
                         WHEN ES.ALFA = 0.2 AND ES.BETA = 0.3 THEN ES.TA2B3
                         WHEN ES.ALFA = 0.2 AND ES.BETA = 0.4 THEN ES.TA2B4
                         WHEN ES.ALFA = 0.3 AND ES.BETA = 0.1 THEN ES.TA3B1
                         WHEN ES.ALFA = 0.3 AND ES.BETA = 0.2 THEN ES.TA3B2
                         WHEN ES.ALFA = 0.3 AND ES.BETA = 0.3 THEN ES.TA3B3
                         WHEN ES.ALFA = 0.3 AND ES.BETA = 0.4 THEN ES.TA3B4
                         WHEN ES.ALFA = 0.4 AND ES.BETA = 0.1 THEN ES.TA4B1
                         WHEN ES.ALFA = 0.4 AND ES.BETA = 0.2 THEN ES.TA4B2
                         WHEN ES.ALFA = 0.4 AND ES.BETA = 0.3 THEN ES.TA4B3
                         WHEN ES.ALFA = 0.4 AND ES.BETA = 0.4 THEN ES.TA4B4
                         WHEN ES.ALFA = 0.5 AND ES.BETA = 0.1 THEN ES.TA5B1
                         WHEN ES.ALFA = 0.5 AND ES.BETA = 0.2 THEN ES.TA5B2
                         WHEN ES.ALFA = 0.5 AND ES.BETA = 0.3 THEN ES.TA5B3
                         WHEN ES.ALFA = 0.5 AND ES.BETA = 0.4 THEN ES.TA5B4
                         WHEN ES.ALFA = 0.6 AND ES.BETA = 0.1 THEN ES.TA6B1
                         WHEN ES.ALFA = 0.6 AND ES.BETA = 0.2 THEN ES.TA6B2
                         WHEN ES.ALFA = 0.6 AND ES.BETA = 0.3 THEN ES.TA6B3
                         WHEN ES.ALFA = 0.6 AND ES.BETA = 0.4 THEN ES.TA6B4
                         ELSE 0
                    END
                ) AS Trend,
                1 As Periodo
            FROM
                TP_STORICO_EXPONENTIALSMOOTHING ES
        ) PF
    UNION ALL
    SELECT 
        ES.CodArticolo, 
        ES.CodDeposito,
        P.Alfa,
        P.Beta, 
        Cast((P.Alfa * P.Previsione + (1 - P.Alfa) * (P.Previsione + P.Trend)) AS Decimal(18,6)) AS Previsione,
        Cast((P.Beta * (P.Previsione - (P.Alfa * P.Previsione + (1 - P.Alfa) * (P.Previsione + P.Trend))) + (1 - P.Beta) * P.Trend) AS Decimal(18,6)) AS Trend,
        (Periodo + 1) As Periodo
    FROM TP_STORICO_EXPONENTIALSMOOTHING AS ES
    INNER JOIN CTE_Previsione AS P
        ON P.CodArticolo = ES.CodArticolo AND P.CodDeposito = ES.CodDeposito
    WHERE Periodo <=11
)
-- Statement that executes the CTE
UPDATE TP_STAGIONALE_PREVISIONI
    SET TP_STAGIONALE_PREVISIONI.[1] = PF.[1], 
        TP_STAGIONALE_PREVISIONI.[2] = PF.[2], 
        TP_STAGIONALE_PREVISIONI.[3] = PF.[3], 
        TP_STAGIONALE_PREVISIONI.[4] = PF.[4], 
        TP_STAGIONALE_PREVISIONI.[5] = PF.[5], 
        TP_STAGIONALE_PREVISIONI.[6] = PF.[6], 
        TP_STAGIONALE_PREVISIONI.[7] = PF.[7], 
        TP_STAGIONALE_PREVISIONI.[8] = PF.[8], 
        TP_STAGIONALE_PREVISIONI.[9] = PF.[9], 
        TP_STAGIONALE_PREVISIONI.[10] = PF.[10], 
        TP_STAGIONALE_PREVISIONI.[11] = PF.[11], 
        TP_STAGIONALE_PREVISIONI.[12] = PF.[12],
        TP_STAGIONALE_PREVISIONI.UtenteModifica = PF.[UtenteModifica],
        TP_STAGIONALE_PREVISIONI.DataModifica = PF.[DataModifica]
FROM
    TP_STAGIONALE_PREVISIONI
INNER JOIN
(
    SELECT
        CodArticolo, 
        CodDeposito,
        'SE' As Tipo,
        [1], 
        [2], 
        [3], 
        [4], 
        [5], 
        [6], 
        [7], 
        [8], 
        [9], 
        [10], 
        [11], 
        [12],
        USER_NAME() As UtenteModifica,
        GETDATE() As DataModifica
    FROM
    (
        SELECT 
            CodArticolo, 
            CodDeposito, 
            ISNULL(Previsione,0) As Previsione,
            Periodo
        FROM CTE_Previsione
    ) C
    PIVOT
    (
        Max(Previsione)
        FOR Periodo IN ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])
    ) PVT
) PF
ON 
    PF.CodArticolo = TP_STAGIONALE_PREVISIONI.CodArticolo AND
    PF.CodDeposito = TP_STAGIONALE_PREVISIONI.CodDeposito AND
    PF.Tipo = TP_STAGIONALE_PREVISIONI.Tipo

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CREA_OF_EXPONENTIALSMOOTHING_PREVISIONI_FUTURE] TO [Metodo98]
    AS [dbo];

