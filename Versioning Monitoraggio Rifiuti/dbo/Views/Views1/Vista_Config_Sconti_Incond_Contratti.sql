CREATE VIEW [dbo].[Vista_Config_Sconti_Incond_Contratti]
AS
SELECT     CODICE, DESCRIZIONE
FROM         dbo.CONTRATTI_CONFIGSCONTI
WHERE     (TIPO = 0)

GO
GRANT SELECT
    ON OBJECT::[dbo].[Vista_Config_Sconti_Incond_Contratti] TO [Metodo98]
    AS [dbo];

