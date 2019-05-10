
CREATE view [dbo].[Gem_Vista_DettMezziRapp_Varianti]
as
SELECT     SC.idTipologMezzo,
--SCDM.CarTesto2,
(select isnull(sum(oreord),0) from GEM_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE as RapOre where RapOre.IDRAPPORTO=SCDM.IDRAPPORTO) as OreLavorate,
(CASE WHEN SC.idTipologMezzo IN (1, 5) THEN
                          (SELECT top 1    DscCarTesto2
                            FROM          GEM_Vista_Estintori_CartTesto2 AS vEstCT2
                            WHERE      vEstCT2.CartTesto2 = SCDM.CarTesto2)
							 + '/' 
							 + 
							 (SELECT top 1   DscCarTesto3
                            FROM          GEM_Vista_Estintori_CartTesto3 AS vEstCT3
                            WHERE      vEstCT3.CartTesto3 = SCDM.CarTesto3)
							+ '/' + 
							  (SELECT     DscCarTesto4
                            FROM          GEM_Vista_Estintori_CartTesto4 AS vEstCT4
                            WHERE      vEstCT4.CartTesto4 = SCDM.CarTesto4)
							  
							  
							  ELSE (CASE WHEN SC.idTipologMezzo IN (2, 6, 4) 
                      THEN SCDM.CarTesto1 ELSE '' END) END) AS variante,
SCDM.*

FROM         GEM_SEZIONECONTRATTORAPPORTIMEZZI as SCDM INNER JOIN
                      GEM_SEZIONICONTRATTO AS SC ON SCDM.IDCONTRATTO = SC.IDCONTRATTO AND 
                      SCDM.SEZIONECONTRATTO = SC.SEZIONECONTRATTO


GO
GRANT SELECT
    ON OBJECT::[dbo].[Gem_Vista_DettMezziRapp_Varianti] TO [Metodo98]
    AS [dbo];

