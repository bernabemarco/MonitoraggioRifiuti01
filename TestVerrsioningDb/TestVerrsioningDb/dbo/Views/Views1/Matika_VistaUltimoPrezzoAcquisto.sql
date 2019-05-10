create view  Matika_VistaUltimoPrezzoAcquisto as
select * from STORICOPREZZIARTICOLO where TIPOPREZZO='F' and ultimo=1

GO
GRANT DELETE
    ON OBJECT::[dbo].[Matika_VistaUltimoPrezzoAcquisto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Matika_VistaUltimoPrezzoAcquisto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Matika_VistaUltimoPrezzoAcquisto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Matika_VistaUltimoPrezzoAcquisto] TO [Metodo98]
    AS [dbo];

