
CREATE VIEW [GEM_Vista_RapportiIntragruppo_OreInt]
AS

SELECT     GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.IDCONTRATTO, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.SEZIONECONTRATTO, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.IDRAPPORTO, GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.Progressivo, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.AZRIF, GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.idRiga, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.TIPOLOGIARAPPORTO, GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.DATA, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.TECNICO, GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.OREORD, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.ORESTRA, GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.OREVIAGGIO, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.TRASFERTA, GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.KM, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.UTENTEMODIFICA, GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.DATAMODIFICA, 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.ELIMINATO, ANAGRAFICAAGENTI.DSCAGENTE AS DscTecnicoOreInt, 
                      GEM_Vista_Ore_Addebito.CodArticoloMET_OREORD, GEM_Vista_Ore_Addebito.CodArticoloMET_ORESTRA, 
                      GEM_Vista_Ore_Addebito.CodArticoloMET_OREVIAGGIO, GEM_Vista_Ore_Addebito.CodArticoloMET_TRASFERTA, 
                      GEM_Vista_Ore_Addebito.CodArticoloMET_KM, GEM_Vista_Ore_Addebito.idTipologMezzo
FROM         GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt INNER JOIN
                      ANAGRAFICAAGENTI ON 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.TECNICO COLLATE SQL_Latin1_General_CP1_CI_AS = ANAGRAFICAAGENTI.CODAGENTE INNER
                       JOIN
                      GEM_Vista_Ore_Addebito ON 
                      GemmaSync.dbo.GEM_Vista_RapportiIntragruppo_OreInt.TIPOLOGIARAPPORTO = GEM_Vista_Ore_Addebito.TIPOLOGIARAPPORTO

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_RapportiIntragruppo_OreInt] TO [Metodo98]
    AS [dbo];

