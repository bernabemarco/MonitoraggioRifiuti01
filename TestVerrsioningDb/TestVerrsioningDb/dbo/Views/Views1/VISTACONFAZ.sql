﻿
CREATE VIEW VISTACONFAZ AS
SELECT 
     PROGRESSIVO,
     NOMEIMPOSTAZIONE,
     NOTE,
     HELPCONTEXTID,
     (SELECT (CASE WHEN IMPPREDEFINITA<>0 THEN 'SI' ELSE 'NO' END) FROM UTENTICONFAZ WHERE RIFPROGRESSIVO=PROGRESSIVO AND UTENTE=(SELECT USERID FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25)))) AS IMPPREDEFINITA
FROM 
     TESTECONFAZ

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACONFAZ] TO [Metodo98]
    AS [dbo];
