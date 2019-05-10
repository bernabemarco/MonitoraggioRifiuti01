

create VIEW [dbo].[GEM_TEMP_Vista_DettMezzoCheckListRev2016]
AS
SELECT     RIGHT('0000000000' + ISNULL(t2.POSCLIENTE, 0), 10) + '-' + RIGHT('000000000' + CAST(ISNULL(t2.POSIZIONE, 0) AS varchar(10)), 10) 
                      + '-' + RIGHT('000000000' + CAST(t2.IdRigaMezzo AS varchar(10)), 10) AS ordMezzo, t1.IDRAPPORTO, t1.IDRAPPORTOAGGREGATO, t1.IDCONTRATTO, 
                      t1.SEZIONECONTRATTO, ISNULL(t1.DATA_EFF, t1.DATA_PREV) AS Data_Eff, t1.ELIMINATO, t1.TIPO_RAPPORTO, t1.TIPOLOGIARAPPORTO, t2.IdRigaMezzo, 
                      t2.CodMezzo, t2.CarTesto1, t2.CarTesto2, t2.CarTesto3, t2.CarTesto4, t2.CarTesto5, t2.CarTesto6, t2.CarTesto7, t2.CarTesto8, t2.CarTesto9, t2.UBICAZIONE, t2.NOTE, 
                      t2.POSIZIONE, t2.POSCLIENTE, t2.SUBPOSIZIONE, t2.CodiceMezzoChekList, t2.VersioneChekList, t2.TitoloChekList, t4.IdRiga, t4.Descrizione, t4.DataInizioValidita, 
                      t4.Note AS NoteRigaCheckList, t4.Ordine, t4.Campo, t4.stampa, AA.DESCRIZIONE AS dscCodiceMezzo, t2.UTENTEMODIFICA_stp
FROM         GEM_SEZIONECONTRATTORAPPORTI AS t1 INNER JOIN
                      GEM_TEMP_SEZIONECONTRATTORAPPORTIMEZZI AS t2 ON t2.IDCONTRATTO = t1.IDCONTRATTO AND t2.SEZIONECONTRATTO = t1.SEZIONECONTRATTO AND 
                      t1.IDRAPPORTO = t2.IDRAPPORTO INNER JOIN
                      ANAGRAFICAARTICOLI AS AA ON t2.CodMezzo = AA.CODICE LEFT OUTER JOIN
                      GEM_Vista_CheckList AS t4 ON t2.VersioneChekList = t4.VersioneChekList AND t2.CodiceMezzoChekList COLLATE Latin1_General_CI_AS = t4.CodiceMezzo


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TEMP_Vista_DettMezzoCheckListRev2016] TO [Metodo98]
    AS [dbo];

