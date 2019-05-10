create view ald_VistaResponsabiliCoordinCommessa
as 
select * from TABRESPONSABILI where TipolResp='CC'

GO
GRANT DELETE
    ON OBJECT::[dbo].[ald_VistaResponsabiliCoordinCommessa] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ald_VistaResponsabiliCoordinCommessa] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ald_VistaResponsabiliCoordinCommessa] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ald_VistaResponsabiliCoordinCommessa] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ald_VistaResponsabiliCoordinCommessa] TO [Metodo98]
    AS [dbo];

