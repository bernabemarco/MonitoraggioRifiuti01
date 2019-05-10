
CREATE VIEW [dbo].[ALD_VISTATempiFasi_Commessa]
AS
SELECT   td.progressivo as IDTesta, TD.ESERCIZIO, td.tipodoc, td.numerodoc, td.bis, td.datadoc, td.numrifdoc, td.datarifdoc, RD.RIFCOMMCLI, AnaCom.StatoCommessa, 
                      (CASE WHEN AnaCom.STATOCOMMESSA = 0 THEN 'Immessa' ELSE (CASE WHEN AnaCom.STATOCOMMESSA = 1 THEN 'Attiva' ELSE (CASE WHEN AnaCom.STATOCOMMESSA
                       = 2 THEN 'Sospesa' ELSE (CASE WHEN AnaCom.STATOCOMMESSA = 3 THEN 'Chiusa' ELSE '' END) END) END) END) AS DSCSTATOCOMMESSA, ExRD.IdDivisione,
                          (SELECT     DscDivisione
                            FROM          Ald_TabDivisioni
                            WHERE      (IdDivisione = ExRD.IdDivisione)) AS DSCDIVISIONE, 
							TD.CODCLIFOR, LEFT(ACF.DSCCONTO1, 80) AS DSCCONTO1, RD.CODART, RD.DESCRIZIONEART, 
                      AnaAge.DSCAGENTE, RD.UMGEST, RD.QTAGEST, TD.TOTDOCUMENTOEURO, ExComCli.ResponsabileCommessa, 
                      ANAGRAFICAARTICOLI.DESCRIZIONE AS DscResponsabile, 
					  ExTD.RifOfferta,
					  (case when isnull(ExTD.DtAccettazione,'')='' then TD.DATARIFDOC else ExTD.DtAccettazione end) as DtAccettaOfferta,
					  --TD.TIPODOC, TD.NUMERODOC, TD.BIS, 
					  (case when isnull(ExTD.RefGestioneOrd,0)>0 then ExTD.RefGestioneOrd else ''  end) as IdRefGestioneOrd, 
					  (select DESCRIZIONE from TABRESPONSABILI where Codice=ExTD.RefGestioneOrd) as DscRefGestioneOrd,
					  AnaCom.DataConsegnaContr AS DtRiesameUffTec,
					  (case when isnull(ExTD.DtAccettazione,'')='' 
					  then 
					    (SELECT [dbo].[AldCalcGGLAVCalendario] (TD.DATARIFDOC, AnaCom.DataConsegnaContr ) )
					  else 
						(SELECT [dbo].[AldCalcGGLAVCalendario] ( ExTD.DtAccettazione, AnaCom.DataConsegnaContr  ))
					  end) as DeltaGGDtAcet_Riesame,
					  TD.DATADOC as DataOrdine, 
					  (case when isnull(ExTD.DtAccettazione,'')='' 
					  then 
					    (SELECT [dbo].[AldCalcGGLAVCalendario] (TD.DATARIFDOC, TD.DATADOC) )
					  else 
						(SELECT [dbo].[AldCalcGGLAVCalendario] ( ExTD.DtAccettazione, TD.DATADOC ))
					  end)
					  as DeltaGGDtAcet_DtOrdine,
					  AnaCom.DataConsegnaPrev as DtRichProgetto,
					  AnaCom.DataConsegnaSched as DtConsProgetto,
					  --DeltaGGDtAcet_DtConsProgetto--
					  (case when isnull(ExTD.DtAccettazione,'')='' 
					  then 
					    (SELECT [dbo].[AldCalcGGLAVCalendario] ( TD.DATARIFDOC, AnaCom.DataConsegnaSched) )
					  else 
						(SELECT [dbo].[AldCalcGGLAVCalendario] ( ExTD.DtAccettazione, AnaCom.DataConsegnaSched ))
					  end)
					  as DeltaGGDtAcet_DtConsProgetto,
					  --Fine DeltaGGDtAcet_DtConsProgetto--
					  (SELECT top 1 DATAEMISSIONE FROM TESTEORDINIPROD TP where RIFCOMMCLI=rd.RIFCOMMCLI) as DATAEMISSIONE_IMP,
					  (case when isnull(ExTD.DtAccettazione,'')='' 
					  then 
					    (SELECT [dbo].[AldCalcGGLAVCalendario] (TD.DATARIFDOC, (SELECT top 1 DATAEMISSIONE FROM TESTEORDINIPROD TP where RIFCOMMCLI=rd.RIFCOMMCLI)) )
					  else 
						(SELECT [dbo].[AldCalcGGLAVCalendario] ( ExTD.DtAccettazione, (SELECT top 1 DATAEMISSIONE FROM TESTEORDINIPROD TP where RIFCOMMCLI=rd.RIFCOMMCLI) ))
					  end)
					  as DeltaGGDtAcet_DtEmissioneIMP,
					  (select min(datadoc) from righedocumenti rdSub, testedocumenti tdSub 
					  where tdSub.progressivo=rdSub.IDTESTA and rdSub.RIFCOMMCLI=rd.RIFCOMMCLI and tdSub.TIPODOC='1OS') as DtDoc1OS,

					  --DeltaGGDtAcet_DtEmissione1OS--
					  (case when isnull(ExTD.DtAccettazione,'')='' 
					  then 
					    (SELECT [dbo].[AldCalcGGLAVCalendario] (TD.DATARIFDOC, (select min(datadoc) from righedocumenti rdSub, testedocumenti tdSub 
					  where tdSub.progressivo=rdSub.IDTESTA and rdSub.RIFCOMMCLI=rd.RIFCOMMCLI and tdSub.TIPODOC='1OS')) )
					  else 
						(SELECT [dbo].[AldCalcGGLAVCalendario] (ExTD.DtAccettazione, (select min(datadoc) from righedocumenti rdSub, testedocumenti tdSub 
					  where tdSub.progressivo=rdSub.IDTESTA and rdSub.RIFCOMMCLI=rd.RIFCOMMCLI and tdSub.TIPODOC='1OS') ))
					  end)
					  as DeltaGGDtAcet_DtEmissione1OS,
					  --fine DeltaGGDtAcet_DtEmissione1OS--
					  --DtConsegna1OS--
					  (select min(rdSub.DATACONSEGNA) from righedocumenti rdSub, testedocumenti tdSub 
					  where tdSub.progressivo=rdSub.IDTESTA and rdSub.RIFCOMMCLI=rd.RIFCOMMCLI 
					  and rdSub.TIPORIGA='N'
					  and tdSub.TIPODOC='1OS') as DtConsegna1OS,
					  --fine DtConsegna1OS--

					  --DeltaGGDtAcet_DtConsegna1OS--
					  (case when isnull(ExTD.DtAccettazione,'')='' 
					  then 
					    (SELECT [dbo].[AldCalcGGLAVCalendario] (
								-- DATARIFDOC
								TD.DATARIFDOC,
							-- dtConsegna1OS
								(select min(rdSub.DATACONSEGNA) from righedocumenti rdSub, testedocumenti tdSub 
								 where tdSub.progressivo=rdSub.IDTESTA and rdSub.RIFCOMMCLI=rd.RIFCOMMCLI 
								 and rdSub.TIPORIGA='N'
								 and tdSub.TIPODOC='1OS')
	
							) 
						)
					  else 
						(SELECT [dbo].[AldCalcGGLAVCalendario] (
							-- DtAccettazione
								ExTD.DtAccettazione, 
							-- dtConsegna1OS
								(select min(rdSub.DATACONSEGNA) from righedocumenti rdSub, testedocumenti tdSub 
								  where tdSub.progressivo=rdSub.IDTESTA and rdSub.RIFCOMMCLI=rd.RIFCOMMCLI 
								  and rdSub.TIPORIGA='N'
								  and tdSub.TIPODOC='1OS')

							)
						)
					  end)
					  as DeltaGGDtAcet_DtConsegna1OS,
					  --fine DeltaGGDtAcet_DtConsegna1OS--

					  --DtEvasioneOrdine2SE--
					  (select min(rdSub.DATACONSEGNA) from righedocumenti rdSub, testedocumenti tdSub 
					  where tdSub.progressivo=rdSub.IDTESTA and rdSub.RIFCOMMCLI=rd.RIFCOMMCLI 
					  and rdSub.TIPORIGA='N'
					  and tdSub.TIPODOC='2SE') as DtEvasioneOrdine2SE,
					  --fine DtEvasioneOrdine2SE--

					  --DtArrivoMateriale--
					  AnaCom.DataInizioConsegna as DtInizioCantiere,
					  --fine DtArrivoMateriale--

					  --DtRipianifMaterialeORF--
					   (select max(case when ExRD.NonConfermato=1 then '31/12/2099' else rdSub.DATACONSEGNA end) from righedocumenti rdSub, testedocumenti tdSub, EXTRARIGHEDOC ExRD 
					  where tdSub.progressivo=rdSub.IDTESTA and rdSub.RIFCOMMCLI=rd.RIFCOMMCLI and ExRD.IDTESTA=rdSub.IDTESTA
					  and rdSub.TIPORIGA='N'
					  and tdSub.TIPODOC='orf') as DtRipianifMaterialeORF,
					  --Fine DtRipianifMaterialeORF--

					   --DtConsegnaMateriale3TC--
					   (select min(tdSub.DATADOC) from righedocumenti rdSub, testedocumenti tdSub 
					  where tdSub.progressivo=rdSub.IDTESTA and rdSub.RIFCOMMCLI=rd.RIFCOMMCLI 
					  and rdSub.TIPORIGA='N'
					  and tdSub.TIPODOC='3TC') as DtConsegnaMateriale3TC,
					  -- fine DtDocMateriale3TC--

					  --DeltaGGDtAcet_DtDocMateriale3TC--
					  (case when isnull(ExTD.DtAccettazione,'')='' 
					  then 
					    (SELECT [dbo].[AldCalcGGLAVCalendario] (
							-- DATARIFDOC
								 TD.DATARIFDOC,
							-- dtConsegna1OS
								(select min(tdSub.DATADOC) from righedocumenti rdSub, testedocumenti tdSub 
								 where tdSub.progressivo=rdSub.IDTESTA and rdSub.RIFCOMMCLI=rd.RIFCOMMCLI 
								 and rdSub.TIPORIGA='N'
								 and tdSub.TIPODOC='3TC')

							) 
						)
					  else 
						(SELECT [dbo].[AldCalcGGLAVCalendario] (
							-- DtAccettazione
								 ExTD.DtAccettazione, 
							-- dtConsegna1OS
								(select min(tdSub.DATADOC) from righedocumenti rdSub, testedocumenti tdSub 
								  where tdSub.progressivo=rdSub.IDTESTA and rdSub.RIFCOMMCLI=rd.RIFCOMMCLI 
								  and rdSub.TIPORIGA='N'
								  and tdSub.TIPODOC='3TC')

							)
						)
					  end)
					  as DeltaGGDtAcet_DtDocMateriale3TC,
					  --fine DeltaGGDtAcet_DtDocMateriale3TC--

					  --DtFineCantiere--
					  AnaCom.DataFineConsegna as DtFineCantiere,
					  --fine DtFineCantiere--

					  --DeltaGGDtAcet_DtFineCantiere--
					  (case when isnull(ExTD.DtAccettazione,'')='' 
					  then 
					    (SELECT [dbo].[AldCalcGGLAVCalendario] ( TD.DATARIFDOC, AnaCom.DataFineConsegna) )
					  else 
						(SELECT [dbo].[AldCalcGGLAVCalendario] ( ExTD.DtAccettazione , AnaCom.DataFineConsegna))
					  end)
					  as DeltaGGDtAcet_DtFineCantiere,
					  --Fine DeltaGGDtAcet_DtFineCantiere--

					  ExComCli.DTRICHIESTADM37,
					  ExComCli.DTCONSEGNADM37,

					  --DeltaGGDtAcet_DtConsegnaDM37--
					  (case when isnull(ExTD.DtAccettazione,'')='' 
					  then 
					    (SELECT [dbo].[AldCalcGGLAVCalendario] ( TD.DATARIFDOC, ExComCli.DTCONSEGNADM37) )
					  else 
						(SELECT [dbo].[AldCalcGGLAVCalendario] ( ExTD.DtAccettazione, ExComCli.DTCONSEGNADM37 ))
					  end)
					  as DeltaGGDtAcet_DtConsegnaDM37,
					  --Fine DeltaGGDtAcet_DtConsegnaDM37--

					  --dtEvasioneOrdineCliente--
					  rd.dataconsegna as dtEvasioneOrdineCliente,
					  --fine dtEvasioneOrdineCliente--

					  --DtDocProforma--
					  (select min(datadoc) from righedocumenti rdSub, testedocumenti tdSub 
					  where tdSub.progressivo=rdSub.IDTESTA and rdSub.RIFCOMMCLI=rd.RIFCOMMCLI and tdSub.TIPODOC in('PRO','PRE','PRH','PRS')) as DtDocProforma,
					  --fine DtDocProforma--

					  --DtDocFafturaCliente--
					  (select min(datadoc) from righedocumenti rdSub, testedocumenti tdSub, parametridoc pardoc 
					  where tdSub.progressivo=rdSub.IDTESTA and rdSub.RIFCOMMCLI=rd.RIFCOMMCLI and pardoc.codice=tdSub.TIPODOC and pardoc.tipo in('F') 
					  and pardoc.clifor='C') as DtDocFafturaCliente,
					  --fine DtDocFafturaCliente--

					  --DeltaGGDocFafturaCliente--
					  (case when isnull(ExTD.DtAccettazione,'')='' 
					  then 
					    (SELECT [dbo].[AldCalcGGLAVCalendario] (
					  -- DATARIFDOC
						 TD.DATARIFDOC,
						--dtFAtturacliente
						 (select min(datadoc) from righedocumenti rdSub, testedocumenti tdSub, parametridoc pardoc 
					  where tdSub.progressivo=rdSub.IDTESTA and rdSub.RIFCOMMCLI=rd.RIFCOMMCLI and pardoc.codice=tdSub.TIPODOC and pardoc.tipo in('F') 
					  and pardoc.clifor='C')

						) )
					  else 
						(SELECT [dbo].[AldCalcGGLAVCalendario] (
						-- DtAccettazione --
							 ExTD.DtAccettazione ,
						--dtFAtturacliente
							 (select min(datadoc) from righedocumenti rdSub, testedocumenti tdSub, parametridoc pardoc 
							 where tdSub.progressivo=rdSub.IDTESTA and rdSub.RIFCOMMCLI=rd.RIFCOMMCLI and pardoc.codice=tdSub.TIPODOC and pardoc.tipo in('F') 
							 and pardoc.clifor='C')

							))
					  end)
					  as DeltaGGDocFafturaCliente,
					  --Fine DeltaGGDocFafturaCliente--

					  --DtChiusuraCommessa--
					  AnaCom.DataChiusuraComm as DtChiusuraCommessa,
					  --fine DtChiusuraCommessa--

					  --DeltaGGDtAcet_DtChiusuraCommessa--
					  (case when isnull(ExTD.DtAccettazione,'')='' 
					  then 
					    (SELECT [dbo].[AldCalcGGLAVCalendario] (  TD.DATARIFDOC, AnaCom.DataChiusuraComm) )
					  else 
						(SELECT [dbo].[AldCalcGGLAVCalendario] (  ExTD.DtAccettazione, AnaCom.DataChiusuraComm ))
					  end)
					  as DeltaGGDtAcet_DtChiusuraCommessa
					  --Fine DeltaGGDtAcet_DtChiusuraCommessa--
						  , TD.DOCCHIUSO, 
                      TD.SEGNO, TD.CODLISTINO, TD.CODCAMBIO, TD.VALCAMBIO, TD.ADDSPESEDOCUM, TD.ADDSPESEEFFETTO, TD.ADDSPESETRASPORTO, TD.ADDSPESEIMBALLO, 
                      TD.CODLINGUA, TD.CODAGENTE1, TD.PRCPROVVAG1, TD.PRCPROVVFINALEAG1, TD.TOTPROVVAG1, TD.TOTPROVVAGEURO1, TD.TOTPROVVAG1RES, 
                      TD.TOTPROVVAGEURO1RES, TD.CODAGENTE2, TD.PRCPROVVAG2, TD.PRCPROVVFINALEAG2, TD.TOTPROVVAG2, TD.TOTPROVVAGEURO2, TD.TOTPROVVAG2RES, 
                      TD.TOTPROVVAGEURO2RES, TD.CODAGENTE3, TD.PRCPROVVAG3, TD.PRCPROVVFINALEAG3, TD.TOTPROVVAG3, TD.TOTPROVVAGEURO3, TD.TOTPROVVAG3RES, 
                      TD.TOTPROVVAGEURO3RES, TD.NUMDESTDIVERSACORR, TD.NUMDESTDIVERSAMERCI, TD.RAGSOCDDM, TD.INDIRIZZODDM, TD.CAPDDM, TD.LOCALITADDM, 
                      TD.PROVINCIADDM, TD.SCONTOFINALE, TD.CODBANCAINCASSO, TD.CODBANCAAPPOGGIO, TD.CODPAGAMENTO, TD.SPESEDOC, TD.SPESEEFFETTO, 
                      TD.TOTSPESEDOC, TD.TOTSPESEEFFETTO, TD.TOTIVASPESEDOC, TD.TOTIVASPESEEFFETTO, TD.TOTIVAALTRESPESE, TD.TOTIVAALTRESPESERES, 
                      TD.TOTALTRESPESE, TD.TOTALTRESPESERES, TD.TOTIMPONIBILE, TD.TOTIMPONIBILERES, TD.TOTIMPOSTA, TD.TRASPACURA, TD.CAUSALETRASP, 
                      TD.DATAINIZIOTRASP, TD.ORAINIZIOTRASP, TD.MODOTRASP, TD.ASPETTOBENI, TD.ASPETTOBENIINLINGUA, TD.PORTO, TD.NUMCOLLI, TD.CODCFFATT, 
                      RD.RIGACHIUSA, RD.GENCONTROP, RD.TIPORIGA, AnaArt_1.GRUPPO, AnaArt_1.CATEGORIA, AnaArt_1.CODCATEGORIASTAT, RD.CONTOCDC, RD.CODDEPOSITO, 
                      ACF.CODNAZIONE, RD.CODDEPOSITOCOLL
FROM         TESTEDOCUMENTI AS TD INNER JOIN
                      RIGHEDOCUMENTI AS RD ON TD.PROGRESSIVO = RD.IDTESTA INNER JOIN
                      ANAGRAFICACF AS ACF ON TD.CODCLIFOR = ACF.CODCONTO INNER JOIN
                      AnagraficaCommesse AS AnaCom ON RD.RIFCOMMCLI = AnaCom.RifComm INNER JOIN
                      ExtraCommCli AS ExComCli ON AnaCom.Progressivo = ExComCli.RifProgressivo INNER JOIN
                      ANAGRAFICAARTICOLI ON ExComCli.ResponsabileCommessa = ANAGRAFICAARTICOLI.CODICE LEFT OUTER JOIN
                      ANAGRAFICAARTICOLI AS AnaArt_1 ON RD.CODART = AnaArt_1.CODICE LEFT OUTER JOIN
                      EXTRATESTEDOC AS ExTD ON TD.PROGRESSIVO = ExTD.IDTESTA LEFT OUTER JOIN
                      ANAGRAFICAAGENTI AS AnaAge ON TD.CODAGENTE1 = AnaAge.CODAGENTE LEFT OUTER JOIN
                      EXTRARIGHEDOC AS ExRD ON ExRD.IDTESTA = RD.IDTESTA AND ExRD.IDRIGA = RD.IDRIGA
--condizione 
WHERE
   --TD.ESERCIZIO>2006
   --AND 
   ISNULL(RD.RIFCOMMCLI,'') <>''
   and rd.tiporiga='N'
   --and rd.RIFCOMMCLI='IAC/09/0706'

GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_VISTATempiFasi_Commessa] TO [Metodo98]
    AS [dbo];

