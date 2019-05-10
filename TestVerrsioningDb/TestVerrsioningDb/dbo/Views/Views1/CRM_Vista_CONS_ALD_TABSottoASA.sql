
CREATE view [dbo].[CRM_Vista_CONS_ALD_TABSottoASA]
as 
SELECT     (SELECT     TOP (1) DittaMetodo
                       FROM          ALD_TabDittaDatiAggiuntivi) AS DittaMetodo, IdSottoASA, Descrizione, idAsa
FROM         CONS_ALD_TABSottoASA

GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_Vista_CONS_ALD_TABSottoASA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_Vista_CONS_ALD_TABSottoASA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_Vista_CONS_ALD_TABSottoASA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_Vista_CONS_ALD_TABSottoASA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_Vista_CONS_ALD_TABSottoASA] TO [Metodo98]
    AS [dbo];

