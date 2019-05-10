

CREATE view [dbo].[CRM_Vista_Ordini]
as
SELECT     (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + + CAST(TESTEDOCUMENTI.PROGRESSIVO AS varchar(15)) AS IdTestaDoc, TESTEDOCUMENTI.ESERCIZIO, 
                      TESTEDOCUMENTI.TIPODOC, CRM_TipoDocPubblicati.DscCRMTipoDoc, TESTEDOCUMENTI.NUMERODOC, TESTEDOCUMENTI.BIS, TESTEDOCUMENTI.DATADOC, 
                      TESTEDOCUMENTI.DOCCHIUSO, ISNULL(EXTRATESTEDOC.ImportCRM, 0) AS ImportCRM,
                          (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_8) + TESTEDOCUMENTI.CODCLIFOR AS codConto, 
                      TESTEDOCUMENTI.CODCLIFOR AS codcontometodo,
                          (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_7) + TESTEDOCUMENTI.CODCFFATT AS CODCFFATT, 
                      TESTEDOCUMENTI.CODCFFATT AS CODCFFATTmetodo, TESTEDOCUMENTI.NUMRIFDOC, TESTEDOCUMENTI.DATARIFDOC,
                          (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_6) + CAST(TESTEDOCUMENTI.CODLISTINO AS varchar(15))
							-- + ' ' +
                          --(SELECT     DESCRIZIONE
                            --FROM          TABLISTINI AS TL
                            --WHERE      (NRLISTINO = TESTEDOCUMENTI.CODLISTINO)) 
							
							AS CODLISTINO,
                          (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_5) + TESTEDOCUMENTI.CODAGENTE1 AS CODAGENTE1,
                          (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_4) + TESTEDOCUMENTI.CODAGENTE2 + ' ' +
                          (SELECT     DSCAGENTE
                            FROM          ANAGRAFICAAGENTI AS AA
                            WHERE      (CODAGENTE = TESTEDOCUMENTI.CODAGENTE2)) AS CODAGENTE2,
                          (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_3) + TESTEDOCUMENTI.CODAGENTE3 + ' ' +
                          (SELECT     DSCAGENTE
                            FROM          ANAGRAFICAAGENTI AS AA
                            WHERE      (CODAGENTE = TESTEDOCUMENTI.CODAGENTE3)) AS CODAGENTE3, TESTEDOCUMENTI.NUMDESTDIVERSAMERCI, TESTEDOCUMENTI.RAGSOCDDM, 
                      TESTEDOCUMENTI.INDIRIZZODDM, TESTEDOCUMENTI.CAPDDM, TESTEDOCUMENTI.LOCALITADDM, TESTEDOCUMENTI.PROVINCIADDM,
                          (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_2) + TESTEDOCUMENTI.CODPAGAMENTO AS CODPAGAMENTO, 
                      TESTEDOCUMENTI.TOTDOCUMENTOEURO, TESTEDOCUMENTI.TOTDOCUMENTOEURORES, TESTEDOCUMENTI.TOTIMPONIBILEEURO, TESTEDOCUMENTI.TOTIMPONIBILEEURORES,
					  TESTEDOCUMENTI.TOTIMPOSTAEURO, 
                      TESTEDOCUMENTI.TOTIMPOSTAEURORES,
                          (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_1) + CAST(EXTRATESTEDOC.IdDivisione AS varchar(15)) AS IdDivisione, 
                      EXTRATESTEDOC.NrRevisione, EXTRATESTEDOC.DataRevisione, EXTRATESTEDOC.RifOfferta,
                          (SELECT     DESCRIZIONE
                            FROM          TABRESPONSABILI
                            WHERE      (CODICE = EXTRATESTEDOC.RefGestioneOrd)) AS DscRefGestioneOrd,
                          (SELECT     DESCRIZIONE
                            FROM          TABRESPONSABILI AS TABRESPONSABILI_1
                            WHERE      (CODICE = EXTRATESTEDOC.RefRespCommessa)) AS DscRefRespCommessa,
							 TESTEDOCUMENTI.DATAMODIFICA--, EXTRACLIENTI.CodCRM
							 --, TESTEDOCUMENTI.DATACONSEGNA
							, (select max(dataconsegna) from righedocumenti RD where RD.IDTESTA= TESTEDOCUMENTI.progressivo and tiporiga='N') as DATACONSEGNA
FROM         TESTEDOCUMENTI INNER JOIN
                      EXTRATESTEDOC ON TESTEDOCUMENTI.PROGRESSIVO = EXTRATESTEDOC.IDTESTA INNER JOIN
                      CRM_TipoDocPubblicati ON TESTEDOCUMENTI.TIPODOC = CRM_TipoDocPubblicati.Codice INNER JOIN
                      EXTRACLIENTI ON TESTEDOCUMENTI.CODCLIFOR = EXTRACLIENTI.CODCONTO

WHERE     (1 = 1)
and esercizio>=2015
and isnull(EXTRACLIENTI.CodCRM,'')<>''
--and
--aggiungere source tbl per scelta codici docs da mostrare nel crm --






GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_Vista_Ordini] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_Vista_Ordini] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_Vista_Ordini] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_Vista_Ordini] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_Vista_Ordini] TO [Metodo98]
    AS [dbo];

