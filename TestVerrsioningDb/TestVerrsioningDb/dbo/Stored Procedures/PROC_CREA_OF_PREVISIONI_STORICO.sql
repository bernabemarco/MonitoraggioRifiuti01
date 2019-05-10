

CREATE PROCEDURE [dbo].[PROC_CREA_OF_PREVISIONI_STORICO]
AS

BEGIN

SET NOCOUNT ON

DECLARE @PERIODI_CAMBIATI INT = 0
DECLARE @PERIODI_CORRENTE INT = 1

DECLARE @STAGIONALE_CAMBIATI INT = 0
DECLARE @STAGIONALE_CORRENTE INT = 1

    /*VERIFICO QUANTI PERIODI SONO CAMBIATI*/
    SELECT @PERIODI_CAMBIATI = SUM(CAMBIATO) FROM TP_PERIODI_CALCOLATI
    SELECT @STAGIONALE_CAMBIATI = SUM(CAMBIATO) FROM TP_STAGIONALE_CALCOLATI
    
    /*CREO GLI ARTICOLI\DEPOSITI\TIPI*/
    INSERT INTO TP_STAGIONALE_PREVISIONI_STORICO(CODARTICOLO,CODDEPOSITO,TIPO,UTENTEMODIFICA,DATAMODIFICA)
    Select ADTP.CodArticolo,ADTP.CodDeposito,ADTP.Tipo,USER_NAME(),GETDATE()
    From
    (
        SELECT A.CODICE AS CodArticolo,M.CodDeposito,P.Tipo
        FROM 
            ANAGRAFICAARTICOLI A,
            TP_TABMagazzini M,
            TP_ExtraMag X,
            (
                SELECT 'MM' AS Tipo
                UNION
                SELECT 'MQ' AS Tipo
                UNION
                SELECT 'SE' AS Tipo
                UNION
                SELECT 'WT' AS Tipo
                UNION
                SELECT 'PR' AS Tipo
            ) P
        WHERE
            A.CODICE = X.CodArt AND
            X.ConsidAcq = 1
        EXCEPT
        SELECT SP.CodArticolo,SP.CodDeposito,SP.Tipo
        FROM
            TP_STAGIONALE_PREVISIONI_STORICO SP
    )
    ADTP
    
    --SCALO I PERIODI CAMBIATI
    WHILE (@PERIODI_CORRENTE <= @PERIODI_CAMBIATI)
        BEGIN
            UPDATE TP_STAGIONALE_PREVISIONI_STORICO
            SET [36] = [35],
                [35] = [34],
                [34] = [33],
                [33] = [32],
                [32] = [31],
                [31] = [20],
                [30] = [29],
                [29] = [28],
                [28] = [27],
                [27] = [26],
                [26] = [25],
                [25] = [24],
                [24] = [23],
                [23] = [22],
                [22] = [21],
                [21] = [20],
                [20] = [19],
                [19] = [18],
                [18] = [17],
                [17] = [16],
                [16] = [15],
                [15] = [14],
                [14] = [13],
                [13] = [12],
                [12] = [11],
                [11] = [10],
                [10] = [9],
                [9] = [8],
                [8] = [7],
                [7] = [6],
                [6] = [5],
                [5] = [4],
                [4] = [3],
                [3] = [2],
                [2] = [1]
            WHERE
                Tipo IN('MM','SE','PR')
            
            SET @PERIODI_CORRENTE = @PERIODI_CORRENTE + 1
        END
    
    --SCALO GLI STAGIONALI CAMBIATI
    WHILE (@STAGIONALE_CORRENTE <= @STAGIONALE_CAMBIATI)
        BEGIN
            UPDATE TP_STAGIONALE_PREVISIONI_STORICO
            SET [36] = [35],
                [35] = [34],
                [34] = [33],
                [33] = [32],
                [32] = [31],
                [31] = [20],
                [30] = [29],
                [29] = [28],
                [28] = [27],
                [27] = [26],
                [26] = [25],
                [25] = [24],
                [24] = [23],
                [23] = [22],
                [22] = [21],
                [21] = [20],
                [20] = [19],
                [19] = [18],
                [18] = [17],
                [17] = [16],
                [16] = [15],
                [15] = [14],
                [14] = [13],
                [13] = [12],
                [12] = [11],
                [11] = [10],
                [10] = [9],
                [9] = [8],
                [8] = [7],
                [7] = [6],
                [6] = [5],
                [5] = [4],
                [4] = [3],
                [3] = [2],
                [2] = [1]
            WHERE
                Tipo IN('MQ','WT')
            
            SET @STAGIONALE_CORRENTE = @STAGIONALE_CORRENTE + 1
        END
        
    /*AGGIORNO STORICO*/
    UPDATE TP_STAGIONALE_PREVISIONI_STORICO
    SET TP_STAGIONALE_PREVISIONI_STORICO.[1] = TP_STAGIONALE_PREVISIONI.[1]
    FROM
        TP_STAGIONALE_PREVISIONI_STORICO 
    INNER JOIN
        TP_STAGIONALE_PREVISIONI
    ON
        TP_STAGIONALE_PREVISIONI.CodArticolo = TP_STAGIONALE_PREVISIONI_STORICO.CodArticolo AND
        TP_STAGIONALE_PREVISIONI.CodDeposito = TP_STAGIONALE_PREVISIONI_STORICO.CodDeposito AND
        TP_STAGIONALE_PREVISIONI.Tipo = TP_STAGIONALE_PREVISIONI_STORICO.Tipo
END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CREA_OF_PREVISIONI_STORICO] TO [Metodo98]
    AS [dbo];

