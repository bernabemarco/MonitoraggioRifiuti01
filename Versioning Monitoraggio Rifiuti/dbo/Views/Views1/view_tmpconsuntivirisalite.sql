

CREATE VIEW view_tmpconsuntivirisalite
AS
SELECT     tmpConsuntivatiRisalita.CONTRATTO, tmpConsuntivatiRisalita.PROGRESSIVODOCCONSUNTIVAZIONE, tmpConsuntivatiRisalita.sessione, 
           tmpConsuntivatiRisalita.NRTERMINALE,
           tmpConsuntivatiRisalita.FINOALLADATA,
           tmpConsuntivatiRisalita.DATACONSUNTIV,
           tmpConsuntivatiRisalita.PROGRESSIVODOCORIGINE, TESTEDOCUMENTI.TIPODOC, TESTEDOCUMENTI.DATADOC, 
           TESTEDOCUMENTI.CODCLIFOR, TESTEDOCUMENTI.CODCFFATT, TESTEDOCUMENTI.NUMDESTDIVERSAMERCI, 
           TESTEDOCUMENTI.NUMERODOC
FROM         tmpConsuntivatiRisalita INNER JOIN
         TESTEDOCUMENTI ON tmpConsuntivatiRisalita.PROGRESSIVODOCORIGINE = TESTEDOCUMENTI.PROGRESSIVO



GO
GRANT SELECT
    ON OBJECT::[dbo].[view_tmpconsuntivirisalite] TO [Metodo98]
    AS [dbo];

