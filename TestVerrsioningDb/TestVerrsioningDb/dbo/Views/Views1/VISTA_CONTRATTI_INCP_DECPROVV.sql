﻿

CREATE VIEW VISTA_CONTRATTI_INCP_DECPROVV
AS
SELECT     T.TIPODOC AS TIPODOCEMESSO, T.ESERCIZIO, T.NUMERODOC, T.PROGRESSIVO AS PROGRESSIVODOC, CL.RIFPROGRESSIVO AS CONTRATTO, 
                      CL.RIFPROGRESSIVO AS CONTRIBUTO, SUM(R.TOTPROVVAGEURO1) AS PROVVAG1, SUM(R.TOTPROVVAGEURO2) AS PROVVAG2, 
                      SUM(R.TOTPROVVAGEURO3) AS PROVVAG3, CQ.RIFPROGRESSIVO, CQ.NRRIGA
FROM         dbo.CONTRATTICL_QTADATEDOC AS CQD INNER JOIN
                      dbo.TESTEDOCUMENTI AS T ON T.PROGRESSIVO = CQD.RIFPROGRESSIVODOC INNER JOIN
                      dbo.RIGHEDOCUMENTI AS R ON R.IDTESTA = T.PROGRESSIVO INNER JOIN
                      dbo.CONTRATTICL_QTA AS CQ ON CQ.RIFPROGRESSIVOCL = CQD.RIFPROGRESSIVOCL AND CQ.RIFPROGRESSIVO = CQD.RIFPROGRESSIVO AND 
                      CQ.NRRIGA = CQD.RIFRIGA INNER JOIN
                      dbo.CONTRATTI_CL AS CL ON CL.RIFPROGRESSIVO = CQ.RIFPROGRESSIVOCL AND CL.NRRIGA = CQ.RIFPROGRESSIVO INNER JOIN
                      dbo.TESTE_CONTRATTI AS TESTE ON TESTE.PROGRESSIVO = CL.RIFPROGRESSIVO
WHERE     (CL.PRCAG1 = 1) OR
                      (CL.PRCAG2 = 1) OR
                      (CL.PRCAG3 = 1)
GROUP BY T.TIPODOC, T.ESERCIZIO, T.NUMERODOC, T.PROGRESSIVO, CL.RIFPROGRESSIVO, CL.RIFPROGRESSIVO, CQ.RIFPROGRESSIVO, CQ.NRRIGA


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_CONTRATTI_INCP_DECPROVV] TO [Metodo98]
    AS [dbo];

