
-- vista per ultima dt e ultimo utente modifica pagamento anagrafico
CREATE VIEW [dbo].[ALD_Vista_CLIENTIVariazioniPagamentoMFM]
AS
SELECT     mfUltRecPag.CODCONTO, MAX(mfUltRecPag.id) AS ultRecModif
FROM         ALD_MFAnagraficaCFRiservatiPagamento AS mfUltRecPag INNER JOIN
                      EXTRACLIENTI AS EC ON mfUltRecPag.CODCONTO = EC.CODCONTO
where (mfUltRecPag.Esercizio=year(EC.dtCreazione) and FlagInserimento=1) or (mfUltRecPag.Esercizio>=year(EC.dtCreazione) and FlagInserimento=0)
GROUP BY mfUltRecPag.CODCONTO


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_Vista_CLIENTIVariazioniPagamentoMFM] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_Vista_CLIENTIVariazioniPagamentoMFM] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_Vista_CLIENTIVariazioniPagamentoMFM] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_CLIENTIVariazioniPagamentoMFM] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_Vista_CLIENTIVariazioniPagamentoMFM] TO [Metodo98]
    AS [dbo];

