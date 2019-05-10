
CREATE VIEW AIOT_VistaPartiteAperte AS 
SELECT 
	PAR.Conto,
	(SELECT DSCCONTO1 FROM VISTACFG CFG WHERE CFG.CODCONTO=PAR.Conto) AS DSCCONTO,
	PAR.NrPartita,
	SUM(PAR.DareEuro) AS DareEuro,
	SUM(PAR.DARELIT) AS DareLit,
	SUM(PAR.AvereEuro) AS AvereEuro,
	SUM(PAR.AVERELIT) AS AvereLit,
	SUM(PAR.DareEuro)-SUM(PAR.AvereEuro) AS SaldoEuro,
	SUM(PAR.DARELIT)-SUM(PAR.AVERELIT) AS SaldoLit,
	count(*) AS NrMovimenti,
	(SELECT TOP 1 NrReg FROM RigheContabilita CONT WHERE CONT.NrPartita=PAR.NrPartita AND CONT.Conto=PAR.Conto ORDER BY CONT.NrReg ASC) AS PRIMAREG
FROM VistaModificaPartite PAR
GROUP BY Conto,NrPartita

GO
GRANT DELETE
    ON OBJECT::[dbo].[AIOT_VistaPartiteAperte] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AIOT_VistaPartiteAperte] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[AIOT_VistaPartiteAperte] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AIOT_VistaPartiteAperte] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AIOT_VistaPartiteAperte] TO [Metodo98]
    AS [dbo];

