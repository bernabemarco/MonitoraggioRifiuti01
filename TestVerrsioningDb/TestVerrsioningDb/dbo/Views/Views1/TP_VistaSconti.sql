
CREATE view TP_VistaSconti
AS
SELECT 
	TP_CONFIGSCONTI.Progressivo,
	TP_CONFIGSCONTI.CodFor as Fornitore,
	(SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO=TP_CONFIGSCONTI.CodFor) AS DSCFornitore,
	TP_CONFIGSCONTI.Esercizio,
	TP_CONFIGSCONTI.DaData,
	TP_CONFIGSCONTI.AData,
	TP_CONFIGSCONTI.CodContratto as Contratto
FROM TP_CONFIGSCONTI
GROUP BY Progressivo,CodFor,Esercizio,DaData,AData,CodContratto

GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VistaSconti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VistaSconti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VistaSconti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VistaSconti] TO [Metodo98]
    AS [dbo];

