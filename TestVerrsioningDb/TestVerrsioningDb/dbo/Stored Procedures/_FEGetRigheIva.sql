



-- EXEC _FEGetRigheIva '495'; EXEC _FEGetRigheIva '577'; EXEC _FEGetRigheIva '581'
CREATE PROCEDURE [dbo].[_FEGetRigheIva]  (@Chiave1 as varchar(100)) AS 

	--SELECT * FROM ALD_B2B_VISTACASTELLETTIIVAPA WHERE progressivoIva = @Chiave1
SELECT ProgressivoIVA, TaliPAliDet, TaliNaturaEsenzione, IVAImp, IVAImo, EsigibilitaIVA, TaliWEstrEs FROM (
  SELECT
	IDTESTA as ProgressivoIVA,
	ALIQIVA as TaliPAliDet,
	NATURAESENZ as TaliNaturaEsenzione,
	TOTIMPONIBILEVALUTA as IVAImp,
	TOTIMPOSTAVALUTA as IVAImo,
	ESIGIBIVA as EsigibilitaIVA,
	left(DESCRCODIVA +isnull(Dich,''),100) as TaliWEstrEs
  FROM VISTACASTELLETTIIVAPA 	
   left join (SELECT DISTINCT IDTESTA as Progressivo, art,
  ' Dich. Intento del ' +convert (varchar (19),DATAEMISSIONE,103)+ ' Prot. '+NRPROTOCOLLO1 + '/' + CAST(DI.ESERCIZIO AS VARCHAR(4)) +' prog:'+ NRPROTOCOLLO2 as Dich
   FROM VISTAFATTUREELETTRONICHE VFE 
  left join DICHIARAZIONEINTENTO DI on DI.PROGRESSIVO=ProgDichIntento ) as DI ON Progressivo = IDTESTA and art = codiva
  WHERE  IDTESTA = @Chiave1
UNION
-- righe Descrittive con  aliquota IVA diversa dalle righe normali
 SELECT DISTINCT
	IDTESTA as ProgressivoIVA,
	ALIQIVA as TaliPAliDet,
	NATURAESENZ as TaliNaturaEsenzione,
	0 as IVAImp,
	0 as IVAImo,
	'I' as EsigibilitaIVA,
	'' as TaliWEstrEs
     FROM 
	 VISTAFATTUREELETTRONICHE VFE
   WHERE VFE.TIPORIGA='D' AND progressivo = @Chiave1 
   and not exists (SELECT 1 FROM VISTACASTELLETTIIVAPA VC WHERE Vc.IDTESTA = @Chiave1 AND VC.CODIVA = VFE.CodIVA)
	) as DatiRiepilogoIVA
ORDER BY EsigibilitaIVA DESC







