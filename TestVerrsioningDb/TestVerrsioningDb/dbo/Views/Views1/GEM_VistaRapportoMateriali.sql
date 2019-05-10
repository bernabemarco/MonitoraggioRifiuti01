

create view [GEM_VistaRapportoMateriali]
as
SELECT     RpMat.IDRAPPORTO, RpMat.IDRIGA, RpMat.IDCONTRATTO, RpMat.SEZIONECONTRATTO, RpMat.IDMATERIALE, RpMat.PREZZO, RpMat.SCONTO, 
                      RpMat.QTA, RpMat.PROVVIGIONE1, RpMat.PROVVIGIONE2, RpMat.PROVVIGIONE3, RpMat.flg_mat_dafatt, RpMat.NoMovimentaMagazzino, 
                      RpMat.UTENTEMODIFICA, RpMat.DATAMODIFICA, (CASE WHEN isnull(GemPiattaF.CODICE, '') = '' THEN 0 ELSE 1 END) AS FlPiattaforma
FROM         GEM_SEZIONECONTRATTORAPPORTI_Materiali AS RpMat LEFT OUTER JOIN
                      GEM_Vista_TipoPiattaforma AS GemPiattaF ON RpMat.IDMATERIALE COLLATE Latin1_General_CI_AS = GemPiattaF.CodiceArticolo

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_VistaRapportoMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_VistaRapportoMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_VistaRapportoMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaRapportoMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_VistaRapportoMateriali] TO [Metodo98]
    AS [dbo];

