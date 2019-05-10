

CREATE view [dbo].[CRM_VISTA_ALD_TabDivisioni]
as 
SELECT 
(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) as IdAzienda,	
    (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + CAST(IdDivisione AS varchar(15)) AS CodDivisione
					   , DscDivisione, UTENTEMODIFICA, DATAMODIFICA
FROM         Ald_TabDivisioni


GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TabDivisioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TabDivisioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TabDivisioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TabDivisioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TabDivisioni] TO [Metodo98]
    AS [dbo];

