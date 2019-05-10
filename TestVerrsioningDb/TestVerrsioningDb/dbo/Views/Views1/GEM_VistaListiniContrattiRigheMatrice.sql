CREATE VIEW [dbo].[GEM_VistaListiniContrattiRigheMatrice]
as
select 
lt.idGListinoContr, lt.Descrizione, idRigaListinoC, 
lt.idGListinoModello, lm.descrizione as DescListinoModello,
isnull(lm.tipologia1,'') as Tipologia1, isnull(lr.variante1,'') as Variante1, isnull(t1.Descrizione,'') as DescVariante1,
isnull(lm.tipologia2,'') as Tipologia2, isnull(lr.variante2,'') as Variante2, isnull(t2.Descrizione,'') as DescVariante2,
isnull(lm.tipologia3,'') as Tipologia3, isnull(lr.variante3,'') as Variante3, isnull(t3.Descrizione,'') as DescVariante3,
isnull(lm.tipologia4,'') as Tipologia4, isnull(lr.variante4,'') as Variante4, isnull(t4.Descrizione,'') as DescVariante4,
isnull(lm.tipologia5,'') as Tipologia5, isnull(lr.variante5,'') as Variante5, isnull(t5.Descrizione,'') as DescVariante5,
isnull(lm.tipologia6,'') as Tipologia6, isnull(lr.variante6,'') as Variante6, isnull(t6.Descrizione,'') as DescVariante6,
lr.DatainiValidita, lr.DataFineValidita, lr.qtarifprovv

from  dbo.GEM_ListiniContrattiMatrice lt inner join dbo.GEM_ListiniContrattoRigheMatrice lr on lt.idGListinoContr= lr.idGListinoContr
	left outer join GEMMADBG.dbo.GEM_T_ListiniModello lm on lt.idGListinoModello = lm.idGListinoModello
	left outer join  tabvarianti t1 on lm.tipologia1 collate Latin1_General_CI_AS =t1.Tipologia and lr.variante1 = t1.variante
	left outer join  tabvarianti t2 on lm.tipologia2 collate Latin1_General_CI_AS =t2.Tipologia and lr.variante2 = t2.variante
	left outer join  tabvarianti t3 on lm.tipologia3 collate Latin1_General_CI_AS =t3.Tipologia and lr.variante3 = t3.variante
	left outer join  tabvarianti t4 on lm.tipologia4 collate Latin1_General_CI_AS =t4.Tipologia and lr.variante4 = t4.variante
	left outer join  tabvarianti t5 on lm.tipologia5 collate Latin1_General_CI_AS =t5.Tipologia and lr.variante5 = t5.variante
	left outer join  tabvarianti t6 on lm.tipologia6 collate Latin1_General_CI_AS =t6.Tipologia and lr.variante6 = t6.variante


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_VistaListiniContrattiRigheMatrice] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaListiniContrattiRigheMatrice] TO [Metodo98]
    AS [dbo];

