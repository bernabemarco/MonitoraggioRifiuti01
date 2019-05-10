
-- vista per ultima dt e ultimo utente modifica pagamento anagrafico
CREATE VIEW [dbo].[ALD_Vista_FornitoriVariazioniPagamentoMFM]
AS
SELECT     mfUltRecPag.CODCONTO, MAX(mfUltRecPag.id) AS ultRecModif
FROM         ALD_MFAnagraficaCFRiservatiPagamento AS mfUltRecPag INNER JOIN
                      EXTRAFORNITORI AS EF ON mfUltRecPag.CODCONTO = EF.CODCONTO
where (mfUltRecPag.Esercizio=year(EF.dtCreazione) and FlagInserimento=1) or (mfUltRecPag.Esercizio>=year(EF.dtCreazione) and FlagInserimento=0)
GROUP BY mfUltRecPag.CODCONTO

GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_FornitoriVariazioniPagamentoMFM] TO [Metodo98]
    AS [dbo];

