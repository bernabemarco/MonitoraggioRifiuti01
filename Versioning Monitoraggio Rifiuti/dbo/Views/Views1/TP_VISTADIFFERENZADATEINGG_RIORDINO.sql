﻿

CREATE VIEW [dbo].[TP_VISTADIFFERENZADATEINGG_RIORDINO] AS

SELECT
    CODDEPOSITO,
    CODFORNITORE,
    DATARIORDINO_UNO,
    DATARIORDINO_DUE,
    (
        DateDiff(Day, DATARIORDINO_DUE, DATARIORDINO_UNO) - 
        (2 * DateDiff(WW, DATARIORDINO_DUE, DATARIORDINO_UNO)) - 
        Case When DATEPART(WEEKDAY, DATARIORDINO_DUE + @@DATEFIRST) = 1 
             THEN 1 
             ELSE 0 
             END - 
        Case When DATEPART(WEEKDAY, DATARIORDINO_UNO + @@DATEFIRST) = 1 
             THEN 1 
             ELSE 0 
             END
    ) AS GG_DATARIORDINODIFF
FROM
(
    SELECT
        TP_CONFIGURAZIONIPUNTOFISSORIORDINO_RIORDINO.CODDEPOSITO,
        TP_CONFIGURAZIONIPUNTOFISSORIORDINO_RIORDINO.CODFORNITORE,
        DIFFERENZADATEINGG.DATARIORDINO_UNO,
        MAX(TP_CONFIGURAZIONIPUNTOFISSORIORDINO_RIORDINO.DATARIORDINO) AS DATARIORDINO_DUE
    FROM
        TP_CONFIGURAZIONIPUNTOFISSORIORDINO_RIORDINO
    INNER JOIN
    (
        SELECT
            CODDEPOSITO,
            CODFORNITORE,
            MIN(DATARIORDINO) AS DATARIORDINO_UNO
        FROM 
            TP_CONFIGURAZIONIPUNTOFISSORIORDINO_RIORDINO
        WHERE
            CONVERT(VARCHAR(8),DATARIORDINO,112) >= CONVERT(VARCHAR(8),GETDATE(),112)
        GROUP BY
            CODDEPOSITO,
            CODFORNITORE
    ) AS DIFFERENZADATEINGG
    ON
        DIFFERENZADATEINGG.CODDEPOSITO = TP_CONFIGURAZIONIPUNTOFISSORIORDINO_RIORDINO.CODDEPOSITO AND
        DIFFERENZADATEINGG.CODFORNITORE = TP_CONFIGURAZIONIPUNTOFISSORIORDINO_RIORDINO.CODFORNITORE AND
        CONVERT(VARCHAR(8),DIFFERENZADATEINGG.DATARIORDINO_UNO,112) > CONVERT(VARCHAR(8),TP_CONFIGURAZIONIPUNTOFISSORIORDINO_RIORDINO.DATARIORDINO,112)
    GROUP BY
        TP_CONFIGURAZIONIPUNTOFISSORIORDINO_RIORDINO.CODDEPOSITO,
        TP_CONFIGURAZIONIPUNTOFISSORIORDINO_RIORDINO.CODFORNITORE,
        DIFFERENZADATEINGG.DATARIORDINO_UNO
) DIFF



GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTADIFFERENZADATEINGG_RIORDINO] TO [Metodo98]
    AS [dbo];

