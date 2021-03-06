﻿

CREATE VIEW dbo.TP_VISTAPARAMETRIDOC AS
SELECT  
         PDC.*
        ,EPD.[TIPODOCOFN]
FROM PARAMETRIDOC PDC
    INNER JOIN  TP_EXTRAPARDOC EPD ON EPD.CODICE = PDC.CODICE
    INNER JOIN  TABUTENTI ON TABUTENTI.USERDB = USER_NAME()
        WHERE (SUPERVISOR = 1 OR
            (SUPERVISOR = 0 AND
             USERID IN (SELECT NOMEUTENTE FROM ACCESSIDOCUMENTI WHERE CODDOCUMENTO = PDC.CODICE AND FLAGABILITA=1)))

GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTAPARAMETRIDOC] TO [Metodo98]
    AS [dbo];

