
CREATE VIEW [dbo].[CONTRATTILIQUIDAZIONE_UNIONEINCONDIZIONATI]
AS
SELECT     *
FROM         dbo.CONTRATTILIQUIDAZIONE_CLVALORE
UNION
SELECT     *
FROM         contrattiliquidazione_clmercevalore
UNION
SELECT     *
FROM         contrattiliquidazione_clmerceqta
UNION
SELECT     *
FROM         contrattiliquidazione_clperc


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTILIQUIDAZIONE_UNIONEINCONDIZIONATI] TO [Metodo98]
    AS [dbo];

