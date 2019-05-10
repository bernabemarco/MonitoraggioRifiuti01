
CREATE VIEW [dbo].[GEM_Vista_StatoProcessoRapporti]

AS
SELECT     t1.IDCONTRATTO, t1.IDRAPPORTO, t1.SEZIONECONTRATTO, t1.STATO, t2.Descrizione, t1.TIPOLOGIARAPPORTO, t1.TIPO_RAPPORTO, t1.DATA_PREV, 
                      t1.DATA_EFF, t1.DATA_FATT, t1.DA_FATT, t1.DataEliminazione, t1.TECNICO_EFF, t1.TECNICO_PREV, t1.ELIMINATO
FROM         GEM_SEZIONECONTRATTORAPPORTI AS t1 LEFT OUTER JOIN
                      GEMMADBG.dbo.GEM_T_TAB_StatoProcessoRapporti AS t2 ON t2.Codice = t1.STATO COLLATE Latin1_General_CI_AS
WHERE     (ISNULL(t1.ELIMINATO, 'N') IN ('N', '0'))

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_Vista_StatoProcessoRapporti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_Vista_StatoProcessoRapporti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_Vista_StatoProcessoRapporti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_StatoProcessoRapporti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_Vista_StatoProcessoRapporti] TO [Metodo98]
    AS [dbo];

