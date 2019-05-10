
create view gem_Vista_ListiniGemmaAttivitaSecondarie
as 

SELECT     GEM_VistaContratti.IDCONTRATTO, GEM_VistaContratti.CODCLIENTE, GEM_VistaContratti.DescTipologMezzo, GEM_VistaContratti.idGListinoContr, 
                      GEM_VistaAttivita.Descrizione, GEM_VistaListiniContratto.idAttivita, GEM_VistaListiniContratto.Listino, GEM_VistaListiniContratto.Netto, 
                      GEM_VistaListiniContratto.Sconto, GEM_VistaListiniContratto.DescVariante1 AS Variante1, GEM_VistaListiniContratto.DescVariante2 AS Variante2, 
                      GEM_VistaListiniContratto.DescVariante3 AS Variante3, GEM_VistaListiniContratto.DescVariante4 AS Variante4
FROM         GEM_VistaAttivita INNER JOIN
                      GEM_VistaListiniContratto ON GEM_VistaAttivita.IdAttivita = GEM_VistaListiniContratto.idAttivita INNER JOIN
                      GEM_VistaContratti ON GEM_VistaListiniContratto.idGListinoContr = GEM_VistaContratti.idGListinoContr
WHERE     (ISNULL(GEM_VistaContratti.SEZ_FLAG_ELIMINATO, '') <> 'S') AND (GEM_VistaAttivita.Primaria = 0)
GROUP BY GEM_VistaContratti.IDCONTRATTO, GEM_VistaContratti.CODCLIENTE, GEM_VistaContratti.DescTipologMezzo, GEM_VistaContratti.idGListinoContr, 
                      GEM_VistaAttivita.Descrizione, GEM_VistaListiniContratto.idAttivita, GEM_VistaListiniContratto.Listino, GEM_VistaListiniContratto.Netto, 
                      GEM_VistaListiniContratto.Sconto, GEM_VistaListiniContratto.DescVariante1, GEM_VistaListiniContratto.DescVariante2, GEM_VistaListiniContratto.DescVariante3, 
                      GEM_VistaListiniContratto.DescVariante4


GO
GRANT DELETE
    ON OBJECT::[dbo].[gem_Vista_ListiniGemmaAttivitaSecondarie] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[gem_Vista_ListiniGemmaAttivitaSecondarie] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[gem_Vista_ListiniGemmaAttivitaSecondarie] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[gem_Vista_ListiniGemmaAttivitaSecondarie] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[gem_Vista_ListiniGemmaAttivitaSecondarie] TO [Metodo98]
    AS [dbo];

