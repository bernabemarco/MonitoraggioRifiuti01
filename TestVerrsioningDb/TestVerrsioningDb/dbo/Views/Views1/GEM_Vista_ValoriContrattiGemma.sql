






CREATE VIEW  [dbo].[GEM_Vista_ValoriContrattiGemma]
AS
SELECT   VC.IDCONTRATTO, VC.DURATA, VC.DATACONTRATTO, VC.DATAEFFICACIA, 
TC.DATAPVISITA,
--DataContratto
--DataEfficacia
TC.DATASCADENZA,
VC.DataIdStato,
--StContr.DSCStato,
StContr.DSCStato as ava_statocontratto,
CAST(VC.CODCategoriaContratto AS VARCHAR(10)) 
                      + ' - ' + CatContr.DSCCATEGORIA AS Ava_DSCCATEGORIAContratto,
                          (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_1) + VC.CODCLIENTE AS codConto, VC.CODCLIENTE, 
                          (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_2) + TC.CODCLIFAT AS CODCFFATT,		
							TC.CODCLIFAT,
TC.RIFCOMMCLI,												
							--VC.IdStato, 
							--VC.DataIdStato, 
                      VC.CodAgente1, 
                          (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_3) +  VC.CodAgente1 AS ava_agente1,
					  isnull(VC.CodAgente2, '') as CodAgente2, 
                          (case when isnull(VC.CodAgente2,'')='' then '' 
							else
						  (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_4) +  VC.CodAgente2 
							end)
							AS ava_agente2,	
							--NrSediInManuntezione
					(
SELECT     COUNT(DISTINCT CODDEST) AS contaSezioni
FROM         GEM_SEZIONICONTRATTO AS SC
WHERE     (IDCONTRATTO = VC.IDCONTRATTO) AND (ISNULL(FLAG_ELIMINATO, '0') IN ('','0', 'N'))
)	as	NrSediInManuntezione,
-- NrAltriMezziAttivi
isnull((SELECT     SUM(ISNULL(SCM.QUANTITA, 1)) AS nrAltriMezzi
FROM         GEM_SEZIONICONTRATTO AS SC INNER JOIN
                      GEM_SEZIONICONTRATTODETTMEZZI AS SCM ON SC.IDCONTRATTO = SCM.IDCONTRATTO AND SC.SEZIONECONTRATTO = SCM.SEZIONECONTRATTO INNER JOIN
                      GEM_Vista_CodiciMezziAssegnati AS CodMezzAss ON SC.idTipologMezzo = CodMezzAss.idTipologMezzo AND 
                      SC.CodiceMezzo = CodMezzAss.CodiceMezzo COLLATE SQL_Latin1_General_CP1_CI_AS
WHERE     (SC.IDCONTRATTO = VC.IDCONTRATTO) 
AND (ISNULL(SC.FLAG_ELIMINATO, '0') IN ('', '0', 'N')) AND (CodMezzAss.TipoRapporto = 'D')
and (isnull(SCM.ELIMINATO,0) in (0))
),0) as NrAltriMezziAttivi,
-- NrEstintoriAttivi
isnull((SELECT     SUM(ISNULL(SCM.QUANTITA, 1)) AS nrMezziEst
FROM         GEM_SEZIONICONTRATTO AS SC INNER JOIN
                      GEM_SEZIONICONTRATTODETTMEZZI AS SCM ON SC.IDCONTRATTO = SCM.IDCONTRATTO AND SC.SEZIONECONTRATTO = SCM.SEZIONECONTRATTO INNER JOIN
                      GEM_Vista_CodiciMezziAssegnati AS CodMezzAss ON SC.idTipologMezzo = CodMezzAss.idTipologMezzo AND 
                      SC.CodiceMezzo = CodMezzAss.CodiceMezzo COLLATE SQL_Latin1_General_CP1_CI_AS
WHERE     (SC.IDCONTRATTO = VC.IDCONTRATTO) 
AND (ISNULL(SC.FLAG_ELIMINATO, '0') IN ('', '0', 'N')) AND (CodMezzAss.TipoRapporto = 'E')
and (isnull(SCM.ELIMINATO,0) in (0))
),0) as NrEstintoriAttivi,		
-- NrIdrantiAttivi
isnull((SELECT     SUM(ISNULL(SCM.QUANTITA, 1)) AS nrMezziIdranti
FROM         GEM_SEZIONICONTRATTO AS SC INNER JOIN
                      GEM_SEZIONICONTRATTODETTMEZZI AS SCM ON SC.IDCONTRATTO = SCM.IDCONTRATTO AND SC.SEZIONECONTRATTO = SCM.SEZIONECONTRATTO INNER JOIN
                      GEM_Vista_CodiciMezziAssegnati AS CodMezzAss ON SC.idTipologMezzo = CodMezzAss.idTipologMezzo AND 
                      SC.CodiceMezzo = CodMezzAss.CodiceMezzo COLLATE SQL_Latin1_General_CP1_CI_AS
WHERE     (SC.IDCONTRATTO = VC.IDCONTRATTO) 
AND (ISNULL(SC.FLAG_ELIMINATO, '0') IN ('', '0', 'N')) AND (CodMezzAss.TipoRapporto = 'I')
and (isnull(SCM.ELIMINATO,0) in (0))
),0) as NrIdrantiAttivi,						
-- NrImpiantiAttivi
isnull((SELECT     SUM(ISNULL(SCM.QUANTITA, 1)) AS nrMezziImpianti
FROM         GEM_SEZIONICONTRATTO AS SC INNER JOIN
                      GEM_SEZIONICONTRATTODETTMEZZI AS SCM ON SC.IDCONTRATTO = SCM.IDCONTRATTO AND SC.SEZIONECONTRATTO = SCM.SEZIONECONTRATTO INNER JOIN
                      GEM_Vista_CodiciMezziAssegnati AS CodMezzAss ON SC.idTipologMezzo = CodMezzAss.idTipologMezzo AND 
                      SC.CodiceMezzo = CodMezzAss.CodiceMezzo COLLATE SQL_Latin1_General_CP1_CI_AS
WHERE     (SC.IDCONTRATTO = VC.IDCONTRATTO) 
AND (ISNULL(SC.FLAG_ELIMINATO, '0') IN ('', '0', 'N')) AND (CodMezzAss.TipoRapporto = 'V')
and (isnull(SCM.ELIMINATO,0) in (0))
),0) as NrImpiantiAttivi,	
					  --SUM(VC.ImportoVisita) AS TImportoVisita, 
					  --SUM(VC.NrVisiteTot) AS TNrVisiteTot, 
					  --SUM(VC.Quantita) AS TQuantita, 
                      --SUM(VC.TotaleImportoAT1) AS TTotaleImportoAT1, SUM(VC.TotaleImportoAT2) AS TTotaleImportoAT2, SUM(VC.TotaleImportoAT3) AS TTotaleImportoAT3, 
                      --SUM(VC.TotaleImportoAT4) AS TTotaleImportoAT4, SUM(VC.TotaleImportoAT5) AS TTotaleImportoAT5, SUM(VC.TotImportoVisita) AS TTotImportoVisita, 
                      SUM(VC.TotContratto) AS ValoreTotaleContratto, 
					  (case when VC.DURATA<12 then SUM(VC.TotContratto) else SUM(VC.ValoreRateoMensile)*12 end) As ava_valoreannualemedio,
					  --SUM(VC.ValoreRateoMensile) AS TValoreRateoMensile, 
					  --SUM(VC.ValoreRateoPrimoEsercizio) AS TValoreRateoPrimoEsercizio, 

                      --MAX(VC.NuovoContratto) AS NuovoContratto, MAX(VC.PCONTR) AS PCONTR, MAX(VC.CONTRORIG) AS CONTRORIG, MAX(VC.RIN_PCONTR) AS RIN_PCONTR, 
                      MAX(VC.OrigineCommContratto) AS OrigineCommContratto, 
					  TipoFatt.Descrizione AS ava_tipofatturazionecontratto
					  ,
					  (select top 1 DATA_EFF as DataUltimaVisita from GEM_SEZIONECONTRATTORAPPORTI RP where rp.IDCONTRATTO=VC.IDCONTRATTO and len(DATA_EFF)>0 order by DATA_EFF desc) as DataUltimaVisita
FROM         GEM_Vista_CalcoloValoriContratti AS VC INNER JOIN
                      EXTRACLIENTI AS ExC ON VC.CODCLIENTE = ExC.CODCONTO INNER JOIN
                      GEM_Vista_CategoriaContratto AS CatContr ON VC.CODCategoriaContratto = CatContr.CODCategoriaContratto INNER JOIN
                      GEM_TESTACONTRATTO AS TC ON VC.IDCONTRATTO = TC.IDCONTRATTO INNER JOIN
                      GEM_Vista_StatoContratto AS StContr ON VC.IdStato = StContr.IdStato INNER JOIN
                      GEM_Vista_TipologieFatturazione AS TipoFatt ON TC.idTipoFatt = TipoFatt.idTipoFatt
WHERE    
( 
1=1
--(VC.IdStato = '1') or (VC.IdStato = '4' and year(TC.DATA_DIS)>=2017))

--AND (ISNULL(ExC.CodCRM, '') <> '') --AND (YEAR(VC.DATAEFFICACIA) >= 2016
--)
and VC.DURATA<>0
--and VC.CODCategoriaContratto<>50
)
GROUP BY VC.DURATA, VC.IDCONTRATTO, 
VC.DATACONTRATTO, VC.DATAEFFICACIA, 
TC.DATAPVISITA,
--DataContratto
--DataEfficacia
TC.DATASCADENZA,
TC.RIFCOMMCLI,
VC.DataIdStato,
StContr.DSCStato,
VC.CODCLIENTE, TC.CODCLIFAT, --VC.IdStato, 
--VC.DataIdStato, 
VC.CodAgente1, VC.CodAgente2, 
                      CAST(VC.CODCategoriaContratto AS VARCHAR(10)) + ' - ' + CatContr.DSCCATEGORIA
                      --VC.CODCategoriaContratto + ' - ' + CatContr.DSCCATEGORIA
, TipoFatt.Descrizione



GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_Vista_ValoriContrattiGemma] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_Vista_ValoriContrattiGemma] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_Vista_ValoriContrattiGemma] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_ValoriContrattiGemma] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_Vista_ValoriContrattiGemma] TO [Metodo98]
    AS [dbo];

