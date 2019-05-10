
CREATE VIEW dbo.Aiot_TP_PROMOZIONI_TESTE
AS
SELECT     Progressivo, NumeroCampagna, Descrizione, Data_Inizio, Data_Fine, Attiv_Disat, Sconto_M_O, Tipo, UM_M, Qta_M, Prezzo_M, Prezzo_M_Euro, 
                      Agg_Sost, SuNonEvad, ScontoSost, ScontoAgg, ScontoFinale, CASE WHEN tipo = 0 THEN piudicui ELSE - 1 END AS piudicui, CodPag, Note, 
                      CLIFOR
FROM         dbo.TP_PROMOZIONI_TESTE


GO
GRANT DELETE
    ON OBJECT::[dbo].[Aiot_TP_PROMOZIONI_TESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Aiot_TP_PROMOZIONI_TESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Aiot_TP_PROMOZIONI_TESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Aiot_TP_PROMOZIONI_TESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Aiot_TP_PROMOZIONI_TESTE] TO [Metodo98]
    AS [dbo];

