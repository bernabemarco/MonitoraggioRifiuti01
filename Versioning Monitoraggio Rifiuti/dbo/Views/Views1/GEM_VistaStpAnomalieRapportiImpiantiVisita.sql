

/****** Oggetto:  View [dbo].[GEM_VistaStpAnomalieRapportiImpiantiVisita]    Data script: 04/09/2013 15:32:33 ******/
CREATE VIEW [dbo].[GEM_VistaStpAnomalieRapportiImpiantiVisita]
AS
SELECT     TempRappMezzi.IDRAPPORTO, COUNT(TempRappMezzi.IDRAPPORTO) AS AnomaliaImpiantoVisita, TempRappMezzi.UTENTEMODIFICA_stp                  
FROM         GEM_TEMP_SEZIONECONTRATTORAPPORTIMEZZI AS TempRappMezzi INNER JOIN
                      GEM_SEZIONECONTRATTORAPPORTIMEZZI_CheckList AS gChkL ON TempRappMezzi.IDCONTRATTO = gChkL.IDCONTRATTO AND 
                      TempRappMezzi.SEZIONECONTRATTO = gChkL.SEZIONECONTRATTO AND TempRappMezzi.IDRAPPORTO = gChkL.IDRAPPORTO AND 
                      TempRappMezzi.IdRigaMezzo = gChkL.IdRigaMezzo
WHERE     (CAST(ISNULL(gChkL.Esito, '100') AS smallint) = 0) 
--(CAST(ISNULL(TempRappMezzi.CAMPO01, '100') AS smallint) = 0)
--OR
--                      (CAST(ISNULL(TempRappMezzi.CAMPO02, '100') AS smallint) = 0) OR
--                      (CAST(ISNULL(TempRappMezzi.CAMPO03, '100') AS smallint) = 0) OR
--                      (CAST(ISNULL(TempRappMezzi.CAMPO04, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO05, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO06, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO07, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO08, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO09, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO10, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO11, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO12, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO13, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO14, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO15, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO16, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO17, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO18, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO19, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO20, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO21, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO22, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO23, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO24, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO25, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO26, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO27, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO28, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO29, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO30, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO31, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO32, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO33, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO34, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO35, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO36, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO37, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO38, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO39, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO40, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO41, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO42, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO43, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO44, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO45, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO46, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO47, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO48, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO49, '100') AS smallint) = 0) OR
                      --(CAST(ISNULL(TempRappMezzi.CAMPO50, '100') AS smallint) = 0)
GROUP BY TempRappMezzi.IDRAPPORTO, TempRappMezzi.IdRigaMezzo, TempRappMezzi.UTENTEMODIFICA_stp
HAVING      (TempRappMezzi.IdRigaMezzo = 0)

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaStpAnomalieRapportiImpiantiVisita] TO [Metodo98]
    AS [dbo];

