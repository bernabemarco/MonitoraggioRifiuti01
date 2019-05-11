﻿

CREATE VIEW VISTAMAXANNOCONSGRPACQ
AS
SELECT     CODCLIFOR, ESERCIZIO, MAX(ANNO) AS anno, ARTICOLO, GRUPPOACQ
FROM         dbo.CONTRATTI_TESTECONSUNTIVGRUPPIACQ
GROUP BY CODCLIFOR, ESERCIZIO, ARTICOLO, GRUPPOACQ


GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTAMAXANNOCONSGRPACQ] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTAMAXANNOCONSGRPACQ] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTAMAXANNOCONSGRPACQ] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAMAXANNOCONSGRPACQ] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTAMAXANNOCONSGRPACQ] TO [Metodo98]
    AS [dbo];
