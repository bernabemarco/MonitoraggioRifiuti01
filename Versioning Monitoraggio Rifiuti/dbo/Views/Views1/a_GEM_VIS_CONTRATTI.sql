




CREATE view [dbo].[a_GEM_VIS_CONTRATTI]  as
-- vista per profilo visione a_GEM_VIS_CONTRATTI, dt 08.02.2018
select TC.*

, (SELECT DSCStato FROM [GEM_Vista_StatoContratto] WHERE [IdStato]=TC.[IdStato]) AS DSCStato
, (SELECT DSCCONTO1 FROM Anagraficacf WHERE CodConto=TC.CODCLIENTE) AS DSCCONTO1
, (SELECT DSCCategoria FROM [GEM_Vista_CategoriaContratto] WHERE [CODCategoriaContratto]=TC.[CODCategoriaContratto]) AS DSCCategoria
, (SELECT DscAgente FROM [anagraficaagenti] WHERE [CodAgente]=TC.[CodAgente1]) AS DescAgente1
, (SELECT Descrizione FROM [GEM_Vista_ModalitaFatturazione] WHERE [idModFatt]=TC.[idModFatt]) AS DSCModalit
, (select ValoreTotaleContratto from GEM_Vista_ValoriContrattiGemma as V_ValContr where V_ValContr.idcontratto=TC.idcontratto) as ValTotaleContrattoOP
, (select ava_valoreannualemedio from GEM_Vista_ValoriContrattiGemma as V_ValContr where V_ValContr.idcontratto=TC.idcontratto) as valoreannualemedio
, (select NrEstintoriAttivi from GEM_Vista_ValoriContrattiGemma as V_ValContr where V_ValContr.idcontratto=TC.idcontratto) as NrEstAttivi 
, (select NrIdrantiAttivi from GEM_Vista_ValoriContrattiGemma as V_ValContr where V_ValContr.idcontratto=TC.idcontratto) as NrIdrAttivi
, (select NrImpiantiAttivi from GEM_Vista_ValoriContrattiGemma as V_ValContr where V_ValContr.idcontratto=TC.idcontratto) as NrImpAttivi
, (select NrAltriMezziAttivi from GEM_Vista_ValoriContrattiGemma as V_ValContr where V_ValContr.idcontratto=TC.idcontratto) as NrAltriMAttivi
, 1 as PerContaIdContratti
 from GEM_TESTACONTRATTO as TC





GO
GRANT SELECT
    ON OBJECT::[dbo].[a_GEM_VIS_CONTRATTI] TO [Metodo98]
    AS [dbo];

