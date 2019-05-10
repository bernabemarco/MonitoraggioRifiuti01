CREATE VIEW [dbo].[Vista_Config_Sconti_Cond_Contratti]
AS
SELECT     CODICE, DESCRIZIONE
FROM         dbo.CONTRATTI_CONFIGSCONTI
WHERE     (TIPO = 1)

GO
GRANT SELECT
    ON OBJECT::[dbo].[Vista_Config_Sconti_Cond_Contratti] TO [Metodo98]
    AS [dbo];

