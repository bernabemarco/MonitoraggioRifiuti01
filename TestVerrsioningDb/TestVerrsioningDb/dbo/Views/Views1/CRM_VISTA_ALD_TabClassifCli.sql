

CREATE view [dbo].[CRM_VISTA_ALD_TabClassifCli]
as 
SELECT     
(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) as IdAzienda,
 (SELECT     TOP (1) IdSocieta
                            FROM          dbo.ALD_TabDittaDatiAggiuntivi)+cast(ClassCID as varchar(15)) as ClassCID, Descrizione, UtenteModifica, DataModifica
FROM         ConsMFM.dbo.ALD_TabClassifCli




GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TabClassifCli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TabClassifCli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TabClassifCli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TabClassifCli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TabClassifCli] TO [Metodo98]
    AS [dbo];

