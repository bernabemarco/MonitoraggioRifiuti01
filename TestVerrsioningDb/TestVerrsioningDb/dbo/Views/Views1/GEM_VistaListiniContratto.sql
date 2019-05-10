
create VIEW [dbo].[GEM_VistaListiniContratto]
as
select 
	t.idGListinoContr, t.Descrizione, 
	isnull(r.idRigaListinoC,0) as  idRigaListinoC,
	isnull(a.idRigaListino,0) as IdRigaListino, 
	isnull(r.QtaRifProvv,0) as QtaRifProvv,
	isnull(a.idAttivita,0) as idAttivita, 
	isnull(a.Listino,0) as Listino, 
	isnull(a.Netto,0) as Netto, 
	isnull(a.Sconto,0) as Sconto, 
	isnull(a.ProvvAg1,0) as ProvvAg1,
	isnull(a.ProvvAg2,0) as ProvvAg2,
	isnull(a.ProvvAg3,0) as ProvvAg3

,isnull(vr.tipologia1,'') as Tipologia1, isnull(r.variante1,'') as Variante1,  DescVariante1,
isnull(vr.tipologia2,'') as Tipologia2, isnull(r.variante2,'') as Variante2, DescVariante2,
isnull(vr.tipologia3,'') as Tipologia3, isnull(r.variante3,'') as Variante3, DescVariante3,
isnull(vr.tipologia4,'') as Tipologia4, isnull(r.variante4,'') as Variante4, DescVariante4,
isnull(vr.tipologia5,'') as Tipologia5, isnull(r.variante5,'') as Variante5, DescVariante5,
isnull(vr.tipologia6,'') as Tipologia6, isnull(r.variante6,'') as Variante6, DescVariante6,
vr.DatainiValidita, vr.DataFineValidita

from  dbo.GEM_ListiniContratti t left outer join dbo.GEM_ListiniContrattoRighe r on t.idGListinoContr=r.idGListinoContr
	left outer join dbo.GEM_ListiniContrattoRigheAttivita a on r.idGlistinoContr = a.idGListinoContr 
		and r.idRigaListinoC = a.idRigaListinoC
	left outer  join [GEM_VistaListiniContrattiRighe] vr
	on r.idGListinoContr= vr.idGListinoContr and  r.IdRigaListinoC=vr.IdRigaListinoC

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaListiniContratto] TO [Metodo98]
    AS [dbo];

