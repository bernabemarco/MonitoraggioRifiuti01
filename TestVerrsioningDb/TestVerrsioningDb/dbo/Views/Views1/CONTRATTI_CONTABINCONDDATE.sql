﻿
CREATE VIEW CONTRATTI_CONTABINCONDDATE
AS

SELECT     'CONDIZ' AS 'TIPO', RIFPROGRESSIVO AS CONTRATTO, RIFPROGRESSIVOCC AS RIFCONTRIBUTO, DATAEMISSIONE, VALORE
FROM         dbo.CONTRATTICC_DATELIQ AS CONDIZ
WHERE     (EMESSO = 0)
UNION
SELECT     'INCONDIZ' AS 'TIPO', RIFPROGRESSIVOCL AS CONTRATTO, RIFPROGRESSIVO AS RIFCONTRIBUTO, DATAEMISSIONE, VALORE
FROM         dbo.CONTRATTICL_DATEDOC
WHERE     (EMESSO = 0)
UNION
SELECT     'INCONDIZ' AS 'TIPO', RIFPROGRESSIVOCL AS CONTRATTO, RIFPROGRESSIVO AS RIFCONTRIBUTO, DATAEMISSIONE, VALORE
FROM         dbo.CONTRATTICL_QTADATEDOC
WHERE     (EMESSO = 0)


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_CONTABINCONDDATE] TO [Metodo98]
    AS [dbo];

