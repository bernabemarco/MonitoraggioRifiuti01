

CREATE view [dbo].[CRM_VISTA_TABSETTORI]
as 
SELECT    
(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) as IdAzienda,	
 (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + CAST(CODICE AS varchar(15)) AS CODSETTORE
					   , DESCRIZIONE, NOTE, UTENTEMODIFICA, DATAMODIFICA, Budget
					   , DESCRIZIONE + ' - ' +  (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + CAST(CODICE AS varchar(15))
					   as ava_nomecodice
FROM         TABSETTORI
where exportcrm=1



GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTA_TABSETTORI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTA_TABSETTORI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTA_TABSETTORI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTA_TABSETTORI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTA_TABSETTORI] TO [Metodo98]
    AS [dbo];

