



CREATE view [dbo].[ALD_CONS_Vista_FI_AA_PrimaNota] as
SELECT     (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) AS IdSocieta, TC.PROGRESSIVO AS numeroDoc, CAST(DATEPART(YYYY, TC.DATARIF) AS varchar(4)) 
                      + RIGHT('00' + CAST(DATEPART(MM, TC.DATARIF) AS varchar(2)), 2) + RIGHT('00' + CAST(DATEPART(DAY, TC.DATARIF) AS varchar(2)), 2) AS DtDocumento, 
                      CAST(DATEPART(YYYY, TC.DATAREG) AS varchar(4)) + RIGHT('00' + CAST(DATEPART(MM, TC.DATAREG) AS varchar(2)), 2) + RIGHT('00' + CAST(DATEPART(DAY, 
                      TC.DATAREG) AS varchar(2)), 2) AS DtRegistrazione, RIGHT('00' + CAST(DATEPART(MM, TC.DATAREG) AS varchar(2)), 2) AS Periodo, ConvSap.TipoDoc, 
                      TC.NRRIFER AS Riferimento, 
					  'RIF.' + CAST(TC.CAUSALE AS varchar(4)) + ' ' +
                          (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_1) + CAST(TC.PROGRESSIVO AS VARCHAR(8)) AS TestoTestata, 
					  --chiave contabile new --
						(CASE WHEN rc.SEGNO = 0 
						      THEN CASE WHEN ConvSap.SegnoSap = 'S' 
										--THEN ConvSap.ChContabile segno originale
										THEN (CASE WHEN isnull(ConvSap.ChContabile, '') <> '' 
												   THEN ConvSap.ChContabile
												   ELSE (CASE WHEN LEFT(rc.conto, 1) = 'C'
															 THEN ConvSap.ChContabileCliente
															 ELSE (CASE WHEN LEFT(rc.conto, 1) = 'F' THEN ConvSap.ChContabileFornitore
																									 ELSE ConvSap.ChContabileGenerico
																									 END)
															 END)
												  END)
										
										--ELSE ConvSap.ChContabileCambioSezione 
										ELSE (CASE WHEN LEFT(rc.conto, 1) = 'C'
												   THEN ConvSap.ChContabileClienteCambioSezione
												   ELSE (CASE WHEN LEFT(rc.conto, 1) = 'F' 
															  THEN ConvSap.ChContabileFornitoreCambioSezione
															  ELSE ConvSap.ChContabileCambioSezione
															  END)
												   END)
										END 
							  --RAMO ELSE segno=1
							  ELSE CASE WHEN ConvSap.SegnoSap = 'H' 
									    --THEN ConvSap.ChContabile segno originale
										THEN (CASE WHEN isnull(ConvSap.ChContabile, '') <> '' 
												   THEN ConvSap.ChContabile
												   ELSE (CASE WHEN LEFT(rc.conto, 1) = 'C'
															 THEN ConvSap.ChContabileCliente
															 ELSE (CASE WHEN LEFT(rc.conto, 1) = 'F' THEN ConvSap.ChContabileFornitore
																									 ELSE ConvSap.ChContabileGenerico
																									 END)
															 END)
												  END)
										--ELSE ConvSap.ChContabileCambioSezione 
										ELSE (CASE WHEN LEFT(rc.conto, 1) = 'C'
												   THEN ConvSap.ChContabileClienteCambioSezione
												   ELSE (CASE WHEN LEFT(rc.conto, 1) = 'F' 
															  THEN ConvSap.ChContabileFornitoreCambioSezione
															  ELSE ConvSap.ChContabileCambioSezione
															  END)
												   END)
										END 
							  END) AS ChContabile,
					   --fine chiave contabile new --
							
							--chiave contabile old --
                      --(CASE WHEN isnull(ConvSap.ChContabile, '') <> '' 
						--				THEN ConvSap.ChContabile 
						--				ELSE (CASE WHEN LEFT(rc.conto, 1) = 'C' 
						--								THEN ConvSap.ChContabileCliente 
						--								ELSE (CASE WHEN LEFT(rc.conto, 1) = 'F' THEN ConvSap.ChContabileFornitore 
						--																		ELSE ConvSap.ChContabileGenerico 
						--																		END) 
						--								END) 
						--				END) AS ChContabileOLD,
					  --fine chiave contabile old --
                          (SELECT     TOP (1) CodSap
                            FROM          ALD_CONS_Vista_Union_VociExtraSap
                            WHERE      (CODCONTO = RC.CONTO)) AS ContoSAP, REPLACE(CAST(CAST((CASE WHEN isnull(MCDC.progressivo, 0) 
                      = 0 THEN RC.IMPORTOEURO ELSE MCDC.IMPORTORIPEURO END) AS decimal(19, 2)) AS varchar(15)), '.', ',') AS ImportoDivDoc, '' AS divisaDoc, '' AS cambio, 
                      ISNULL
                          ((SELECT     TOP (1) CogesSpeciale
                              FROM         ALD_CONS_Vista_Union_VociExtraSap AS ALD_CONS_Vista_Union_VociExtraSap_1
                              WHERE     (CODCONTO = RC.CONTO)), '') AS ContoCogeS, '' AS AliquotaIva, '' AS SettoreContabile, (CASE WHEN (isnull(MCDC.CODCOMMESSA, '') = '' OR
                          (((SELECT     TOP (1) flgNoExportSap
                               FROM         ALD_CONS_Vista_Union_VociExtraSap AVU
                               WHERE     AVU.codconto = RC.CONTO)) = 1)) THEN ISNULL(MCDC.CODCONTOCC, '') ELSE '' END) AS CDC, (CASE WHEN isnull
                          ((SELECT     TOP (1) flgNoExportSap
                              FROM         ALD_CONS_Vista_Union_VociExtraSap AVU
                              WHERE     AVU.codconto = RC.CONTO), '0') = '0' THEN
                          (SELECT     ExCom.WBS1Societa + ExCom.WBS1Progressivo + ExCom.WBS2Gestione + ExCom.WBS3Servizio + (CASE WHEN isnull(ExCom.WBS3Provincia, '') 
                                                   = '' THEN ExCom.WBS3Regione ELSE ExCom.WBS3Provincia END) 
                                                   + ExCom.WBS3DestDuso + ExCom.WBS3Separatore + ExCom.WBS4Prestazione + ExCom.WBS4Separatore + ExCom.WBS5ModErogazione AS RifCMFM
                            FROM          ExtraCommCli AS ExCom INNER JOIN
                                                   AnagraficaCommesse AS AC ON ExCom.RifProgressivo = AC.Progressivo
                            WHERE      AC.RifComm = RC.CODCOMMESSA) ELSE '' END) AS RifComMFM, LEFT(CAST(TC.CAUSALE AS varchar(4)) 
                      + ' ' + CC.DESCRIZIONE + '. ' + TC.DESCRIZIONE, 50) AS TestoPosizione, (CASE WHEN LEFT(rc.conto, 1) = 'G' THEN
                          (SELECT     TOP (1) IdSocietaPartnerMNC
                            FROM          ALD_CONS_Vista_Union_VociExtraSap AVU
                            WHERE      AVU.codconto = RC.CONTO) ELSE '' END) AS IdSocPartnerMFM, (CASE WHEN rc.SEGNO = 0 THEN
                          (SELECT     TOP (1) TMVDare
                            FROM          ALD_CONS_Vista_Union_VociExtraSap AVU
                            WHERE      AVU.codconto = RC.CONTO) ELSE
                          (SELECT     TOP (1) TMVAvere
                            FROM          ALD_CONS_Vista_Union_VociExtraSap AVU
                            WHERE      AVU.codconto = RC.CONTO) END) AS TMVConsolidamento, (CASE WHEN isnull
                          ((SELECT     COUNT(CODBANCA)
                              FROM         ANAGRAFICABANCHE AB
                              WHERE     AB.CODCONTORIF = RC.CONTO), 0) = 1 THEN CAST(DATEPART(YYYY, TC.DATAREG) AS varchar(4)) + RIGHT('00' + CAST(DATEPART(MM, TC.DATAREG) 
                      AS varchar(2)), 2) + RIGHT('00' + CAST(DATEPART(DAY, TC.DATAREG) AS varchar(2)), 2) ELSE '' END) AS DtValuta, 
                      RC.CONTO + ' pos.' + CAST(RC.POSIZIONE AS varchar(4)) + '/' + CAST(ISNULL(MCDC.POSIZIONE, 0) AS varchar(4)) AS Attribuzione, '' AS ChiaveRif3, '' AS DtScadenza, 
                      '0000' AS condPag, '' AS ModPag, '' AS BloccoSollecito, '' AS ChiaveRif1, '' AS ChiaveRif2, '' AS DtAmmissione, TC.CODICECIG, TC.CODICECUP, 
                      RC.NRRIGA AS nrRigaPrimaNota, ISNULL(MCDC.NRRIGA, 0) AS NrRigaCDC, TC.UTENTEMODIFICA, TC.DATAMODIFICA
FROM         TESTECONTABILITA AS TC INNER JOIN
                      RIGHECONTABILITA AS RC ON TC.PROGRESSIVO = RC.NRREG INNER JOIN
                      ALD_TabCausaliConvSap AS ConvSap ON TC.CAUSALE = ConvSap.CODCausale AND RC.RIGACAUSALE = ConvSap.NrRiga INNER JOIN
                      CAUSALICONTABILI AS CC ON TC.CAUSALE = CC.CODICECAUSALE LEFT OUTER JOIN
                      MOVIMENTICDC AS MCDC ON RC.SEGNO = MCDC.SEGNO AND RC.CODCOMMESSA = MCDC.CODCOMMESSA AND RC.CONTO = MCDC.CODGENERICO AND 
                      RC.NRREG = MCDC.IDRIFERIMENTO
WHERE     (TC.MOVIVA = 0) AND (TC.PROVVISORIO = 0)
--order by tc.PROGRESSIVO, rc.NRRIGA





GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_PrimaNota] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_PrimaNota] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_PrimaNota] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_PrimaNota] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_PrimaNota] TO [Metodo98]
    AS [dbo];

