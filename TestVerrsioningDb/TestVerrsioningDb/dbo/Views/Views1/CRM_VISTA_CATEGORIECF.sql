

CREATE view [dbo].[CRM_VISTA_CATEGORIECF]
as 
SELECT     
(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) as IdAzienda,	
(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + CAST(CODCATEGORIA AS varchar(15)) AS CODCATEGORIA, 
					   DSCCATEGORIA, NOTE, UTENTEMODIFICA, DATAMODIFICA, Budget
					   , DSCCATEGORIA + ' - ' + (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + CAST(CODCATEGORIA AS varchar(15))
					   as ava_nomecodice
FROM         CATEGORIECF
where exportCRM=1




GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTA_CATEGORIECF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTA_CATEGORIECF] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTA_CATEGORIECF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTA_CATEGORIECF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTA_CATEGORIECF] TO [Metodo98]
    AS [dbo];

