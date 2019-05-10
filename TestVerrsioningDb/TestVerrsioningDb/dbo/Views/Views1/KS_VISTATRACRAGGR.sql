create view KS_VISTATRACRAGGR as
	select distinct idtestadoc,idrigadoc,codart,nrifpartita,idtestacomp,idrigacomp from ks_VistaRintracciabilita

GO
GRANT SELECT
    ON OBJECT::[dbo].[KS_VISTATRACRAGGR] TO [Metodo98]
    AS [dbo];

