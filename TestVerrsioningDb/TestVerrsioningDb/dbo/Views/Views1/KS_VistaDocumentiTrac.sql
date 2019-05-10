create view KS_VistaDocumentiTrac as
	select TRC.IDTESTADOC,
	TRC.IDRIGADOC,
	TRC.nrifpartita as LottoComposto,
	TRC.codart as CodArtComposto, 
	TRC.qta1um as Qta1UM_Composto, 
	TRC.ProgComponente, 
	TRC.LottoComponente, 
	TRC.ArtComponente, 
	TRC.QtaComponente, 
	TRC.UM as UM_Componente,
	TRC.IdTestaComp, 
	TRC.IDRigaComp,
	VD.*,
	ACF.Telex as EMAIL,
	ACF.Fax as FAX
	from ks_vistarintracciabilita TRC
	inner join vistadocumentibase VD
	on (TRC.IDTESTADOC = VD.IDTESTA and TRC.IDRIGADOC=VD.PROGRIGADOC)
	inner join AnagraficaCF ACF on (ACF.Codconto = VD.CodCliFor)

GO
GRANT SELECT
    ON OBJECT::[dbo].[KS_VistaDocumentiTrac] TO [Metodo98]
    AS [dbo];

