﻿
CREATE VIEW CONTRATTI_CONTABINCOND
AS

SELECT     dbo.AIOTCONTRATTI_PREMI.TIPOCONTRIBUTO, dbo.AIOTCONTRATTI_PREMI.RIFCONTRATTO, dbo.AIOTCONTRATTI_PREMI.RIFCONTRIBUTO, 
                      dbo.AIOTCONTRATTI_PREMI.NOTA, dbo.AIOTCONTRATTI_PREMI.DADATA, CONVERT(datetime, dbo.AIOTCONTRATTI_PREMI.ADATA, 105) AS ADATA, 
                      dbo.AIOTCONTRATTI_PREMI.PREMIOMATURATO - ISNULL(liquidato.valoreliquidato, 0) AS PREMIOMATURATO, dbo.AIOTCONTRATTI_PREMI.TIPOLOGIA, 
                      dbo.AIOTCONTRATTI_PREMI.DELTA
FROM         dbo.AIOTCONTRATTI_PREMI LEFT OUTER JOIN
                          (SELECT     RIFPROGRESSIVOCL, RIFPROGRESSIVO, SUM(VALOREEFFETTIVO) AS valoreliquidato
                            FROM          dbo.CONTRATTICL_QTADATEDOC
                            WHERE      (EMESSO = 1)
                            GROUP BY RIFPROGRESSIVOCL, RIFPROGRESSIVO) AS liquidato ON liquidato.RIFPROGRESSIVOCL = dbo.AIOTCONTRATTI_PREMI.RIFCONTRATTO AND 
                      liquidato.RIFPROGRESSIVO = dbo.AIOTCONTRATTI_PREMI.RIFCONTRIBUTO
WHERE     (dbo.AIOTCONTRATTI_PREMI.TIPOCONTRIBUTO = 'INCONDIZIONATI-COND') AND (dbo.AIOTCONTRATTI_PREMI.PREMIOMATURATO - ISNULL(liquidato.valoreliquidato, 
                      0) > 0)
UNION
SELECT     A.TIPOCONTRIBUTO, A.RIFCONTRATTO, A.RIFCONTRIBUTO, A.NOTA, A.DADATA, B.DATAEMISSIONE AS ADATA, B.VALORE, A.TIPOLOGIA, A.DELTA
FROM         dbo.AIOTCONTRATTI_PREMI AS A INNER JOIN
                      dbo.CONTRATTI_CONTABINCONDDATE AS B ON B.CONTRATTO = A.RIFCONTRATTO AND B.RIFCONTRIBUTO = A.RIFCONTRIBUTO
WHERE     (A.TIPOCONTRIBUTO = 'INCONDIZIONATI')


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_CONTABINCOND] TO [Metodo98]
    AS [dbo];
