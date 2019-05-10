

-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ GRI_Vista_CheckList
CREATE VIEW [dbo].[GRI_Vista_CheckList]
AS
SELECT t1.TitoloChekList,t1.DataInizioValidita,t1.Note AS NoteDiTesta,t2.*
FROM GRI_T_TestaGCheckLists t1 JOIN GRI_T_RigheGCheckLists t2 ON (t2.CodiceMezzo=t1.CodiceMezzo AND t2.VersioneChekList=t1.VersioneChekList)

GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_Vista_CheckList] TO [Metodo98]
    AS [dbo];

