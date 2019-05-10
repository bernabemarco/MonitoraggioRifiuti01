



CREATE view [dbo].[CRM_Vista_CONS_ALD_TABASA]
as 
SELECT   
(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) as DittaMetodo,
IdASA,
					   Descrizione	  
FROM         CONS_ALD_TABASA





GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_Vista_CONS_ALD_TABASA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_Vista_CONS_ALD_TABASA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_Vista_CONS_ALD_TABASA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_Vista_CONS_ALD_TABASA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_Vista_CONS_ALD_TABASA] TO [Metodo98]
    AS [dbo];

