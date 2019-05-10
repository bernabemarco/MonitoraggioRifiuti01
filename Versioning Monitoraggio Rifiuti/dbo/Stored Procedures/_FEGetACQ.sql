﻿

-- EXEC _FEGetACQ '580', '2'
-- select * from [ALD_B2B_VISTARIFORDPA] where IDTESTADOC = '580'
CREATE PROCEDURE _FEGetACQ       (@Chiave1 as varchar(100),@Chiave2 as varchar(100)) AS

--	SELECT * FROM [ALD_B2B_VISTARIFORDPA] where IDTESTADOC = @Chiave1 and PosFatt = @Chiave2

	WITH CTERIGHEDOC AS
	(
	   SELECT Posizione AS PosFatt,IDTESTA AS IDTESTADOC,
	   (CASE
			WHEN CHARINDEX(';',dbo.GetRifOrd(IDTESTARP,IDRIGARP,0))<=0 THEN 0
		ELSE LEFT(dbo.GetRifOrd(IDTESTARP,IDRIGARP,0),CHARINDEX(';',dbo.GetRifOrd(IDTESTARP,IDRIGARP,0))-1)
		END) AS IDTestaOrdine,
	   (CASE
		WHEN CHARINDEX(';',dbo.GetRifOrd(IDTESTARP,IDRIGARP,0))<=0 THEN 0
		ELSE SUBSTRING(dbo.GetRifOrd(IDTESTARP,IDRIGARP,0),CHARINDEX(';',dbo.GetRifOrd(IDTESTARP,IDRIGARP,0))+1, 15)
		END) AS IDRigaOrdine
	   FROM dbo.RIGHEDOCUMENTI WHERE TIPORIGA<>'R' AND (IDTESTARP<>0 AND IDRIGARP<>0)
	)
	SELECT CTERIGHEDOC.PosFatt,CTERIGHEDOC.IDTESTADOC, CTERIGHEDOC.IDRigaOrdine AS  HRIISCRRbaisPr, --RigaDoc ACQ
	(SELECT progressivo FROM dbo.TESTEDOCUMENTI WHERE PROGRESSIVO=CTERIGHEDOC.IDTestaOrdine) AS HRIISCRMbaisPr, -- NumeroDoc ACQ
	(SELECT NumRifDoc FROM dbo.TESTEDOCUMENTI WHERE PROGRESSIVO=CTERIGHEDOC.IDTestaOrdine) AS NumRifDoc, 
	(SELECT DataRifDoc FROM dbo.TESTEDOCUMENTI WHERE PROGRESSIVO=CTERIGHEDOC.IDTestaOrdine) AS DataRifDoc,
	(SELECT CodiceCIG FROM dbo.TESTEDOCUMENTI WHERE PROGRESSIVO=CTERIGHEDOC.IDTestaOrdine) AS CodiceCIG,
	(SELECT CodiceCUP FROM dbo.TESTEDOCUMENTI WHERE PROGRESSIVO=CTERIGHEDOC.IDTestaOrdine) AS CodiceCUP,
	(SELECT Posizione FROM dbo.RIGHEDOCUMENTI WHERE IDTESTA=CTERIGHEDOC.IDTestaOrdine AND IDRIGA=CTERIGHEDOC.IDRigaOrdine) AS PosOrd,
	(SELECT RifCommCli FROM dbo.RIGHEDOCUMENTI WHERE IDTESTA=CTERIGHEDOC.IDTestaOrdine AND IDRIGA=CTERIGHEDOC.IDRigaOrdine) AS RifCommCli 
	FROM CTERIGHEDOC
	 WHERE CTERIGHEDOC.IDTestaOrdine>0 AND IDTESTADOC = @Chiave1 and PosFatt = @Chiave2

