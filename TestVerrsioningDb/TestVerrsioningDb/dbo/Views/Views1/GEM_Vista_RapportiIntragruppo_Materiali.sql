
CREATE VIEW [GEM_Vista_RapportiIntragruppo_Materiali]
AS

SELECT     GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.IDCONTRATTO, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.SEZIONECONTRATTO, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.IDRAPPORTO, GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.AZRIF, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.Progressivo, GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.IDRIGA, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.IDMATERIALE, GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.PREZZO, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.SCONTO, GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.QTA, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.PROVVIGIONE1, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.PROVVIGIONE2, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.PROVVIGIONE3, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.flg_mat_dafatt, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.NoMovimentaMagazzino, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.UTENTEMODIFICA, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.DATAMODIFICA, GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.ELIMINATO, 
                      VISTAANAGRAFICAARTICOLI.DESCRIZIONE AS DscArticolo, VISTAANAGRAFICAARTICOLI.UM1 AS UM
FROM         GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali INNER JOIN
                      VISTAANAGRAFICAARTICOLI ON 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_Materiali.IDMATERIALE = VISTAANAGRAFICAARTICOLI.CODICE COLLATE Latin1_General_CI_AS


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_RapportiIntragruppo_Materiali] TO [Metodo98]
    AS [dbo];

