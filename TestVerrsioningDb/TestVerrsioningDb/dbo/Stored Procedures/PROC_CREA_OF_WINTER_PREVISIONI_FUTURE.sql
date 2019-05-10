

CREATE PROCEDURE PROC_CREA_OF_WINTER_PREVISIONI_FUTURE
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
                TP_STORICO_WINTER ES
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
    FROM TP_STORICO_WINTER AS ES
    INNER JOIN CTE_Previsione AS P
        ON P.CodArticolo = ES.CodArticolo AND P.CodDeposito = ES.CodDeposito
    WHERE Periodo <=11
)
-- Statement that executes the CTE
UPDATE TP_STAGIONALE_PREVISIONI
    SET TP_STAGIONALE_PREVISIONI.[1] = (Case when D1 = 0 then PF.[1] else TotPrevisioni * D1 end),
        TP_STAGIONALE_PREVISIONI.[2] = (Case when D2 = 0 then PF.[2] else TotPrevisioni * D2 end),
        TP_STAGIONALE_PREVISIONI.[3] = (Case when D3 = 0 then PF.[3] else TotPrevisioni * D3 end),
        TP_STAGIONALE_PREVISIONI.[4] = (Case when D4 = 0 then PF.[4] else TotPrevisioni * D4 end),
        TP_STAGIONALE_PREVISIONI.[5] = (Case when D5 = 0 then PF.[5] else TotPrevisioni * D5 end),
        TP_STAGIONALE_PREVISIONI.[6] = (Case when D6 = 0 then PF.[6] else TotPrevisioni * D6 end),
        TP_STAGIONALE_PREVISIONI.[7] = (Case when D7 = 0 then PF.[7] else TotPrevisioni * D7 end),
        TP_STAGIONALE_PREVISIONI.[8] = (Case when D8 = 0 then PF.[8] else TotPrevisioni * D8 end),
        TP_STAGIONALE_PREVISIONI.[9] = (Case when D9 = 0 then PF.[9] else TotPrevisioni * D9 end),
        TP_STAGIONALE_PREVISIONI.[10] = (Case when D10 = 0 then PF.[10] else TotPrevisioni * D10 end),
        TP_STAGIONALE_PREVISIONI.[11] = (Case when D11 = 0 then PF.[11] else TotPrevisioni * D11 end),
        TP_STAGIONALE_PREVISIONI.[12] = (Case when D12 = 0 then PF.[12] else TotPrevisioni * D12 end),
        TP_STAGIONALE_PREVISIONI.UtenteModifica = USER_NAME(),
        TP_STAGIONALE_PREVISIONI.DataModifica = GETDATE()
FROM
    TP_STAGIONALE_PREVISIONI
INNER JOIN
(
    SELECT
        CodArticolo, 
        CodDeposito,
        'WT' As Tipo,
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
        ([1]+[2]+[3]+[4]+[5]+[6]+[7]+[8]+[9]+[10]+[11]+[12]) As TotPrevisioni
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
INNER JOIN
(
    SELECT
        CodArticolo,
        CodDeposito,
        [D1], 
        [D2], 
        [D3], 
        [D4], 
        [D5], 
        [D6], 
        [D7], 
        [D8], 
        [D9], 
        [D10], 
        [D11], 
        [D12]
    FROM
        TP_STORICO_WINTER
        
) ISW
ON 
    ISW.CodArticolo = TP_STAGIONALE_PREVISIONI.CodArticolo AND
    ISW.CodDeposito = TP_STAGIONALE_PREVISIONI.CodDeposito

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CREA_OF_WINTER_PREVISIONI_FUTURE] TO [Metodo98]
    AS [dbo];

