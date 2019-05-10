

create view [dbo].[CRM_VISTA_ALD_TABRESPONSABILI]
as 
SELECT     
(SELECT     TOP (1) IdSocieta
                            FROM          dbo.ALD_TabDittaDatiAggiuntivi)+cast(CODICE as varchar(15)) as ResponsabileID, 
TABRESPONSABILI.*
FROM         TABRESPONSABILI


GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TABRESPONSABILI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TABRESPONSABILI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TABRESPONSABILI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TABRESPONSABILI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TABRESPONSABILI] TO [Metodo98]
    AS [dbo];

