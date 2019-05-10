


--SELECT top 1 * FROM  ALD_B2B_VISTAFATTUREELETTRONICHE_RIGHE
--SELECT top 1 * FROM  ALD_B2B_VISTASPESEFATTB2B
-- EXEC _FEGetRigheDocumento '495'; EXEC _FEGetRigheDocumento '577'
CREATE PROCEDURE [dbo].[_FEGetRigheDocumento] (@Chiave1 as varchar(100)) AS

	-- SELECT * FROM  ALD_B2B_VISTAFATTUREELETTRONICHE_RIGHE WHERE progressivo = @Chiave1 
	-- UNION
	-- SELECT * FROM  ALD_B2B_VISTASPESEFATTB2B WHERE progressivo = @Chiave1 
	-- order by RbaisCSer

 SELECT 
	vfe.Progressivo,
	VFE.POSIZIONE as RbaisCSer,
	(CASE WHEN VFE.TIPORIGA = 'S' THEN 'AC'ELSE '' END) as TtsoTipoPrestazione,
	REPLACE((CASE WHEN VFE.[DESCRIZIONEART]='' THEN '.' ELSE VFE.[DESCRIZIONEART] END),'€','E')  as RbaisDaart,
	--(CASE WHEN VFE.[PREZZOUNITLORDO] <> 0.0 THEN VFE.[TOTLORDORIGA] / VFE.[PREZZOUNITLORDO ] ELSE VFE.[QTAGEST] END) as RbaisQoum,
	VFE.[QTAGEST] as RbaisQoum,
	VFE.[UMGEST] as  TumsCTums,
	--VFE.[PREZZOUNITLORDO]  as HCAISCrPrzQImpValuta, 
	(CASE WHEN DIVISA='EUR' THEN VFE.[PREZZOUNITNETTOEURO] ELSE VFE.[PREZZOUNITNETTO]  END) as HCAISCrPrzQImpValuta,
	--VFE.[TOTNETTORIGA] - VFE.[TOTNETTORIGA]*PRCSCONTOFINALE/100.0 as ImponibileTotaleRiga,
	(CASE WHEN DIVISA='EUR' THEN VFE.[TOTNETTORIGAEURO]  ELSE VFE.[TOTNETTORIGA]  END) as ImponibileTotaleRiga,
	VFE.[ALIQIVA] as TaliPAliDet,
	(CASE WHEN COALESCE(CODIVA,0)=0 THEN 'N2' ELSE 
		COALESCE((SELECT NATURAESENZPA FROM TRATTAMENTOIVA WHERE CODICE=CODIVA),'') END) as TaliNaturaEsenzione, 
	'SC' as ScontoMaggiorazioneRigaTipo,
	-- VFE.SCONTORIGA as ScontoMaggiorazioneRigaPercentuale,   -- sconto riga
	0  as ScontoMaggiorazioneRigaPercentuale,  -- sconto riga
	--'' AS ScontoMaggiorazioneRigaImporto,
	'SC' as PiedeScontoMaggiorazioneTipo,
	PRCSCONTOFINALE as PiedeScontoMaggiorazionePercentuale --sconto piede
   FROM 
	 VISTAFATTUREELETTRONICHE VFE
   WHERE VFE.TIPORIGA<>'R' AND progressivo = @Chiave1 
	 
 UNION
  -- SPESE CON IVA
 SELECT 
	IDTESTA	as progressivo,
	posspesa as RbaisCser,
	'AC' AS TtsoTipoPrestazione,
	DescrizioneRiga	AS RbaisDaart,
	1  as RbaisQoum,
	'' as tumsctums,
	PrezzoUnitario	AS HCAISCrPrzQImpValuta,
	PrezzoTotale	AS ImponibileTotaleRiga,
	ALIQIVA as TaliPAliDet,
	NATURAESENZ	 AS TaliNaturaEsenzione,
	'' as ScontoMaggiorazioneRigaTipo,
	0.0 as ScontoMaggiorazioneRigaPercentuale,
	--'' as ScontoMaggiorazioneRigaImporto,
	'' as PiedeScontoMaggiorazioneTipo,
	0.0 as PiedeScontoMaggiorazionePercentuale
	FROM VISTASPESEFATTB2B 
    WHERE 	IDTESTA = @Chiave1 and CODIVASPESA <> 0

-- SPESE SENZA IVA
UNION
 SELECT 
	IDTESTA	as progressivo,
	posspesa as RbaisCser,
	'AC' AS TtsoTipoPrestazione,
	DescrizioneRiga	AS RbaisDaart,
	1  as RbaisQoum,
	'' as tumsctums,
	PrezzoUnitario	AS HCAISCrPrzQImpValuta,
	PrezzoTotale	AS ImponibileTotaleRiga,
	TaliPAliDetdDoc as TaliPAliDet,
	TaliNaturaEsenzioneDoc	 AS TaliNaturaEsenzione,
	'' as ScontoMaggiorazioneRigaTipo,
	0.0 as ScontoMaggiorazioneRigaPercentuale,
	--'' as ScontoMaggiorazioneRigaImporto,
	'' as PiedeScontoMaggiorazioneTipo,
	0.0 as PiedeScontoMaggiorazionePercentuale
	FROM VISTASPESEFATTB2B 
	left JOIN ( SELECT top 1
				IDTESTA as ProgressivoIVADoc,
				ALIQIVA as TaliPAliDetdDoc,
				NATURAESENZ as TaliNaturaEsenzioneDoc
				 FROM VISTACASTELLETTIIVAPA 	
				 WHERE  IDTESTA = @Chiave1 and isnull ((SELECT ESCLUDIRIP FROM TRATTAMENTOIVA WHERE CODICE =CODIVA),0)=0 )  as IVADoc
				 on ProgressivoIVADoc = IDTESTA
    WHERE 	IDTESTA = @Chiave1 and CODIVASPESA = 0
  ORDER BY RbaisCSer
	


