﻿
CREATE VIEW VISTACAUSALICONTMOD AS
SELECT CC.*
    FROM CAUSALICONTABILI CC INNER JOIN TABUTENTI ON USERDB = CAST(USER_NAME() AS VARCHAR(25))
    WHERE
    ((SUPERVISOR=1) OR (SUPERVISOR=0 AND USERID IN (SELECT NOMEUTENTE FROM ACCESSICAUSCONT WHERE CODCAUSALE=CC.CODICECAUSALE AND FLAGABILITA=1)))


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACAUSALICONTMOD] TO [Metodo98]
    AS [dbo];

