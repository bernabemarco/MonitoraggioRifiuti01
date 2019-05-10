

create view [dbo].[CRM_VISTA_TABNAZIONI]
as 
SELECT     (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + CAST(CODICE AS varchar(15)) AS CODNAZIONE
					   , DESCRIZIONE, UTENTEMODIFICA, DATAMODIFICA
FROM         TABNAZIONI


GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTA_TABNAZIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTA_TABNAZIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTA_TABNAZIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTA_TABNAZIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTA_TABNAZIONI] TO [Metodo98]
    AS [dbo];

