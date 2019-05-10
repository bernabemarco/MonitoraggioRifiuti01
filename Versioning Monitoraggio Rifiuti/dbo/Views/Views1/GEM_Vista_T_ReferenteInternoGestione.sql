create view GEM_Vista_T_ReferenteInternoGestione

as

SELECT     CODReferenteInternoGestione, DSCReferente, NOTE, UTENTEMODIFICA, DATAMODIFICA

FROM         GEMMADBG.dbo.GEM_T_ReferenteInternoGestione


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_Vista_T_ReferenteInternoGestione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_Vista_T_ReferenteInternoGestione] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_Vista_T_ReferenteInternoGestione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_T_ReferenteInternoGestione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_Vista_T_ReferenteInternoGestione] TO [Metodo98]
    AS [dbo];

