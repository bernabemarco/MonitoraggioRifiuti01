
CREATE VIEW GEM_Vista_Aggto_CodPagamenti
AS
SELECT     tc.IDCONTRATTO, tc.CODCLIENTE, tc.CODCLIFAT, tc.PAGAMENTO, sc.SEZIONECONTRATTO, sc.PAGAMENTO AS SezPagamento, rp.IDRAPPORTO, 
                      rp.STATO, rp.CODPAG AS RapPagamento
FROM         dbo.GEM_TESTACONTRATTO AS tc INNER JOIN
                      dbo.GEM_SEZIONICONTRATTO AS sc ON tc.IDCONTRATTO = sc.IDCONTRATTO INNER JOIN
                      dbo.GEM_SEZIONECONTRATTORAPPORTI AS rp ON tc.IDCONTRATTO = rp.IDCONTRATTO

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_Aggto_CodPagamenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_Vista_Aggto_CodPagamenti] TO [Metodo98]
    AS [dbo];

