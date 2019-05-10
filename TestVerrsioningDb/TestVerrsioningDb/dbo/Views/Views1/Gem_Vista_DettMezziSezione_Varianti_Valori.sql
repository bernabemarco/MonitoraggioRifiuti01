



CREATE view [dbo].[Gem_Vista_DettMezziSezione_Varianti_Valori]
as
SELECT   
isnull(scdm.data_prev, '1900-01-01') as Dt_PREV_Rivalutata,
TC.RIFCOMMCLI,  SC.idTipologMezzo, sc.idTipoFatt,
--SCDM.CarTesto2,
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
(isnull(SCDM.QUANTITA,1) * isnull(SCDM.IMPORTOAT1,0)) as TotIMPORTOAT1,
(isnull(SCDM.QUANTITA,1) * isnull(SCDM.IMPORTOAT2,0)) as TotIMPORTOAT2,
(isnull(SCDM.QUANTITA,1) * isnull(SCDM.IMPORTOAT3,0)) as TotIMPORTOAT3,
SCDM.*

FROM         GEM_SEZIONICONTRATTODETTMEZZI AS SCDM INNER JOIN
                      GEM_SEZIONICONTRATTO AS SC ON SCDM.IDCONTRATTO = SC.IDCONTRATTO AND SCDM.SEZIONECONTRATTO = SC.SEZIONECONTRATTO INNER JOIN
                      GEM_TESTACONTRATTO AS TC ON SC.IDCONTRATTO = TC.IDCONTRATTO

where isnull(SCDM.ELIMINATO,0)=0 and tc.idstato=1 and isnull(sc.FLAG_ELIMINATO,'N') in ('0','N','')
and isnull(TC.FLAG_ELIMINATO,'N') in ('0','N','')
--and sc.idcontratto='2014-003838SI'





GO
GRANT SELECT
    ON OBJECT::[dbo].[Gem_Vista_DettMezziSezione_Varianti_Valori] TO [Metodo98]
    AS [dbo];

