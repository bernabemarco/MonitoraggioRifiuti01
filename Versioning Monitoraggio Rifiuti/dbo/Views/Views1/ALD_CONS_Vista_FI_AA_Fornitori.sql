




CREATE view [dbo].[ALD_CONS_Vista_FI_AA_Fornitori] as
SELECT 	TM.GrConti as GruppoConti,
	(SELECT        TOP (1) IdSocieta
FROM            ALD_TabDittaDatiAggiuntivi ) as IdSocieta ,
	isnull(EX.CodSap,'') as CodiceSap ,
	left(AC.DSCCONTO1,40) as RagioneSociale ,
	SUBSTRING ( AC.DSCCONTO1 , 41 , 40 ) as RagioneSociale2 ,
	--	[Intestazione] [varchar](30) NULL,
	(case when AC.FLGPERSFISICA=1 then 
										AC.CODFISCALE 
								  else (CASE WHEN left(AC.PARTITAIVA,11)='00000000000' then 
																							(CASE WHEN left(AC.CODFISCALE,11)='00000000000'	then
																																				left(AC.DSCCONTO1,20) 
																																			else 
																																				AC.CODFISCALE 
																																			end) 
																					   else 
																							AC.PartitaIVA 
																					   end) 
								  end ) as ChiaveRicerca,	
	left(AC.INDIRIZZO, 60) as Via,
	left(isnull(AC.CAP,''),10) as CAP,
	isnull(left(AC.LOCALITA, 35),'') as Localita,
	left(isnull(AC.CODICEISO, 'IT'),3) as Paese,
	isnull(AC.PROVINCIA, '') as Provincia,
	--(select IdRegSap from consmfm.dbo.TABREGIONI TR where TR.CODICE=AC.CODREGIONE) as Regione,
	--[Lingua] [varchar](2) NULL,
	left(isnull(EX.IdSocietaPartnerMNC,''),6) as SocietaPartner,
	left(AC.CODFISCALE,16) as CodFiscale,
	left(AC.PARTITAIVA,11) as Piva,
	(case when isnull(AC.FLGPERSFISICA,0)=1 then 'X' else '' end ) as PersonaFisica,
(case when isnull(AC.FLGPERSFISICA,0)=1 then  
cast(datepart(YYYY, AC.DATANASCITA) as varchar(4)) + right('00' + cast(datepart(MM, AC.DATANASCITA) as varchar(2) ) ,2) + right('00' + cast(datepart(DAY, AC.DATANASCITA) as varchar(2) ) ,2)
else '' end ) as DATANASCITA,
	left(isnull(AC.LUOGONASCITA,''),25) as LuogoDiNascita,
	(case when isnull(ac.TIPOPROFESSIONISTA,0)<>0 then (case when SUBSTRING ( AC.CODFISCALE , 10 , 2 )>'39' then '2' else '1' end) else '' end ) as Sesso,
	'' as Professione,
	(case when isnull( BACF.ABI+BACF.cab,'')<>'' then ac.CODICEISO else left ( isnull( BACF.CODICEIBAN,''),2) end) as PaeseBanca ,
	--SUBSTRING (isnull( BACF.CODICEIBAN,''),6, 10) as ABICAB,
	right ( isnull(BACF.ABI,''),5)+isnull(BACF.cab,'') as ABICAB,
	SUBSTRING (isnull( BACF.CODICEIBAN,''),16, 12) as NConto,
	SUBSTRING (isnull( BACF.CODICEIBAN,''),5, 1) as CIN,
	isnull(TM.CodContoMastroSap,'') as ContoMastro,
	--[ChClass] [varchar](3) NULL,
	ac.CODCONTO as CodConto,
	--'0000' as CodPag,
(case when isnull(rc.CODPAG,'0000')='0000' then '0000' else (SELECT  top 1  ConvTP.CodPagSap
FROM            ConsMFM.dbo.TABPAGAMENTI AS TP RIGHT OUTER JOIN
                         ConsMFM.dbo.CONS_ALD_TabConvPagSap AS ConvTP ON TP.CODICE = ConvTP.CodPagMetodo
WHERE        (ConvTP.PagamentoFornitore = 'X') AND (ISNULL(ConvTP.CodPagMetodo, 'ZZZZ') = isnull(rc.CODPAG,'0000')) OR
                         (ISNULL(ConvTP.PagDefault, 0) = 1) order by ConvTP.CodPagSap desc)
						 end) as CodPag,
	--'X' as DoppiaFattura,
(case when rc.CODPAG='' then '' else (SELECT  top 1  ConvTP.ModPagamento
FROM            ConsMFM.dbo.TABPAGAMENTI AS TP RIGHT OUTER JOIN
                         ConsMFM.dbo.CONS_ALD_TabConvPagSap AS ConvTP ON TP.CODICE = ConvTP.CodPagMetodo
WHERE        (ConvTP.PagamentoFornitore = 'X') AND (ISNULL(ConvTP.CodPagMetodo, 'ZZZZ') = isnull(rc.CODPAG,'0000')) OR
                         (ISNULL(ConvTP.PagDefault, 0) = 1) order by ConvTP.CodPagSap desc)
end						 ) as ModPagamento,
	'' as BancaInterna,
	'' as ContoDaFornitore,
	'' as UtenteFornitore,
	ac.TELEFONO as TelRif,
	ac.FAX as FaxRif,
	ac.TELEX as EmailRif,
	'' as NotaConto,
	(case when isnull(ac.TIPOPROFESSIONISTA,0)<>0 then isnull(AC.CODICEISO, 'IT') else '' end ) as PaeseRA,
	isnull(TM.GrCashMng,'') as GrCashMng,
	(case when isnull(ac.TIPOPROFESSIONISTA,0)<>0 then  
	ALD_CONS_Vista_FI_AA_Fornitori_RA.TipoRA
	else '' end ) as TipiRA,
	(case when isnull(ac.TIPOPROFESSIONISTA,0)<>0 then  
	ALD_CONS_Vista_FI_AA_Fornitori_RA.CodiceRA
	else '' end ) as codiceRA,
	(case when isnull(ac.TIPOPROFESSIONISTA,0)<>0 then 'X' else '' end ) as FlagRA,
	isnull(EX.ClassFID,'') as ClassId,
	 ac.DATAMODIFICA,
	 ac.UTENTEMODIFICA
FROM            ANAGRAFICACF AS AC INNER JOIN
                         TABMASTRI AS TM ON AC.CODMASTRO = TM.CODICE LEFT OUTER JOIN
                         ALD_CONS_Vista_FI_AA_Fornitori_RA ON AC.CODCONTO = ALD_CONS_Vista_FI_AA_Fornitori_RA.CODFORNITORE LEFT OUTER JOIN
                         BANCAAPPCF AS BACF RIGHT OUTER JOIN
                         ANAGRAFICARISERVATICF AS RC ON BACF.CODICE = RC.BANCAANAGR AND BACF.CODCONTO = RC.CODCONTO ON 
                         AC.CODCONTO = RC.CODCONTO LEFT OUTER JOIN
                         EXTRAFORNITORI AS EX ON AC.CODCONTO = EX.CODCONTO
WHERE        (RC.ESERCIZIO = 
                             (SELECT        ESERCIZIOATTIVO
                               FROM            TABUTENTI
                               WHERE        (USERDB = CAST(USER_NAME() AS VARCHAR(25))))) AND (AC.TIPOCONTO = 'F')





GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_Fornitori] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_Fornitori] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_Fornitori] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_Fornitori] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_Fornitori] TO [Metodo98]
    AS [dbo];

