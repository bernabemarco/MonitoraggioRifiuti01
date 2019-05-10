
CREATE view [dbo].[CRM_VISTA_TABTRASPACURA]
as 
SELECT    
(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) as IdAzienda,	
 (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + CAST(codice AS varchar(15)) AS TRASPACURA
					   , DESCRIZIONE, UTENTEMODIFICA, DATAMODIFICA
FROM         TABTRASPACURA


GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTA_TABTRASPACURA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTA_TABTRASPACURA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTA_TABTRASPACURA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTA_TABTRASPACURA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTA_TABTRASPACURA] TO [Metodo98]
    AS [dbo];

