
CREATE VIEW VISTADOLEGAMECAMPAGNEPROMO
AS

SELECT     dbo.TP_PROMOZIONI_TESTE.NumeroCampagna, dbo.TP_PROMOZIONI_TESTE.Progressivo, dbo.TP_PROMOZIONI_TESTE.Descrizione, 
                      dbo.TP_PROMOZIONI_TESTE.Data_Inizio, dbo.TP_PROMOZIONI_TESTE.Data_Fine, dbo.TP_PROMOZIONI_TESTE.Attiv_Disat, dbo.TP_PROMOZIONI_TESTE.CLIFOR, 
                      CASE WHEN TP_PROMOZIONI_TESTE.Tipo = 0 THEN CAST(TP_PROMOZIONI_TESTE.Progressivo AS varchar) 
                      + '-' + TP_PROMOZIONI_TESTE.Descrizione + ' - S' ELSE CASE WHEN tp_promozioni_teste.tipo = 1 THEN CAST(TP_PROMOZIONI_TESTE.Progressivo AS varchar) 
                      + '-' + TP_PROMOZIONI_TESTE.Descrizione + ' - R' ELSE CAST(TP_PROMOZIONI_TESTE.Progressivo AS varchar) 
                      + '-' + TP_PROMOZIONI_TESTE.Descrizione + ' - T' END END AS DescrizioneConTipologia, dbo.TP_PROMOZIONI_TESTE.GRUPPOPRZCF, 
                      dbo.TP_PROMOZIONI_TESTE.CODSETTORE, dbo.TP_PROMOZIONI_TESTE.CODZONA, dbo.TP_PROMOZIONI_TESTE.CODCATEGORIA
FROM         dbo.TP_CAMPAGNE INNER JOIN
                      dbo.TP_PROMOZIONI_TESTE ON dbo.TP_CAMPAGNE.NumeroCampagna = dbo.TP_PROMOZIONI_TESTE.NumeroCampagna
WHERE     (dbo.TP_PROMOZIONI_TESTE.Tipo < 2)


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTADOLEGAMECAMPAGNEPROMO] TO [Metodo98]
    AS [dbo];

