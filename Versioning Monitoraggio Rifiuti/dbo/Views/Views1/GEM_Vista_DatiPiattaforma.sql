


/****** Oggetto:  View [dbo].[GEM_Vista_DatiPiattaforma]    Data script: 03/21/2013 14:32:38 ******/
CREATE VIEW [dbo].[GEM_Vista_DatiPiattaforma]
AS
SELECT     t1.IDCONTRATTO, t1.SEZIONECONTRATTO, t1.TIPO_PIATTAFORMA, t2.DESCRIZIONE, t1.GIORNI_PIATT, t2.CodiceArticolo,
(case when isnull(t2.CodiceArticolo,'')='' then 'No' else 'Si' end) as UsoPiattaforma
FROM         GEM_SEZIONICONTRATTO AS t1 LEFT OUTER JOIN
                      GEMMADBG.dbo.GEM_T_TipoPiattaforma AS t2 ON t2.CODICE = t1.TIPO_PIATTAFORMA COLLATE Latin1_General_CI_AS

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_Vista_DatiPiattaforma] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_Vista_DatiPiattaforma] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_Vista_DatiPiattaforma] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_DatiPiattaforma] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_Vista_DatiPiattaforma] TO [Metodo98]
    AS [dbo];

