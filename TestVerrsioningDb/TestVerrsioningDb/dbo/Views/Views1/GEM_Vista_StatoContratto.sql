

CREATE VIEW [dbo].[GEM_Vista_StatoContratto]
AS
SELECT     IdStato, DSCStato, NOTE, UTENTEMODIFICA, DATAMODIFICA, flagTipoObblig, DefaultTipoContratto_NewINS
FROM         GEMMADBG.dbo.GEM_T_StatoContratto


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_StatoContratto] TO [Metodo98]
    AS [dbo];

