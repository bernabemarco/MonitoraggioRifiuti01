


CREATE view [dbo].[CRM_VISTA_TABPAGAMENTI]
as 
SELECT    
(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) as IdAzienda,		
 (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + CAST(CODICE AS varchar(15)) AS CODPAG
					   , DESCRIZIONE, UTENTEMODIFICA, DATAMODIFICA
					   , DESCRIZIONE + ' - ' +  (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + CAST(CODICE AS varchar(15))
					   as ava_nomecodice 
FROM         TABPAGAMENTI



GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTA_TABPAGAMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTA_TABPAGAMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTA_TABPAGAMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTA_TABPAGAMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTA_TABPAGAMENTI] TO [Metodo98]
    AS [dbo];

