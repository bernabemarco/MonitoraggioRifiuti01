

CREATE VIEW VISTAPROMOTOT
AS

SELECT     PROMO.Progressivo, PROMO.Descrizione, PROMO.CLIFOR, PROMO.GRUPPOPRZCF, PROMO.Data_Inizio, PROMO.Data_Fine, TOT.Da, TOT.A, 
                      TOT.CodPagamento, PAG.DESCRIZIONE AS DESCRIZIONEPAGAMENTO, PROMO.ABILITAPRZARTOMA, PROMO.ABILITASCTARTOMA, 
                      PROMO.SuNonEvad, TOT.Sconto, 'VALORE' AS TIPOLOGIA, '' AS 'UM_M', 0 AS 'Qta_Minima', '' AS CODICE, '' AS Tipo, 0 AS RANGEDA, 0 AS RANGEA, 
                      0 AS 'valore', 'ART' AS ELEMENTO, TOT.Riga
FROM         dbo.TP_PROMOZIONI_TESTE AS PROMO INNER JOIN
                      dbo.PROMOZIONI_TOTCOND AS TOT ON TOT.RifProgressivo = PROMO.Progressivo LEFT OUTER JOIN
                      dbo.TABPAGAMENTI AS PAG ON PAG.CODICE = TOT.CodPagamento
WHERE     (PROMO.Attiv_Disat = 0) AND (PROMO.Progressivo NOT IN
                          (SELECT     RifProgressivo
                            FROM          dbo.PROMOZIONI_DETT))
UNION
SELECT     PROMO.Progressivo, PROMO.Descrizione, PROMO.CLIFOR, PROMO.GRUPPOPRZCF, PROMO.Data_Inizio, PROMO.Data_Fine, TOT.Da, TOT.A, 
                      TOT.CodPagamento, PAG.DESCRIZIONE AS DESCRIZIONEPAGAMENTO, PROMO.ABILITAPRZARTOMA, PROMO.ABILITASCTARTOMA, 
                      PROMO.SuNonEvad, TOT.Sconto, 
                      CASE DETT.NRRIGA WHEN - 1 THEN 'VALORE' WHEN 0 THEN 'VALORE E ART TOT' ELSE 'VALORE E ART' END AS TIPOLOGIA, DETT.UM_M, 
                      DETT.Qta_Minima, PEA.CODICE, PLUS.Tipo, PLUS.da AS RANGEDA, PLUS.a AS RANGEA, PLUS.valore, 'ART' AS ELEMENTO, TOT.Riga
FROM         dbo.TP_PROMOZIONI_TESTE AS PROMO INNER JOIN
                      dbo.PROMOZIONI_TOTCOND AS TOT ON TOT.RifProgressivo = PROMO.Progressivo LEFT OUTER JOIN
                      dbo.PROMOZIONI_DETT AS DETT ON DETT.RifProgressivo = PROMO.Progressivo INNER JOIN
                      dbo.PROMOZIONI_ARTICOLO AS PEA ON PEA.RIFPROGRESSIVO = PROMO.Progressivo AND 
                      PEA.NRRIGA = (CASE WHEN DETT.NRRIGA > 0 THEN DETT.NRRIGA ELSE PEA.NRRIGA END) LEFT OUTER JOIN
                      dbo.PROMOZIONI_DETTRANGE AS PLUS ON PLUS.RifProgressivo = PROMO.Progressivo AND 
                      PLUS.NrRiga = (CASE WHEN DETT.NRRIGA > 0 THEN DETT.NRRIGA ELSE PLUS.NRRIGA END) LEFT OUTER JOIN
                      dbo.TABPAGAMENTI AS PAG ON PAG.CODICE = TOT.CodPagamento
WHERE     (PROMO.Attiv_Disat = 0)
UNION
SELECT     PROMO.Progressivo, PROMO.Descrizione, PROMO.CLIFOR, PROMO.GRUPPOPRZCF, PROMO.Data_Inizio, PROMO.Data_Fine, TOT.Da, TOT.A, 
                      TOT.CodPagamento, PAG.DESCRIZIONE AS DESCRIZIONEPAGAMENTO, PROMO.ABILITAPRZARTOMA, PROMO.ABILITASCTARTOMA, 
                      PROMO.SuNonEvad, TOT.Sconto, 
                      CASE DETT.NRRIGA WHEN - 1 THEN 'VALORE' WHEN 0 THEN 'VALORE E ART TOT' ELSE 'VALORE E ART' END AS TIPOLOGIA, DETT.UM_M, 
                      DETT.Qta_Minima, CAST(PEA.CODICE AS varchar) AS CODICE, PLUS.Tipo, PLUS.da AS RANGEDA, PLUS.a AS RANGEA, PLUS.valore, 
                      'GRP' AS ELEMENTO, TOT.Riga
FROM         dbo.TP_PROMOZIONI_TESTE AS PROMO INNER JOIN
                      dbo.PROMOZIONI_TOTCOND AS TOT ON TOT.RifProgressivo = PROMO.Progressivo LEFT OUTER JOIN
                      dbo.PROMOZIONI_DETT AS DETT ON DETT.RifProgressivo = PROMO.Progressivo INNER JOIN
                      dbo.PROMOZIONI_GRUPPO AS PEA ON PEA.RIFPROGRESSIVO = PROMO.Progressivo AND 
                      PEA.NRRIGA = (CASE WHEN DETT.NRRIGA > 0 THEN DETT.NRRIGA ELSE PEA.NRRIGA END) LEFT OUTER JOIN
                      dbo.PROMOZIONI_DETTRANGE AS PLUS ON PLUS.RifProgressivo = PROMO.Progressivo AND 
                      PLUS.NrRiga = (CASE WHEN DETT.NRRIGA > 0 THEN DETT.NRRIGA ELSE PLUS.NRRIGA END) LEFT OUTER JOIN
                      dbo.TABPAGAMENTI AS PAG ON PAG.CODICE = TOT.CodPagamento
WHERE     (PROMO.Attiv_Disat = 0)
UNION
SELECT     PROMO.Progressivo, PROMO.Descrizione, PROMO.CLIFOR, PROMO.GRUPPOPRZCF, PROMO.Data_Inizio, PROMO.Data_Fine, TOT.Da, TOT.A, 
                      TOT.CodPagamento, PAG.DESCRIZIONE AS DESCRIZIONEPAGAMENTO, PROMO.ABILITAPRZARTOMA, PROMO.ABILITASCTARTOMA, 
                      PROMO.SuNonEvad, TOT.Sconto, 
                      CASE DETT.NRRIGA WHEN - 1 THEN 'VALORE' WHEN 0 THEN 'VALORE E ART TOT' ELSE 'VALORE E ART' END AS TIPOLOGIA, DETT.UM_M, 
                      DETT.Qta_Minima, CAST(PEA.CODICE AS varchar) AS CODICE, PLUS.Tipo, PLUS.da AS RANGEDA, PLUS.a AS RANGEA, PLUS.valore, 
                      'CAT' AS ELEMENTO, TOT.Riga
FROM         dbo.TP_PROMOZIONI_TESTE AS PROMO INNER JOIN
                      dbo.PROMOZIONI_TOTCOND AS TOT ON TOT.RifProgressivo = PROMO.Progressivo LEFT OUTER JOIN
                      dbo.PROMOZIONI_DETT AS DETT ON DETT.RifProgressivo = PROMO.Progressivo INNER JOIN
                      dbo.PROMOZIONI_CATEGORIA AS PEA ON PEA.RIFPROGRESSIVO = PROMO.Progressivo AND 
                      PEA.NRRIGA = (CASE WHEN DETT.NRRIGA > 0 THEN DETT.NRRIGA ELSE PEA.NRRIGA END) LEFT OUTER JOIN
                      dbo.PROMOZIONI_DETTRANGE AS PLUS ON PLUS.RifProgressivo = PROMO.Progressivo AND 
                      PLUS.NrRiga = (CASE WHEN DETT.NRRIGA > 0 THEN DETT.NRRIGA ELSE PLUS.NRRIGA END) LEFT OUTER JOIN
                      dbo.TABPAGAMENTI AS PAG ON PAG.CODICE = TOT.CodPagamento
WHERE     (PROMO.Attiv_Disat = 0)
UNION
SELECT     PROMO.Progressivo, PROMO.Descrizione, PROMO.CLIFOR, PROMO.GRUPPOPRZCF, PROMO.Data_Inizio, PROMO.Data_Fine, TOT.Da, TOT.A, 
                      TOT.CodPagamento, PAG.DESCRIZIONE AS DESCRIZIONEPAGAMENTO, PROMO.ABILITAPRZARTOMA, PROMO.ABILITASCTARTOMA, 
                      PROMO.SuNonEvad, TOT.Sconto, 
                      CASE DETT.NRRIGA WHEN - 1 THEN 'VALORE' WHEN 0 THEN 'VALORE E ART TOT' ELSE 'VALORE E ART' END AS TIPOLOGIA, DETT.UM_M, 
                      DETT.Qta_Minima, CAST(PEA.CODICE AS varchar) AS CODICE, PLUS.Tipo, PLUS.da AS RANGEDA, PLUS.a AS RANGEA, PLUS.valore, 
                      'CATS' AS ELEMENTO, TOT.Riga
FROM         dbo.TP_PROMOZIONI_TESTE AS PROMO INNER JOIN
                      dbo.PROMOZIONI_TOTCOND AS TOT ON TOT.RifProgressivo = PROMO.Progressivo LEFT OUTER JOIN
                      dbo.PROMOZIONI_DETT AS DETT ON DETT.RifProgressivo = PROMO.Progressivo INNER JOIN
                      dbo.PROMOZIONI_CATEGORIAS AS PEA ON PEA.RIFPROGRESSIVO = PROMO.Progressivo AND 
                      PEA.NRRIGA = (CASE WHEN DETT.NRRIGA > 0 THEN DETT.NRRIGA ELSE PEA.NRRIGA END) LEFT OUTER JOIN
                      dbo.PROMOZIONI_DETTRANGE AS PLUS ON PLUS.RifProgressivo = PROMO.Progressivo AND 
                      PLUS.NrRiga = (CASE WHEN DETT.NRRIGA > 0 THEN DETT.NRRIGA ELSE PLUS.NRRIGA END) LEFT OUTER JOIN
                      dbo.TABPAGAMENTI AS PAG ON PAG.CODICE = TOT.CodPagamento
WHERE     (PROMO.Attiv_Disat = 0)
UNION
SELECT     PROMO.Progressivo, PROMO.Descrizione, PROMO.CLIFOR, PROMO.GRUPPOPRZCF, PROMO.Data_Inizio, PROMO.Data_Fine, TOT.Da, TOT.A, 
                      TOT.CodPagamento, PAG.DESCRIZIONE AS DESCRIZIONEPAGAMENTO, PROMO.ABILITAPRZARTOMA, PROMO.ABILITASCTARTOMA, 
                      PROMO.SuNonEvad, TOT.Sconto, 
                      CASE DETT.NRRIGA WHEN - 1 THEN 'VALORE' WHEN 0 THEN 'VALORE E ART TOT' ELSE 'VALORE E ART' END AS TIPOLOGIA, DETT.UM_M, 
                      DETT.Qta_Minima, CAST(PEA.CODICE AS varchar) AS CODICE, PLUS.Tipo, PLUS.da AS RANGEDA, PLUS.a AS RANGEA, PLUS.valore, 
                      'PRZ' AS ELEMENTO, TOT.Riga
FROM         dbo.TP_PROMOZIONI_TESTE AS PROMO INNER JOIN
                      dbo.PROMOZIONI_TOTCOND AS TOT ON TOT.RifProgressivo = PROMO.Progressivo LEFT OUTER JOIN
                      dbo.PROMOZIONI_DETT AS DETT ON DETT.RifProgressivo = PROMO.Progressivo INNER JOIN
                      dbo.PROMOZIONI_GRUPPO_PREZZI AS PEA ON PEA.RIFPROGRESSIVO = PROMO.Progressivo AND 
                      PEA.NRRIGA = (CASE WHEN DETT.NRRIGA > 0 THEN DETT.NRRIGA ELSE PEA.NRRIGA END) LEFT OUTER JOIN
                      dbo.PROMOZIONI_DETTRANGE AS PLUS ON PLUS.RifProgressivo = PROMO.Progressivo AND 
                      PLUS.NrRiga = (CASE WHEN DETT.NRRIGA > 0 THEN DETT.NRRIGA ELSE PLUS.NRRIGA END) LEFT OUTER JOIN
                      dbo.TABPAGAMENTI AS PAG ON PAG.CODICE = TOT.CodPagamento
WHERE     (PROMO.Attiv_Disat = 0)
UNION
SELECT     PROMO.Progressivo, PROMO.Descrizione, PROMO.CLIFOR, PROMO.GRUPPOPRZCF, PROMO.Data_Inizio, PROMO.Data_Fine, TOT.Da, TOT.A, 
                      TOT.CodPagamento, PAG.DESCRIZIONE AS DESCRIZIONEPAGAMENTO, PROMO.ABILITAPRZARTOMA, PROMO.ABILITASCTARTOMA, 
                      PROMO.SuNonEvad, TOT.Sconto, 
                      CASE DETT.NRRIGA WHEN - 1 THEN 'VALORE' WHEN 0 THEN 'VALORE E ART TOT' ELSE 'VALORE E ART' END AS TIPOLOGIA, DETT.UM_M, 
                      DETT.Qta_Minima, CAST(PEA.FAMIGLIA AS varchar) + '|' + CAST(PEA.REPARTO AS varchar) AS CODICE, PLUS.Tipo, PLUS.da AS RANGEDA, 
                      PLUS.a AS RANGEA, PLUS.valore, 'FAMREP' AS ELEMENTO, TOT.Riga
FROM         dbo.TP_PROMOZIONI_TESTE AS PROMO INNER JOIN
                      dbo.PROMOZIONI_TOTCOND AS TOT ON TOT.RifProgressivo = PROMO.Progressivo LEFT OUTER JOIN
                      dbo.PROMOZIONI_DETT AS DETT ON DETT.RifProgressivo = PROMO.Progressivo INNER JOIN
                      dbo.PROMOZIONI_FAMREP AS PEA ON PEA.RIFPROGRESSIVO = PROMO.Progressivo AND 
                      PEA.NRRIGA = (CASE WHEN DETT.NRRIGA > 0 THEN DETT.NRRIGA ELSE PEA.NRRIGA END) LEFT OUTER JOIN
                      dbo.PROMOZIONI_DETTRANGE AS PLUS ON PLUS.RifProgressivo = PROMO.Progressivo AND 
                      PLUS.NrRiga = (CASE WHEN DETT.NRRIGA > 0 THEN DETT.NRRIGA ELSE PLUS.NRRIGA END) LEFT OUTER JOIN
                      dbo.TABPAGAMENTI AS PAG ON PAG.CODICE = TOT.CodPagamento
WHERE     (PROMO.Attiv_Disat = 0)
UNION
SELECT     PROMO.Progressivo, PROMO.Descrizione, PROMO.CLIFOR, PROMO.GRUPPOPRZCF, PROMO.Data_Inizio, PROMO.Data_Fine, TOT.Da, TOT.A, 
                      TOT.CodPagamento, PAG.DESCRIZIONE AS DESCRIZIONEPAGAMENTO, PROMO.ABILITAPRZARTOMA, PROMO.ABILITASCTARTOMA, 
                      PROMO.SuNonEvad, TOT.Sconto, 
                      CASE DETT.NRRIGA WHEN - 1 THEN 'VALORE' WHEN 0 THEN 'VALORE E ART TOT' ELSE 'VALORE E ART' END AS TIPOLOGIA, DETT.UM_M, 
                      DETT.Qta_Minima, PEA.CODICE, PLUS.Tipo, PLUS.da AS RANGEDA, PLUS.a AS RANGEA, PLUS.valore, 'LIV' AS ELEMENTO, TOT.Riga
FROM         dbo.TP_PROMOZIONI_TESTE AS PROMO INNER JOIN
                      dbo.PROMOZIONI_TOTCOND AS TOT ON TOT.RifProgressivo = PROMO.Progressivo LEFT OUTER JOIN
                      dbo.PROMOZIONI_DETT AS DETT ON DETT.RifProgressivo = PROMO.Progressivo INNER JOIN
                      dbo.PROMOZIONI_LIVELLIMERCEOLOGICI AS PEA ON PEA.RIFPROGRESSIVO = PROMO.Progressivo LEFT OUTER JOIN
                      dbo.PROMOZIONI_DETTRANGE AS PLUS ON PLUS.RifProgressivo = PROMO.Progressivo AND 
                      PLUS.NrRiga = (CASE WHEN DETT.NRRIGA > 0 THEN DETT.NRRIGA ELSE PLUS.NRRIGA END) LEFT OUTER JOIN
                      dbo.TABPAGAMENTI AS PAG ON PAG.CODICE = TOT.CodPagamento
WHERE     (PROMO.Attiv_Disat = 0)
UNION
SELECT     PROMO.Progressivo, PROMO.Descrizione, PROMO.CLIFOR, PROMO.GRUPPOPRZCF, PROMO.Data_Inizio, PROMO.Data_Fine, TOT.Da, TOT.A, 
                      TOT.CodPagamento, PAG.DESCRIZIONE AS DESCRIZIONEPAGAMENTO, PROMO.ABILITAPRZARTOMA, PROMO.ABILITASCTARTOMA, 
                      PROMO.SuNonEvad, TOT.Sconto, 
                      CASE DETT.NRRIGA WHEN - 1 THEN 'VALORE' WHEN 0 THEN 'VALORE E ART TOT' ELSE 'VALORE E ART' END AS TIPOLOGIA, DETT.UM_M, 
                      DETT.Qta_Minima, CAST(PEA.CODFEATURE AS varchar) + '|' + CAST(PEA.VARESPLICITE AS varchar) AS CODICE, PLUS.Tipo, PLUS.da AS RANGEDA, PLUS.a AS RANGEA, PLUS.valore, 
                      'FT' AS ELEMENTO, TOT.Riga
FROM         dbo.TP_PROMOZIONI_TESTE AS PROMO INNER JOIN
                      dbo.PROMOZIONI_TOTCOND AS TOT ON TOT.RifProgressivo = PROMO.Progressivo LEFT OUTER JOIN
                      dbo.PROMOZIONI_DETT AS DETT ON DETT.RifProgressivo = PROMO.Progressivo INNER JOIN
                      dbo.PROMOZIONI_FEATURE AS PEA ON PEA.RIFPROGRESSIVO = PROMO.Progressivo AND 
                      PEA.NRRIGA = (CASE WHEN DETT.NRRIGA > 0 THEN DETT.NRRIGA ELSE PEA.NRRIGA END) LEFT OUTER JOIN
                      dbo.PROMOZIONI_DETTRANGE AS PLUS ON PLUS.RifProgressivo = PROMO.Progressivo AND 
                      PLUS.NrRiga = (CASE WHEN DETT.NRRIGA > 0 THEN DETT.NRRIGA ELSE PLUS.NRRIGA END) LEFT OUTER JOIN
                      dbo.TABPAGAMENTI AS PAG ON PAG.CODICE = TOT.CodPagamento
WHERE     (PROMO.Attiv_Disat = 0)


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAPROMOTOT] TO [Metodo98]
    AS [dbo];

