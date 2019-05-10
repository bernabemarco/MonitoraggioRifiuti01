

CREATE VIEW [dbo].[GEM_Vista_CategoriaContratto]
AS
SELECT     CC.CODCategoriaContratto, CC.DSCCATEGORIA, CC.NOTE, CC.UTENTEMODIFICA, CC.DATAMODIFICA, CC.CODNaturaServizio, NS.DSCNaturaServizio, 
                      CC.FlgTacitoRinnovo
FROM         GEMMADBG.dbo.GEM_T_CategoriaContratto AS CC INNER JOIN
                      GEMMADBG.dbo.GEM_T_NaturaServizio AS NS ON CC.CODNaturaServizio = NS.CODNaturaServizio

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_CategoriaContratto] TO [Metodo98]
    AS [dbo];

