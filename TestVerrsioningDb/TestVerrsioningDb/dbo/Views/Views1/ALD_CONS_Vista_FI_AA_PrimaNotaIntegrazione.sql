
CREATE view [dbo].ALD_CONS_Vista_FI_AA_PrimaNotaIntegrazione as
SELECT        (SELECT        TOP (1) IdSocieta
                          FROM            ALD_TabDittaDatiAggiuntivi) AS IdSocieta, 
TC.PROGRESSIVO AS numeroDoc, 
CAST(DATEPART(YYYY, TC.DATARIF) AS varchar(4)) + RIGHT('00' + CAST(DATEPART(MM, TC.DATARIF) AS varchar(2)), 2) + RIGHT('00' + CAST(DATEPART(DAY, TC.DATARIF) AS varchar(2)), 2) AS DtDocumento, 
CAST(DATEPART(YYYY, TC.DATAREG) AS varchar(4)) + RIGHT('00' + CAST(DATEPART(MM, TC.DATAREG) AS varchar(2)), 2) + RIGHT('00' + CAST(DATEPART(DAY, TC.DATAREG) AS varchar(2)), 2) AS DtRegistrazione, 
RIGHT('00' + CAST(DATEPART(MM, TC.DATAREG) AS varchar(2)), 2) AS Periodo, 
ConvSap.TipoDoc,
TC.NRRIFER AS Riferimento, 
'RIF.' 
--+ cast((select TOP (1) NumDoc from RIGHEIVA where RIGHEIVA.NRREG=TC.PROGRESSIVO) as varchar(8))
--+ CAST(DATEPART(YYYY, TC.DATAREG) AS varchar(4))
+ cast(tc.CAUSALE as varchar(4))
+ ' ' 
+ (SELECT TOP (1) IdSocieta FROM ALD_TabDittaDatiAggiuntivi)
+ CAST(TC.PROGRESSIVO AS VARCHAR(8)) 
--+ isnull(TD.TIPODOC,'') 
AS TestoTestata,
(case when isnull(ConvSap.ChContabile,'')<>'' then ConvSap.ChContabile else 
	(case when left(rc.conto,1)='C' then  ConvSap.ChContabileCliente else 
		(case when left(rc.conto,1)='F' then  ConvSap.ChContabileFornitore else 
			ConvSap.ChContabileGenerico
		end) --end case3
	end) --end case2
end) --end case1
as ChContabile,
 
(select top(1) CodSap from ALD_CONS_Vista_Union_VociExtraSap  where ALD_CONS_Vista_Union_VociExtraSap.codconto=RC.CONTO ) as ContoSAP,
--RC.IMPORTOEURO as ImportoDivDoc, 
replace(cast(cast((case when isnull(MCDC.progressivo,0)=0  then RC.IMPORTOEURO else MCDC.IMPORTORIPEURO end) as decimal(19,2)) as varchar(15)), '.', ',') as ImportoDivDoc,
'' as divisaDoc,
'' as cambio,
isnull((select top(1) CogesSpeciale from ALD_CONS_Vista_Union_VociExtraSap  where ALD_CONS_Vista_Union_VociExtraSap.codconto=RC.CONTO ),'') as ContoCogeS,
--ConvSap.AliquotaIva, 
'' as AliquotaIva, 
'' as SettoreContabile,
isnull(MCDC.CODCONTOCC,'') as CDC,		
(
case when isnull((select top(1) flgNoExportSap from ALD_CONS_Vista_Union_VociExtraSap AVU  where AVU.codconto=RC.CONTO),'0')='0' then 			 
(SELECT  ExCom.WBS1Societa + ExCom.WBS1Progressivo + ExCom.WBS2Gestione + ExCom.WBS3Servizio + 
(CASE WHEN isnull(ExCom.WBS3Provincia, '') = '' THEN  ExCom.WBS3Regione ELSE ExCom.WBS3Provincia END) 
 + ExCom.WBS3DestDuso + ExCom.WBS3Separatore + ExCom.WBS4Prestazione + ExCom.WBS4Separatore 
 + ExCom.WBS5ModErogazione AS RifCMFM
FROM ExtraCommCli AS ExCom INNER JOIN
 AnagraficaCommesse AS AC ON ExCom.RifProgressivo = AC.Progressivo
where AC.RifComm=RC.CODCOMMESSA) 
else '' end)
as RifComMFM,
left((cast(tc.CAUSALE as varchar(4)) + ' ' + CC.descrizione + '. ' + tc.descrizione), 50) as TestoPosizione,
(case when left(rc.conto,1)='G' then 
(select top(1) IdSocietaPartnerMNC from ALD_CONS_Vista_Union_VociExtraSap AVU  where AVU.codconto=RC.CONTO)
else '' end) as IdSocPartnerMFM,
(case when rc.SEGNO=0 then 
(select top(1) TMVDare from ALD_CONS_Vista_Union_VociExtraSap AVU  where AVU.codconto=RC.CONTO)
else 
(select top(1) TMVAvere from ALD_CONS_Vista_Union_VociExtraSap AVU  where AVU.codconto=RC.CONTO) 
end) as TMVConsolidamento,
(case when isnull((select count(CODBANCA) from ANAGRAFICABANCHE AB where AB.CODCONTORIF=RC.CONTO),0)=1 
	then 
		CAST(DATEPART(YYYY, TC.DATAREG) AS varchar(4)) + RIGHT('00' + CAST(DATEPART(MM, TC.DATAREG) AS varchar(2)), 2) + RIGHT('00' + CAST(DATEPART(DAY, TC.DATAREG) AS varchar(2)), 2) 
	else ''
	end)
AS DtValuta, 
rc.conto + ' pos.' + cast(rc.POSIZIONE as varchar(4)) + '/' + cast(isnull(MCDC.posizione,0) as varchar(4))
as Attribuzione,
'' as ChiaveRif3,
--CAST(DATEPART(YYYY, TC.DATAREG) AS varchar(4)) + RIGHT('00' + CAST(DATEPART(MM, TC.DATAREG) AS varchar(2)), 2) + RIGHT('00' + CAST(DATEPART(DAY, TC.DATAREG) AS varchar(2)), 2) AS DtScadenza, 
'' as DtScadenza,
'0000' as condPag,
'' as ModPag,
'' as BloccoSollecito,
'' as ChiaveRif1,
'' as ChiaveRif2,
'' as DtAmmissione,
tc.CODICECIG,
tc.CODICECUP,
RC.NRRIGA as nrRigaPrimaNota,
isnull(MCDC.NRRIGA,0) as NrRigaCDC,
tc.UTENTEMODIFICA,
tc.DATAMODIFICA
--,RC.CODCOMMESSA, 					 
--						 RC.NRRIGA, RC.POSIZIONE, RC.CONTO, RC.SEGNO, RC.IMPORTOEURO, TC.DATAREG, 
--                         TC.CAUSALE, TC.DATARIF, TC.MOVIVA, TC.PROVVISORIO, RC.RIGACAUSALE
FROM         TESTECONTABILITA AS TC INNER JOIN
                      RIGHECONTABILITA AS RC ON TC.PROGRESSIVO = RC.NRREG INNER JOIN
                      ALD_TabCausaliConvSap AS ConvSap ON TC.CAUSALE = ConvSap.CODCausale AND RC.RIGACAUSALE = ConvSap.NrRiga INNER JOIN
                      CAUSALICONTABILI AS CC ON TC.CAUSALE = CC.CODICECAUSALE LEFT OUTER JOIN
                      MOVIMENTICDC AS MCDC ON RC.CONTO = MCDC.CODGENERICO AND RC.NRREG = MCDC.IDRIFERIMENTO
					  -- LEFT OUTER JOIN
                      --TESTEDOCUMENTI AS TD ON TC.IDTESTADOC = TD.PROGRESSIVO
WHERE       -- (TC.ESERCIZIO = 2013) AND 
(TC.MOVIVA = 0) and (tc.PROVVISORIO=2)

--order by tc.PROGRESSIVO, rc.NRRIGA


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_PrimaNotaIntegrazione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_PrimaNotaIntegrazione] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_PrimaNotaIntegrazione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_PrimaNotaIntegrazione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_PrimaNotaIntegrazione] TO [Metodo98]
    AS [dbo];

