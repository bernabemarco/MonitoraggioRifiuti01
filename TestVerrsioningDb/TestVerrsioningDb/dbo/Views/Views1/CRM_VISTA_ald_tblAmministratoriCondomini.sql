

create view [dbo].[CRM_VISTA_ald_tblAmministratoriCondomini]
as 
SELECT     (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + CAST(IdAmmnistratore AS varchar(15)) AS IdAmmnistratore
					   , Nominativo, indirizzo, cap, 
localita, provincia, telefono, fax, email, Obsoleto, Note, UTENTEMODIFICA, DATAMODIFICA
FROM         ald_tblAmministratoriCondomini


GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTA_ald_tblAmministratoriCondomini] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTA_ald_tblAmministratoriCondomini] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTA_ald_tblAmministratoriCondomini] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTA_ald_tblAmministratoriCondomini] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTA_ald_tblAmministratoriCondomini] TO [Metodo98]
    AS [dbo];

