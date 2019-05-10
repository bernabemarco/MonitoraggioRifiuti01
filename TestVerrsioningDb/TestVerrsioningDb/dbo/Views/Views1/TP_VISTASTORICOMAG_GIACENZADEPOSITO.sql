﻿

CREATE VIEW [dbo].[TP_VISTASTORICOMAG_GIACENZADEPOSITO]
AS
SELECT
    CODART,
    QUANTITACARICO,
    VALORECARICO,
    GIACENZA,
    ORDINATO,
    IMPEGNATO,
    QUANTITASCARICO,
    VALORESCARICO,
    GIACENZA2UM,
    ORDINATO2UM,
    IMPEGNATO2UM,
    QTA1UM,
    QTA2UM,
    CAST(CONVERT(VARCHAR(10),GETDATE(),112) AS DATETIME) AS DATAMOV,
    CODDEPOSITO
FROM
(
    SELECT 
        GIACENZA.CODART,
        CASE WHEN SUM((CASE WHEN GIACENZA.GIACENZA=1 and GIACENZA.RESO = 0 THEN GIACENZA.QTA1UM ELSE 0 END) +
                 (CASE WHEN GIACENZA.GIACENZA=1 and GIACENZA.RESO = 1 THEN GIACENZA.QTA1UM ELSE 0 END) -
                 (CASE WHEN GIACENZA.GIACENZA=-1 and GIACENZA.RESO = 0 THEN GIACENZA.QTA1UM ELSE 0 END) -
                     (CASE WHEN GIACENZA.GIACENZA=-1 and GIACENZA.RESO = 1 THEN GIACENZA.QTA1UM ELSE 0 END)) >= 0
             THEN 1 ELSE 0 END AS QUANTITACARICO,
        CASE WHEN SUM((CASE WHEN GIACENZA.GIACENZA=1 and GIACENZA.RESO = 0 THEN GIACENZA.QTA1UM ELSE 0 END) +
                 (CASE WHEN GIACENZA.GIACENZA=1 and GIACENZA.RESO = 1 THEN GIACENZA.QTA1UM ELSE 0 END) -
                 (CASE WHEN GIACENZA.GIACENZA=-1 and GIACENZA.RESO = 0 THEN GIACENZA.QTA1UM ELSE 0 END) -
                     (CASE WHEN GIACENZA.GIACENZA=-1 and GIACENZA.RESO = 1 THEN GIACENZA.QTA1UM ELSE 0 END)) >= 0
             THEN 1 ELSE 0 END AS VALORECARICO,
        CASE WHEN SUM((CASE WHEN GIACENZA.GIACENZA=1 and GIACENZA.RESO = 0 THEN GIACENZA.QTA1UM ELSE 0 END) +
                 (CASE WHEN GIACENZA.GIACENZA=1 and GIACENZA.RESO = 1 THEN GIACENZA.QTA1UM ELSE 0 END) -
                 (CASE WHEN GIACENZA.GIACENZA=-1 and GIACENZA.RESO = 0 THEN GIACENZA.QTA1UM ELSE 0 END) -
                     (CASE WHEN GIACENZA.GIACENZA=-1 and GIACENZA.RESO = 1 THEN GIACENZA.QTA1UM ELSE 0 END)) >= 0
             THEN 1 ELSE -1 END AS GIACENZA,
        0 AS ORDINATO,
        0 AS IMPEGNATO,
        CASE WHEN SUM((CASE WHEN GIACENZA.GIACENZA2UM=1 and GIACENZA.RESO = 0 THEN GIACENZA.QTA2UM ELSE 0 END) +
                 (CASE WHEN GIACENZA.GIACENZA2UM=1 and GIACENZA.RESO = 1 THEN GIACENZA.QTA2UM ELSE 0 END) -
                 (CASE WHEN GIACENZA.GIACENZA2UM=-1 and GIACENZA.RESO = 0 THEN GIACENZA.QTA2UM ELSE 0 END) -
                     (CASE WHEN GIACENZA.GIACENZA2UM=-1 and GIACENZA.RESO = 1 THEN GIACENZA.QTA2UM ELSE 0 END)) >= 0
             THEN 1 ELSE 0 END AS QUANTITASCARICO,
        CASE WHEN SUM((CASE WHEN GIACENZA.GIACENZA2UM=1 and GIACENZA.RESO = 0 THEN GIACENZA.QTA2UM ELSE 0 END) +
                 (CASE WHEN GIACENZA.GIACENZA2UM=1 and GIACENZA.RESO = 1 THEN GIACENZA.QTA2UM ELSE 0 END) -
                 (CASE WHEN GIACENZA.GIACENZA2UM=-1 and GIACENZA.RESO = 0 THEN GIACENZA.QTA2UM ELSE 0 END) -
                     (CASE WHEN GIACENZA.GIACENZA2UM=-1 and GIACENZA.RESO = 1 THEN GIACENZA.QTA2UM ELSE 0 END)) >= 0
             THEN 1 ELSE 0 END AS VALORESCARICO,
        CASE WHEN SUM((CASE WHEN GIACENZA.GIACENZA2UM=1 and GIACENZA.RESO = 0 THEN GIACENZA.QTA2UM ELSE 0 END) +
                 (CASE WHEN GIACENZA.GIACENZA2UM=1 and GIACENZA.RESO = 1 THEN GIACENZA.QTA2UM ELSE 0 END) -
                 (CASE WHEN GIACENZA.GIACENZA2UM=-1 and GIACENZA.RESO = 0 THEN GIACENZA.QTA2UM ELSE 0 END) -
                     (CASE WHEN GIACENZA.GIACENZA2UM=-1 and GIACENZA.RESO = 1 THEN GIACENZA.QTA2UM ELSE 0 END)) >= 0
             THEN 1 ELSE -1 END AS GIACENZA2UM,
        0 AS ORDINATO2UM,
        0 AS IMPEGNATO2UM,
        ABS(SUM ((CASE WHEN GIACENZA.GIACENZA=1 and GIACENZA.RESO = 0 THEN GIACENZA.QTA1UM ELSE 0 END) +
                 (CASE WHEN GIACENZA.GIACENZA=1 and GIACENZA.RESO = 1 THEN GIACENZA.QTA1UM ELSE 0 END) -
             (CASE WHEN GIACENZA.GIACENZA=-1 and GIACENZA.RESO = 0 THEN GIACENZA.QTA1UM ELSE 0 END) -
                 (CASE WHEN GIACENZA.GIACENZA=-1 and GIACENZA.RESO = 1 THEN GIACENZA.QTA1UM ELSE 0 END))) AS QTA1UM,
        ABS(SUM ((CASE WHEN GIACENZA.GIACENZA2UM=1 and GIACENZA.RESO = 0 THEN GIACENZA.QTA2UM ELSE 0 END) +
                 (CASE WHEN GIACENZA.GIACENZA2UM=1 and GIACENZA.RESO = 1 THEN GIACENZA.QTA2UM ELSE 0 END) -
                 (CASE WHEN GIACENZA.GIACENZA2UM=-1 and GIACENZA.RESO = 0 THEN GIACENZA.QTA2UM ELSE 0 END) -
                 (CASE WHEN GIACENZA.GIACENZA2UM=-1 and GIACENZA.RESO = 1 THEN GIACENZA.QTA2UM ELSE 0 END))) AS QTA2UM,
        GIACENZA.CODDEPOSITO
    FROM STORICOMAG AS GIACENZA
    WHERE GIACENZA.GIACENZA <> 0
    GROUP BY    GIACENZA.CODART,
            GIACENZA.CODDEPOSITO
) AS STRMAG




GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VISTASTORICOMAG_GIACENZADEPOSITO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VISTASTORICOMAG_GIACENZADEPOSITO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTASTORICOMAG_GIACENZADEPOSITO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VISTASTORICOMAG_GIACENZADEPOSITO] TO [Metodo98]
    AS [dbo];

