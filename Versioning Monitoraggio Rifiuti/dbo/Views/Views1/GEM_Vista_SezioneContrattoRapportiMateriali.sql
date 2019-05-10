
CREATE VIEW [dbo].GEM_Vista_SezioneContrattoRapportiMateriali
AS
SELECT     MAT.IDRAPPORTO, MAT.IDRIGA, MAT.IDCONTRATTO, MAT.SEZIONECONTRATTO, MAT.IDMATERIALE, MAT.PREZZO, MAT.SCONTO, MAT.QTA, 
                      MAT.PROVVIGIONE1, MAT.PROVVIGIONE2, MAT.PROVVIGIONE3, MAT.flg_mat_dafatt, MAT.NoMovimentaMagazzino, MAT.UTENTEMODIFICA, 
                      MAT.DATAMODIFICA, 
                      (CASE WHEN MAT.IDMATERIALE = GEM_Vista_TipoPiattaforma.CodiceArticolo COLLATE Latin1_General_CI_AS THEN 1 ELSE 0 END) 
                      AS isPiattaforma
FROM         GEM_SEZIONECONTRATTORAPPORTI_Materiali AS MAT LEFT OUTER JOIN
                      GEM_Vista_TipoPiattaforma ON MAT.IDMATERIALE = GEM_Vista_TipoPiattaforma.CodiceArticolo COLLATE SQL_Latin1_General_CP1_CI_AS

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_Vista_SezioneContrattoRapportiMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_Vista_SezioneContrattoRapportiMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_Vista_SezioneContrattoRapportiMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_SezioneContrattoRapportiMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_Vista_SezioneContrattoRapportiMateriali] TO [Metodo98]
    AS [dbo];

