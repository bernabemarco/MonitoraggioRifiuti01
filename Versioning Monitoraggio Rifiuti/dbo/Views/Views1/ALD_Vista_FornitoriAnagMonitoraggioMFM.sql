
CREATE VIEW [dbo].[ALD_Vista_FornitoriAnagMonitoraggioMFM]
AS
--SELECT     VF_ins.DtCreazione, VF_ins.TrmCreazione, VF_ins.CODCONTO, AF.DSCCONTO1, AF.UTENTEMODIFICA AS ut_ModAF, AF.DATAMODIFICA AS dt_ModAF, 
--                      VISTAFORNITORI.ESERCIZIO, VISTAFORNITORI.CODPAG, TABPAGAMENTI.DESCRIZIONE
--                      -- da finire vedi file a3 di analisi francesca
--FROM         ALD_Vista_FornitoriStoricoCreazioneAnag AS VF_ins INNER JOIN
--                      ANAGRAFICACF AS AF ON VF_ins.CODCONTO = AF.CODCONTO INNER JOIN
--                      VISTAFORNITORI ON AF.CODCONTO = VISTAFORNITORI.CODCONTO INNER JOIN
--                      TABPAGAMENTI ON VISTAFORNITORI.CODPAG = TABPAGAMENTI.CODICE

SELECT     VF_ins.DtCreazione, VF_ins.TrmCreazione, VF_ins.CODCONTO, AF.DSCCONTO1, AF.UTENTEMODIFICA AS ut_ModAF, AF.DATAMODIFICA AS dt_ModAF, 
                      VISTAFORNITORI.ESERCIZIO, VISTAFORNITORI.CODPAG, TABPAGAMENTI.DESCRIZIONE,
                          (SELECT     MFUltPag.DATAMODIFICA
                            FROM          ALD_MFAnagraficaCFRiservatiPagamento AS MFUltPag INNER JOIN
                                                   ALD_Vista_FornitoriVariazioniPagamentoMFM ON MFUltPag.CODCONTO = ALD_Vista_FornitoriVariazioniPagamentoMFM.CODCONTO AND
                                                    MFUltPag.id = ALD_Vista_FornitoriVariazioniPagamentoMFM.ultRecModif
                            WHERE      (ALD_Vista_FornitoriVariazioniPagamentoMFM.CODCONTO = AF.CODCONTO)) AS dt_UltModifPag,
                          (SELECT     MFUltPag.UTENTEMODIFICA
                            FROM          ALD_MFAnagraficaCFRiservatiPagamento AS MFUltPag INNER JOIN
                                                   ALD_Vista_FornitoriVariazioniPagamentoMFM AS ALD_Vista_FornitoriVariazioniPagamentoMFM_1 ON 
                                                   MFUltPag.CODCONTO = ALD_Vista_FornitoriVariazioniPagamentoMFM_1.CODCONTO AND 
                                                   MFUltPag.id = ALD_Vista_FornitoriVariazioniPagamentoMFM_1.ultRecModif
                            WHERE      (ALD_Vista_FornitoriVariazioniPagamentoMFM_1.CODCONTO = AF.CODCONTO)) AS UT_UltModifPag, VISTAFORNITORI.BANCAANAGR, 
                      BANCAAPPCF.ABI, BANCAAPPCF.CAB, BANCAAPPCF.CODICEIBAN, BANCAAPPCF.UTENTEMODIFICA AS utBancaAnagr, 
                      BANCAAPPCF.DATAMODIFICA AS DtBancaAnagr, BANCAAPPCF.BANCAAPPOGGIO
FROM         ALD_Vista_FornitoriStoricoCreazioneAnag AS VF_ins INNER JOIN
                      ANAGRAFICACF AS AF ON VF_ins.CODCONTO = AF.CODCONTO INNER JOIN
                      VISTAFORNITORI ON AF.CODCONTO = VISTAFORNITORI.CODCONTO INNER JOIN
                      TABPAGAMENTI ON VISTAFORNITORI.CODPAG = TABPAGAMENTI.CODICE LEFT OUTER JOIN
                      BANCAAPPCF ON VISTAFORNITORI.CODCONTO = BANCAAPPCF.CODCONTO AND VISTAFORNITORI.BANCAANAGR = BANCAAPPCF.CODICE

GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_FornitoriAnagMonitoraggioMFM] TO [Metodo98]
    AS [dbo];

