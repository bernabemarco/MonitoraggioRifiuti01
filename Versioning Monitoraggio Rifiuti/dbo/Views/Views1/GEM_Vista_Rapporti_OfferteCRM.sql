
CREATE VIEW GEM_Vista_Rapporti_OfferteCRM
as
/*AND TC.CODCLIENTE='C 10189'
AND MONTH(DATA_EFF)>=1
AND YEAR(DATA_EFF)=2017
ORDER BY SC.CODDEST*/
SELECT     TabSettGV.Descrizione, DDV.RAGIONESOCIALE, DDV.INDIRIZZO, DDV.LOCALITA, DDV.PROVINCIA, RP.IDRAPPORTO, RP.DATA_EFF, 
                      AA.DESCRIZIONE AS DescrizioneArticolo, RP.NOTE_INTERNE, TTab_Anomalia.DscAnomalia, RM_Anomalie.Note, RM_Anomalie.idStatoAnomalia, 
                      RM_Anomalie.DataApertura, RM_Anomalie.IdRapportoChiusura, RM_Anomalie.DataChiusura, RM_Anomalie.IdRigaMezzo, RMezzi.POSCLIENTE, 
                      RMezzi.UBICAZIONE
FROM         ANAGRAFICAARTICOLI AS AA INNER JOIN
                      ANAGRAFICACF AS AC INNER JOIN
                      DESTINAZIONIDIVERSE AS DDV ON AC.CODCONTO = DDV.CODCONTO INNER JOIN
                      GEM_SEZIONECONTRATTORAPPORTI AS RP INNER JOIN
                      GEM_TESTACONTRATTO AS TC ON RP.IDCONTRATTO = TC.IDCONTRATTO ON AC.CODCONTO = TC.CODCLIENTE INNER JOIN
                      GEM_SEZIONICONTRATTO AS SC ON TC.IDCONTRATTO = SC.IDCONTRATTO AND RP.SEZIONECONTRATTO = SC.SEZIONECONTRATTO AND 
                      DDV.CODICE = SC.CODDEST ON AA.CODICE = SC.CodiceMezzo INNER JOIN
                      ALD_TabSettoriGiriVisite AS TabSettGV ON DDV.CodSettoreGiriVisite = TabSettGV.Codice INNER JOIN
                      GEM_SEZIONECONTRATTORAPPORTIMEZZI AS RMezzi ON RP.IDCONTRATTO = RMezzi.IDCONTRATTO AND RP.IDRAPPORTO = RMezzi.IDRAPPORTO AND 
                      RP.SEZIONECONTRATTO = RMezzi.SEZIONECONTRATTO INNER JOIN
                      GEM_SEZIONECONTRATTORAPPORTIMEZZI_Anomalie AS RM_Anomalie ON RMezzi.IDCONTRATTO = RM_Anomalie.IDCONTRATTO AND 
                      RMezzi.SEZIONECONTRATTO = RM_Anomalie.SEZIONECONTRATTO AND RMezzi.IDRAPPORTO = RM_Anomalie.IdRapporto AND 
                      RMezzi.IdRigaMezzo = RM_Anomalie.IdRigaMezzo LEFT OUTER JOIN
                      GEM_T_TAB_ANOMALIE AS TTab_Anomalia ON RM_Anomalie.idAnomalia = TTab_Anomalia.idAnomalia
WHERE     (RP.STATO IN ('E', 'D', 'F', 'V')) AND (ISNULL(RP.ELIMINATO, '') <> 'S')

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_Rapporti_OfferteCRM] TO [Metodo98]
    AS [dbo];

