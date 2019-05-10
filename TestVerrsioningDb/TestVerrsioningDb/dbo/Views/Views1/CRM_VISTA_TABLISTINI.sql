
CREATE view [dbo].[CRM_VISTA_TABLISTINI]
as 
SELECT     (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) AS Ditta,
                          (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_1) + CAST(NRLISTINO AS varchar(15)) AS CODLISTINO, DESCRIZIONE, UTENTEMODIFICA, 
                      DATAMODIFICA, 'EUR' AS Valuta, DATAINIVALIDITA, DATAFINEVALIDITA
FROM         TABLISTINI
WHERE     (ExportCRM = 1)


GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTA_TABLISTINI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTA_TABLISTINI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTA_TABLISTINI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTA_TABLISTINI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTA_TABLISTINI] TO [Metodo98]
    AS [dbo];

