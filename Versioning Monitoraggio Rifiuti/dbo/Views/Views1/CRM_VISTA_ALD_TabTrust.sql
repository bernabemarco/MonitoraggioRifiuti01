
CREATE view [dbo].[CRM_VISTA_ALD_TabTrust]
as 
SELECT     
(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) as IdAzienda,
(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + CAST(IdTrust AS varchar(15)) AS idTrust, Descrizione, STATOCONTABILITA, STATOMAGAZZINO, STATOORDINI, STATOBOLLE, 
                      STATOFATTURE, STATONOTEACCREDITO, STATOALTRO, CODCATEGORIA, UTENTEMODIFICA, DATAMODIFICA, GrContiPotenziali, Potenziale, ExporSap, 
                      NaturaTrust
FROM         ALD_TabTrust
where ExportCRM=1


GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TabTrust] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TabTrust] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TabTrust] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TabTrust] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTA_ALD_TabTrust] TO [Metodo98]
    AS [dbo];

