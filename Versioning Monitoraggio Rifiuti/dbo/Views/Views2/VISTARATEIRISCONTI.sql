﻿
CREATE VIEW VISTARATEIRISCONTI AS
SELECT TABRIPARTIZRATEIRISCONTI.*,
(CASE WHEN IDTESTADOC=0 THEN ''
ELSE
   (SELECT TIPODOC FROM TESTEDOCUMENTI WHERE PROGRESSIVO = IDTESTADOC) + ' ' + CAST((SELECT ESERCIZIO FROM TESTEDOCUMENTI WHERE PROGRESSIVO = IDTESTADOC) AS VARCHAR(4)) + '/' + CAST((SELECT NUMERODOC FROM TESTEDOCUMENTI WHERE PROGRESSIVO = IDTESTADOC) AS VARCHAR(12)) + (SELECT BIS FROM TESTEDOCUMENTI WHERE PROGRESSIVO = IDTESTADOC) END) AS RIFDOCUMENTO
FROM TABRIPARTIZRATEIRISCONTI

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTARATEIRISCONTI] TO [Metodo98]
    AS [dbo];

