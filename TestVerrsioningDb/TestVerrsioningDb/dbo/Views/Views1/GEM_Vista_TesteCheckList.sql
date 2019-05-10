CREATE VIEW [dbo].[GEM_Vista_TesteCheckList]
AS
select CodiceMezzo, VersioneChekList, TitoloChekList, DataInizioValidita , Note,FlagVerStd
from GEMMADBG.dbo.GEM_T_TestaGCheckLists


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_TesteCheckList] TO [Metodo98]
    AS [dbo];

