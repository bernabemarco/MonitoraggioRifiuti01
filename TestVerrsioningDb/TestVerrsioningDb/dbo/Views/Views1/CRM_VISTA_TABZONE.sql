
CREATE view [dbo].[CRM_VISTA_TABZONE]
as 
SELECT     
(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) as IdAzienda,	
(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + CAST(CODICE AS varchar(15)) AS CODZONA
					   , DESCRIZIONE, NOTE, UTENTEMODIFICA, DATAMODIFICA, Budget
FROM         TABZONE
where exportCRM=1


GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTA_TABZONE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTA_TABZONE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTA_TABZONE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTA_TABZONE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTA_TABZONE] TO [Metodo98]
    AS [dbo];

