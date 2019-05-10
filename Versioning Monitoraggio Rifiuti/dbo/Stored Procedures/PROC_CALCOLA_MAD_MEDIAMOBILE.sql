

CREATE PROCEDURE [dbo].[PROC_CALCOLA_MAD_MEDIAMOBILE]
--ENCRY--
AS

BEGIN

SET NOCOUNT ON

    UPDATE 
        TP_STORICO_MEDIAMOBILE
    SET 
        TP_STORICO_MEDIAMOBILE.MAD = CALCOLATO_MAD.MAD
    FROM
        TP_STORICO_MEDIAMOBILE
    INNER JOIN
    (
        SELECT
            CODARTICOLO,
            CODDEPOSITO,
            PERIODO,
            MAD
        FROM
        (
            SELECT 
                TPFES.CODARTICOLO,
                TPFES.CODDEPOSITO,
                TPFES.PERIODO,
                ((ABS(TPFES.[1] - TPV.[1]) +
                ABS(TPFES.[2] - TPV.[2]) +
                ABS(TPFES.[3] - TPV.[3]) +
                ABS(TPFES.[4] - TPV.[4]) +
                ABS(TPFES.[5] - TPV.[5]) +
                ABS(TPFES.[6] - TPV.[6]) +
                ABS(TPFES.[7] - TPV.[7]) +
                ABS(TPFES.[8] - TPV.[8]) +
                ABS(TPFES.[9] - TPV.[9]) +
                ABS(TPFES.[10] - TPV.[10]) +
                ABS(TPFES.[11] - TPV.[11]) +
                ABS(TPFES.[12] - TPV.[12]) +
                ABS(TPFES.[13] - TPV.[13]) +
                ABS(TPFES.[14] - TPV.[14]) +
                ABS(TPFES.[15] - TPV.[15]) +
                ABS(TPFES.[16] - TPV.[16]) +
                ABS(TPFES.[17] - TPV.[17]) +
                ABS(TPFES.[18] - TPV.[18]) +
                ABS(TPFES.[19] - TPV.[19]) +
                ABS(TPFES.[20] - TPV.[20]) +
                ABS(TPFES.[21] - TPV.[21]) +
                ABS(TPFES.[22] - TPV.[22]) +
                ABS(TPFES.[23] - TPV.[23]) +
                ABS(TPFES.[24] - TPV.[24]) +
                ABS(TPFES.[25] - TPV.[25]) +
                ABS(TPFES.[26] - TPV.[26]) +
                ABS(TPFES.[27] - TPV.[27]) +
                ABS(TPFES.[28] - TPV.[28]) +
                ABS(TPFES.[29] - TPV.[29]) +
                ABS(TPFES.[30] - TPV.[30]) +
                ABS(TPFES.[31] - TPV.[31]) +
                ABS(TPFES.[32] - TPV.[32]) +
                ABS(TPFES.[33] - TPV.[33]) +
                ABS(TPFES.[34] - TPV.[34]) +
                ABS(TPFES.[35] - TPV.[35]) +
                ABS(TPFES.[36] - TPV.[36])) / 36) AS MAD
            FROM 
                TP_STORICO_MEDIAMOBILE TPFES,
                TP_PERIODI_VENDUTO TPV
            WHERE
                TPV.CODARTICOLO = TPFES.CODARTICOLO AND
                TPV.CODDEPOSITO = TPFES.CODDEPOSITO
        ) CALCOLO_MAD
    ) AS CALCOLATO_MAD
    ON
        CALCOLATO_MAD.CODARTICOLO = TP_STORICO_MEDIAMOBILE.CODARTICOLO AND
        CALCOLATO_MAD.CODDEPOSITO = TP_STORICO_MEDIAMOBILE.CODDEPOSITO AND
        CALCOLATO_MAD.PERIODO = TP_STORICO_MEDIAMOBILE.PERIODO
    
    If @@ERROR <> 0 GoTo ErrorHandler
    Set NoCount OFF
    Return(0)
  
ErrorHandler:
    Return(@@ERROR)

END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CALCOLA_MAD_MEDIAMOBILE] TO [Metodo98]
    AS [dbo];

