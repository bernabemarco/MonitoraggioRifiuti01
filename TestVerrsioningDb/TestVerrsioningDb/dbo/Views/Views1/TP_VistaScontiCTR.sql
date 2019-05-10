


CREATE view TP_VistaScontiCTR
AS
SELECT 
	TP_CONFIGSCONTICTR.Progressivo,
	TP_CONFIGSCONTICTR.CodFor as Fornitore,
	TP_CONFIGSCONTICTR.Esercizio,
	TP_CONFIGSCONTICTR.DaData,
	TP_CONFIGSCONTICTR.AData,
	TP_CONFIGSCONTICTR.CodContratto as Contratto
FROM TP_CONFIGSCONTICTR
GROUP BY Progressivo,CodFor,Esercizio,DaData,AData,CodContratto



GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VistaScontiCTR] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VistaScontiCTR] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_VistaScontiCTR] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VistaScontiCTR] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VistaScontiCTR] TO [Metodo98]
    AS [dbo];

