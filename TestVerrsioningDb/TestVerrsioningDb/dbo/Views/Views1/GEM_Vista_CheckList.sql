
CREATE VIEW GEM_Vista_CheckList
AS
SELECT           t1.TitoloChekList,t1.DataInizioValidita,t1.Note AS NoteDiTesta,t2.*
FROM  GEMMADBG.DBO.GEM_T_TestaGCheckLists t1 JOIN GEMMADBG.DBO.GEM_T_RigheGCheckLists t2 ON (t2.CodiceMezzo=t1.CodiceMezzo AND t2.VersioneChekList=t1.VersioneChekList)

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_Vista_CheckList] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_Vista_CheckList] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_Vista_CheckList] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_CheckList] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_Vista_CheckList] TO [Metodo98]
    AS [dbo];

