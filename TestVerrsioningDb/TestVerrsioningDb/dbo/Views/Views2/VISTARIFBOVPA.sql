﻿CREATE VIEW VISTARIFBOVPA AS
WITH CTERIGHEDOC AS
(
   SELECT Posizione AS PosFatt,IDTESTA AS IDTESTADOC,
   (CASE
        WHEN CHARINDEX(';',dbo.GETRIFBOV(IDTESTARP,IDRIGARP,0))<=0 THEN 0
   ELSE 
        LEFT(dbo.GETRIFBOV(IDTESTARP,IDRIGARP,0),CHARINDEX(';',dbo.GETRIFBOV(IDTESTARP,IDRIGARP,0))-1) 
   END) AS IDTestaDDT,
   (CASE
    WHEN CHARINDEX(';',dbo.GETRIFBOV(IDTESTARP,IDRIGARP,0))<=0 THEN 0   
   ELSE
        SUBSTRING(dbo.GETRIFBOV(IDTESTARP,IDRIGARP,0),CHARINDEX(';',dbo.GETRIFBOV(IDTESTARP,IDRIGARP,0))+1, 15) 
   END) AS IDRigaDDT
   FROM dbo.RIGHEDOCUMENTI WHERE TIPORIGA<>'R' AND (IDTESTARP<>0 AND IDRIGARP<>0)
)
SELECT CTERIGHEDOC.PosFatt,CTERIGHEDOC.IDTESTADOC,
(SELECT NumeroDoc FROM dbo.TESTEDOCUMENTI WHERE PROGRESSIVO=CTERIGHEDOC.IDTestaDDT) AS NumeroDoc,
(SELECT DataDoc FROM dbo.TESTEDOCUMENTI WHERE PROGRESSIVO=CTERIGHEDOC.IDTestaDDT) AS DataDoc,
(SELECT NumRifDoc FROM dbo.TESTEDOCUMENTI WHERE PROGRESSIVO=CTERIGHEDOC.IDTestaDDT) AS NumRifDoc,
(SELECT DataRifDoc FROM dbo.TESTEDOCUMENTI WHERE PROGRESSIVO=CTERIGHEDOC.IDTestaDDT) AS DataRifDoc
FROM CTERIGHEDOC WHERE CTERIGHEDOC.IDTestaDDT>0

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTARIFBOVPA] TO [Metodo98]
    AS [dbo];

