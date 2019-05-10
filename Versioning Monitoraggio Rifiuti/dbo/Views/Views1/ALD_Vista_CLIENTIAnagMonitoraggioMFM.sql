

CREATE VIEW [dbo].[ALD_Vista_CLIENTIAnagMonitoraggioMFM]
AS
--SELECT     VF_ins.DtCreazione, VF_ins.TrmCreazione, VF_ins.CODCONTO, AF.DSCCONTO1, AF.UTENTEMODIFICA AS ut_ModAF, AF.DATAMODIFICA AS dt_ModAF, 
--                      VISTACLIENTI.ESERCIZIO, VISTACLIENTI.CODPAG, TABPAGAMENTI.DESCRIZIONE
--                      -- da finire vedi file a3 di analisi francesca
--FROM         ALD_Vista_CLIENTIStoricoCreazioneAnag AS VF_ins INNER JOIN
--                      ANAGRAFICACF AS AF ON VF_ins.CODCONTO = AF.CODCONTO INNER JOIN
--                      VISTACLIENTI ON AF.CODCONTO = VISTACLIENTI.CODCONTO INNER JOIN
--                      TABPAGAMENTI ON VISTACLIENTI.CODPAG = TABPAGAMENTI.CODICE

SELECT     VF_ins.DtCreazione, VF_ins.TrmCreazione, VF_ins.CODCONTO, AF.DSCCONTO1, AF.UTENTEMODIFICA AS ut_ModAF, AF.DATAMODIFICA AS dt_ModAF, 
                      VISTACLIENTI.ESERCIZIO, VISTACLIENTI.CODPAG, TABPAGAMENTI.DESCRIZIONE,
                          (SELECT     MFUltPag.DATAMODIFICA
                            FROM          ALD_MFAnagraficaCFRiservatiPagamento AS MFUltPag INNER JOIN
                                                   ALD_Vista_CLIENTIVariazioniPagamentoMFM ON MFUltPag.CODCONTO = ALD_Vista_CLIENTIVariazioniPagamentoMFM.CODCONTO AND
                                                    MFUltPag.id = ALD_Vista_CLIENTIVariazioniPagamentoMFM.ultRecModif
                            WHERE      (ALD_Vista_CLIENTIVariazioniPagamentoMFM.CODCONTO = AF.CODCONTO)) AS dt_UltModifPag,
                          (SELECT     MFUltPag.UTENTEMODIFICA
                            FROM          ALD_MFAnagraficaCFRiservatiPagamento AS MFUltPag INNER JOIN
                                                   ALD_Vista_CLIENTIVariazioniPagamentoMFM AS ALD_Vista_CLIENTIVariazioniPagamentoMFM_1 ON 
                                                   MFUltPag.CODCONTO = ALD_Vista_CLIENTIVariazioniPagamentoMFM_1.CODCONTO AND 
                                                   MFUltPag.id = ALD_Vista_CLIENTIVariazioniPagamentoMFM_1.ultRecModif
                            WHERE      (ALD_Vista_CLIENTIVariazioniPagamentoMFM_1.CODCONTO = AF.CODCONTO)) AS UT_UltModifPag, VISTACLIENTI.BANCAANAGR, 
                      BANCAAPPCF.ABI, BANCAAPPCF.CAB, BANCAAPPCF.CODICEIBAN, BANCAAPPCF.UTENTEMODIFICA AS utBancaAnagr, 
                      BANCAAPPCF.DATAMODIFICA AS DtBancaAnagr, BANCAAPPCF.BANCAAPPOGGIO
FROM         ALD_Vista_CLIENTIStoricoCreazioneAnag AS VF_ins INNER JOIN
                      ANAGRAFICACF AS AF ON VF_ins.CODCONTO = AF.CODCONTO INNER JOIN
                      VISTACLIENTI ON AF.CODCONTO = VISTACLIENTI.CODCONTO INNER JOIN
                      TABPAGAMENTI ON VISTACLIENTI.CODPAG = TABPAGAMENTI.CODICE LEFT OUTER JOIN
                      BANCAAPPCF ON VISTACLIENTI.CODCONTO = BANCAAPPCF.CODCONTO AND VISTACLIENTI.BANCAANAGR = BANCAAPPCF.CODICE


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_Vista_CLIENTIAnagMonitoraggioMFM] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_Vista_CLIENTIAnagMonitoraggioMFM] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_Vista_CLIENTIAnagMonitoraggioMFM] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_CLIENTIAnagMonitoraggioMFM] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_Vista_CLIENTIAnagMonitoraggioMFM] TO [Metodo98]
    AS [dbo];

