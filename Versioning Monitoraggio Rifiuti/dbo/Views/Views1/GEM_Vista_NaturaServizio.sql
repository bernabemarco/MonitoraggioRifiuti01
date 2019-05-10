

CREATE VIEW [dbo].[GEM_Vista_NaturaServizio]
AS
SELECT     CODNaturaServizio, DSCNaturaServizio, NOTE, UTENTEMODIFICA, DATAMODIFICA
FROM         GEMMADBG.dbo.GEM_T_NaturaServizio


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_Vista_NaturaServizio] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_Vista_NaturaServizio] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_Vista_NaturaServizio] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_NaturaServizio] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_Vista_NaturaServizio] TO [Metodo98]
    AS [dbo];

