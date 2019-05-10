

CREATE PROCEDURE PROC_CREA_OF_WINTER_MAD_ARTICOLI
--ENCRY--
AS
/*MAD*/
UPDATE TP_STORICO_WINTER
    SET TP_STORICO_WINTER.ALFA = MAD.Alfa,
        TP_STORICO_WINTER.BETA = MAD.Beta
FROM 
    TP_STORICO_WINTER
INNER JOIN
(
    SELECT
        CodArticolo, 
        CodDeposito, 
        REPLACE(LEFT(AlfaBeta,3),'MA','0.') As Alfa,
        REPLACE(RIGHT(AlfaBeta,2),'B','0.') As Beta, 
        AlfaBeta,
        ValoreAlfabeta
    FROM
    (
        SELECT 
            ROW_NUMBER() OVER(PARTITION BY CodArticolo, CodDeposito ORDER BY ValoreAlfabeta ASC) AS ValoreMinimo,
            CodArticolo, 
            CodDeposito, 
            AlfaBeta,
            ValoreAlfabeta
        FROM
        (
            SELECT 
                CodArticolo, 
                CodDeposito,
                AlfaBeta, 
                ValoreAlfabeta
            FROM
            (SELECT CodArticolo,CodDeposito,ABS(MA1B1) AS MA1B1,ABS(MA1B2) AS MA1B2,ABS(MA1B3) AS MA1B3,ABS(MA1B4) AS MA1B4,
                                    ABS(MA2B1) AS MA2B1,ABS(MA2B2) AS MA2B2,ABS(MA2B3) AS MA2B3,ABS(MA2B4) AS MA2B4,
                                    ABS(MA3B1) AS MA3B1,ABS(MA3B2) AS MA3B2,ABS(MA3B3) AS MA3B3,ABS(MA3B4) AS MA3B4,
                                    ABS(MA4B1) AS MA4B1,ABS(MA4B2) AS MA4B2,ABS(MA4B3) AS MA4B3,ABS(MA4B4) AS MA4B4,
                                    ABS(MA5B1) AS MA5B1,ABS(MA5B2) AS MA5B2,ABS(MA5B3) AS MA5B3,ABS(MA5B4) AS MA5B4,
                                    ABS(MA6B1) AS MA6B1,ABS(MA6B2) AS MA6B2,ABS(MA6B3) AS MA6B3,ABS(MA6B4) AS MA6B4
             FROM TP_STORICO_WINTER) MAD
            UNPIVOT(ValoreAlfabeta FOR AlfaBeta IN (MA1B1,MA1B2,MA1B3,MA1B4,
                                                    MA2B1,MA2B2,MA2B3,MA2B4,
                                                    MA3B1,MA3B2,MA3B3,MA3B4,
                                                    MA4B1,MA4B2,MA4B3,MA4B4,
                                                    MA5B1,MA5B2,MA5B3,MA5B4,
                                                    MA6B1,MA6B2,MA6B3,MA6B4)) AS UNP_MAD
        ) AS MINUNPV
    ) MAD
    WHERE 
        MAD.ValoreMinimo = 1
) MAD
ON
    TP_STORICO_WINTER.CodArticolo = Mad.CodArticolo AND
    TP_STORICO_WINTER.CodDeposito = Mad.CodDeposito;

UPDATE TP_ExtraMag
    SET OFSMOOTHINGALFA_WT = MAD.Alfa,
        OFSMOOTHINGBETA_WT = MAD.Beta
FROM 
    TP_ExtraMag
INNER JOIN
    TP_STORICO_WINTER MAD
ON
    MAD.CodArticolo = TP_ExtraMag.CodArt;
    
/*DESTAGIONALIZZAZIONE*/
UPDATE TP_STORICO_WINTER
SET TP_STORICO_WINTER.[D1] = ISW.[D1],
    TP_STORICO_WINTER.[D2] = ISW.[D2],
    TP_STORICO_WINTER.[D3] = ISW.[D3],
    TP_STORICO_WINTER.[D4] = ISW.[D4],
    TP_STORICO_WINTER.[D5] = ISW.[D5],
    TP_STORICO_WINTER.[D6] = ISW.[D6],
    TP_STORICO_WINTER.[D7] = ISW.[D7],
    TP_STORICO_WINTER.[D8] = ISW.[D8],
    TP_STORICO_WINTER.[D9] = ISW.[D9],
    TP_STORICO_WINTER.[D10] = ISW.[D10],
    TP_STORICO_WINTER.[D11] = ISW.[D11],
    TP_STORICO_WINTER.[D12] = ISW.[D12],
    TP_STORICO_WINTER.UtenteModifica = USER_NAME(),
    TP_STORICO_WINTER.DataModifica = GETDATE()
FROM
    TP_STORICO_WINTER
INNER JOIN
    TP_VISTAINDICISTAGIONALIZZAZIONE_WINTER ISW
ON 
    ISW.CodArticolo = TP_STORICO_WINTER.CodArticolo AND
    ISW.CodDeposito = TP_STORICO_WINTER.CodDeposito

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CREA_OF_WINTER_MAD_ARTICOLI] TO [Metodo98]
    AS [dbo];

