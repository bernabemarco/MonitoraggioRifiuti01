
CREATE VIEW GEM_VistaListiniGenerali
AS SELECT
  tm.idGListinoModello, tm.idTipologMezzo,
  isnull(tg.Tipologia1,'') as Tipologia1,
  isnull(tg.Tipologia2,'') as Tipologia2,
  isnull(tg.Tipologia3,'') as Tipologia3,
  isnull(tg.Tipologia4,'') as Tipologia4,
  isnull(tg.Tipologia5,'') as Tipologia5,
  isnull(tg.Tipologia6,'') as Tipologia6,
  rm.IdRigaListinoModello,
  rm.idGListino,
  rm.idAttivita,
  rm.idGProvvigioni,
  rg.idRigaListino,
  rg.DaQta, rg.AQTa, rg.Prezzo,
  rg.Datainivalidita, rg.DataFineValidita,
  isnull(rg.Variante1,'') as Variante1,
  isnull(rg.Variante2,'') as Variante2,
  isnull(rg.Variante3,'') as Variante3,
  isnull(rg.Variante4,'') as Variante4,
  isnull(rg.Variante5,'') as Variante5,
  isnull(rg.Variante6,'') as Variante6
  from GEMMADBG.dbo.GEM_T_ListiniModello tm inner  join  GEMMADBG.dbo.GEM_T_RigheListiniModello rm on tm.idgListinoModello=rm.idgListinoModello
    inner join GEMMADBG.dbo.GEM_T_Listini tg on tg.idgListino=rm.idGListino
    inner join GEMMADBG.dbo.GEM_T_RigheListini rg on tg.idGListino = rg.idGListino and rg.Idattivita = rm.IdAttivita

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaListiniGenerali] TO [Metodo98]
    AS [dbo];

