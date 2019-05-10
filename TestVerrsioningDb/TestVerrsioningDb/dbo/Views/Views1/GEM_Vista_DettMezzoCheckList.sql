
CREATE VIEW [dbo].[GEM_Vista_DettMezzoCheckList]
AS
SELECT     t1.IDRAPPORTO, t1.IDRAPPORTOAGGREGATO, t1.IDCONTRATTO, t1.SEZIONECONTRATTO, t1.VersioneChekList, t1.ELIMINATO, ISNULL(t1.DATA_EFF, 
                      t1.DATA_PREV) AS Data_Eff, t2.IdRigaMezzo, t2.CarTesto1, t2.CarTesto2, t2.CarTesto3, t2.CarTesto4, t2.CarTesto5, t2.CarTesto6, t2.CarTesto7, 
                      t2.CarTesto8, t2.CarTesto9, t2.UBICAZIONE, t2.NOTE, t3.CodiceMezzo, t4.IdRiga, t4.Descrizione, t4.DataInizioValidita, t4.Note AS NoteDiTesta, 
                      t1.TIPOLOGIARAPPORTO, t1.TIPO_RAPPORTO, t2.POSIZIONE, t2.SUBPOSIZIONE, t2.POSCLIENTE, t4.Ordine, t4.Campo
FROM         GEM_SEZIONECONTRATTORAPPORTI AS t1 INNER JOIN
                      GEM_SEZIONECONTRATTORAPPORTIMEZZI AS t2 ON t2.IDCONTRATTO = t1.IDCONTRATTO AND 
                      t2.SEZIONECONTRATTO = t1.SEZIONECONTRATTO AND t1.IDRAPPORTO = t2.IDRAPPORTO INNER JOIN
                      GEM_VistaContratti AS t3 ON t3.IDCONTRATTO = t1.IDCONTRATTO AND t3.SEZIONECONTRATTO = t1.SEZIONECONTRATTO LEFT OUTER JOIN
                      GEM_Vista_CheckList AS t4 ON t4.CodiceMezzo = t3.CodiceMezzo COLLATE Latin1_General_CI_AS AND t4.VersioneChekList = t1.VersioneChekList

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_Vista_DettMezzoCheckList] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_Vista_DettMezzoCheckList] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_Vista_DettMezzoCheckList] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_DettMezzoCheckList] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_Vista_DettMezzoCheckList] TO [Metodo98]
    AS [dbo];

