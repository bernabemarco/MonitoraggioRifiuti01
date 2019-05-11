﻿CREATE VIEW VISTATESTATARGAGENTI AS
  SELECT tta.PROGRESSIVO, tta.ESERCIZIO, tta.CODAGENTE, age.DSCAGENTE
    FROM TESTATARAGENTI tta
          LEFT OUTER JOIN ANAGRAFICAAGENTI age ON tta.CODAGENTE=age.CODAGENTE

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATESTATARGAGENTI] TO [Metodo98]
    AS [dbo];
