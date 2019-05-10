
 
-- EXEC _FEGetMasterDocumento '495'; EXEC _FEGetMasterDocumento '577'
CREATE PROCEDURE [dbo].[_FEGetMasterDocumento] (@Chiave1 as varchar(100)) AS

--	SELECT * FROM ALD_B2B_VISTAFATTUREELETTRONICHE WHERE progressivo = @Chiave1

SELECT DISTINCT
	vfe.Progressivo,
	vfe.Progressivo AS MbaisCser, -- nuovo progressivo Invio
	0 as KTTISFattPAProgr, -- progressivo precedente
	'IT' as TnazDISO,
	TD.PARTITAIVA as PartitaIvaAzienda,
	TD.CODICEFISCALE as CodFiscale,
	left(TD.RAGSOCCOGNOME + ' ' + TD.RAGSOCNOME,80) as TaziDTazi,
	TD.[REGIMEFISCALE] as TaziRegimeFiscale,
	left(TD.SEDELEGALE,60) as TaziCrIndiDvia,
	left(TD.NUMSEDELEGALE,2) as IndirizzoNumeroCivico,
	left(TD.[CAPSEDELEGALE],5) as TaziCrIndiDCAP,
	left(TD.[COMUNESEDELEGALE],60) as  TaziCrIndiDlocal , 
	left(TD.[PROVSEDELEGALE],2) as TaziCrIndiDProv ,
	'IT' as IndirizzoNazione
	,ufficioREA as TaziUfficioREA
	,NRREA AS TaziNumeroREA
	,ALD_TabDittaDatiAggiuntivi.CapitaleSocialeREA as CapSociale 
	,'SU' as TipoSocio
	,STATOLIQUIDAZIONEREA AS TaziStatoLiquidazione
	,'' AS TaziCodEORI		--$CodEORI
	,'' AS TaziTipoSocio			--$TipologiaSoci
	,'' AS TaziCrIndiDFax			--$ContattiFax
	,'' AS AsogRifAmmPA		--$CedenteRiferimentoAmministrazione
	,'IT' as TrasmittenteIdPaese, CODICEFISCALE as TrasmittenteIdCodice, 
	(CASE WHEN AC.FLGPUBBLICAAMM =1 THEN  0 ELSE 1 END) as FattTraPrivati,
	(CASE WHEN AC.FLGPUBBLICAAMM =1 THEN  'FPA12' ELSE 'FPR12' END) as FormatoTrasmissioneMetodo,
	(CASE WHEN BC.PROGRESSIVOUFFICIO is null then isnull(BC0.PROGRESSIVOUFFICIO,(CASE WHEN AC.FLGPUBBLICAAMM =1 then'999999' else '0000000' END)) else  BC.PROGRESSIVOUFFICIO END) as AsogIndicePA,
	(CASE WHEN BC.MAIL is null then BC0.MAIL else  BC.MAIL END) as PECDestinatario,
	left(td.preftelefono+td.TELEFONO,12) as TaziCrIndiDtel,
	td.EMAIL as TaziCrIndiDemail,
	 LEFT(AC.[CODICEISO],2) as AsogDISO,
	(CASE WHEN LEFT(AC.[CODICEISO],2) <>'IT'THEN CODIDENTIVAESTERO WHEN AC.PARTITAIVA ='00000000000' THEN '' ELSE  AC.PARTITAIVA END) as ASogDPIVA,
	(CASE WHEN LEFT(AC.[CODICEISO],2) <>'IT' THEN '' ELSE  AC.CODFISCALE END)  as ASogDCodFisc,
	left(AC.[DSCCONTO1] +' '+isnull(AC.[DSCCONTO2],''),80) as AsogDAsog,
	(CASE WHEN indirizzostaborg<>'' THEN left(indirizzostaborg,60) ELSE left(AC.[INDIRIZZO],60) END) as AsogDvia,
	'' as CommittenteIndirizzoNumeroCivico,
	(CASE WHEN capstaborg <>'' THEN left(capstaborg,5) ELSE
	(CASE WHEN (CASE WHEN BC.PROGRESSIVOUFFICIO is null then BC0.PROGRESSIVOUFFICIO else  BC.PROGRESSIVOUFFICIO END) ='XXXXXXX'
	THEN '99999'
	ELSE 	 left(AC.[CAP],5) END ) END) as AsogDCAP,
	(CASE WHEN COMUNESTABORG <>'' THEN LEFT(COMUNESTABORG,60) ELSE LEFT(AC.[LOCALITA],60) END) as AsogDLocal, 
	(CASE WHEN PROVSTABORG <>'' THEN LEFT(PROVSTABORG,2) ELSE left(AC.[PROVINCIA],2) END) as AsogDProv,
	(CASE WHEN CODISOSTABORG <>'' THEN LEFT(CODISOSTABORG,2) ELSE LEFT(AC.[CODICEISO],2) END) as CommittenteIndirizzoNazione,
	'' AS AsogCodEORI, -- CommittenteCodEORI
	BP.TipoDocB2B as TipoDocumento,
	VFE.Divisa as TMonDISO,
	VFE.[DATADOC] as MBaisTins,
	vfe.Numrifdoc as MBaisCMBais,
	DSCDOCUMENTO as MbaisDDescr,
	VFE.[TOTDOCUMENTO] as KTTISTotDocValuta,
	'SC' as ScontoMaggiorazioneTipo,
	PRCSCONTOFINALE as ScontoMaggiorazionePercentuale,
	'SC' as ScontoMaggiorazioneImportoTipo,
	SCONTOINCOND as ScontoMaggiorazioneImporto,
	(CASE WHEN flgbollovirtuale=1 AND TotDocumento>=DaImportoSpeseDoc THEN 'SI' ELSE '' END) as BolloVirtuale, 
	(CASE WHEN flgbollovirtuale=1 AND TotDocumento>=DaImportoSpeseDoc THEN SPESEDOC ELSE 0 END) as   KttisCRVsp4QImpValuta,
	(CASE WHEN flgbollovirtuale=1 AND TotDocumento>=DaImportoSpeseDoc THEN 1 ELSE 0 END) as   KTTISSp4BolVir
	,1 AS KTTISFattPAAbilAll -- per disabilitare gli allegati mettere a 0
	,[CodiceCIG]
    ,[CodiceCUP]


 FROM 
	TABDITTE TD CROSS JOIN
	ALD_TabDittaDatiAggiuntivi CROSS JOIN
	VISTAFATTUREELETTRONICHE VFE
	inner join ANAGRAFICACF AC on VFE.CODCLIFOR = AC.CODCONTO
	LEFT join ALD_B2B_CLIENTI BC on VFE.CODCLIFOR = BC.CODCONTO and VFE.NUMDESTDIVERSAMERCI = BC.[DESTINAZIONEDIVERSA]
	LEFT join ALD_B2B_CLIENTI BC0 on VFE.CODCLIFOR = BC0.CODCONTO and BC0.[DESTINAZIONEDIVERSA] = 0
	inner join ALD_B2B_PARDOC BP on BP.TIPODOC = VFE.TIPODOC
	LEFT join TRATTAMENTOIVA TIVA on VFE.CODIVA = TIVA.codice
	
	
 WHERE progressivo = @Chiave1









