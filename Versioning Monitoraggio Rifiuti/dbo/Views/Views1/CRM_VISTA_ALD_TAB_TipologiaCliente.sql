


CREATE view [dbo].[CRM_VISTA_ALD_TAB_TipologiaCliente]
as 
SELECT   
(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) as IdAzienda,
  (SELECT     TOP (1) IdSocieta
                            FROM          dbo.ALD_TabDittaDatiAggiuntivi)
							+cast(codice as varchar(15)) as idTipologiaCli,
							ALD_TAB_TipologiaCliente.*
							, [Descrizione] + ' - ' +   (SELECT     TOP (1) IdSocieta
                            FROM          dbo.ALD_TabDittaDatiAggiuntivi)
							+cast(codice as varchar(15))
							as ava_nomecodice
FROM         ALD_TAB_TipologiaCliente



GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TAB_TipologiaCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TAB_TipologiaCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TAB_TipologiaCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TAB_TipologiaCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TAB_TipologiaCliente] TO [Metodo98]
    AS [dbo];

