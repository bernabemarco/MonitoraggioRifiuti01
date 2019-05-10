﻿CREATE VIEW VISTASELPARAMETRIDOC AS
SELECT  PDC.* 
		FROM PARAMETRIDOC PDC INNER JOIN  TABUTENTI ON USERDB = USER_NAME()
		WHERE (SUPERVISOR = 1 OR 
    	(SUPERVISOR = 0 AND USERID IN (SELECT NOMEUTENTE FROM ACCESSIDOCUMENTI WHERE CODDOCUMENTO = PDC.CODICE AND FLAGVISUALIZZA=1)))

GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTASELPARAMETRIDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTASELPARAMETRIDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTASELPARAMETRIDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASELPARAMETRIDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTASELPARAMETRIDOC] TO [Metodo98]
    AS [dbo];

