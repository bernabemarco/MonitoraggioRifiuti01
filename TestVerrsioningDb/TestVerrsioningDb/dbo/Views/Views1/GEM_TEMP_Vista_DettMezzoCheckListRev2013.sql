
CREATE VIEW [dbo].[GEM_TEMP_Vista_DettMezzoCheckListRev2013]
AS
SELECT     
( right('0000000000' + isnull(poscliente,0), 10) +'-'+ 
right('000000000'+cast(isnull(posizione,0) as varchar(10)),10) 
+'-'+
right('000000000'+cast(idrigamezzo as varchar(10)),10) 
) as ordMezzo,
t1.IDRAPPORTO, t1.IDRAPPORTOAGGREGATO, t1.IDCONTRATTO, t1.SEZIONECONTRATTO, ISNULL(t1.DATA_EFF, t1.DATA_PREV) AS Data_Eff, 
                      t1.ELIMINATO, t1.TIPO_RAPPORTO, t1.TIPOLOGIARAPPORTO, t2.IdRigaMezzo, t2.CodMezzo, t2.CarTesto1, t2.CarTesto2, t2.CarTesto3, t2.CarTesto4, 
                      t2.CarTesto5, t2.CarTesto6, t2.CarTesto7, t2.CarTesto8, t2.CarTesto9, t2.UBICAZIONE, t2.NOTE, t2.POSIZIONE, t2.POSCLIENTE, t2.SUBPOSIZIONE, 
                      t2.CodiceMezzoChekList, t2.VersioneChekList, t2.TitoloChekList, t4.IdRiga, t4.Descrizione, t4.DataInizioValidita, t4.Note AS NoteRigaCheckList, 
                      t4.Ordine, t4.Campo, t4.stampa, AA.DESCRIZIONE AS dscCodiceMezzo
FROM         GEM_SEZIONECONTRATTORAPPORTI AS t1 INNER JOIN
                      GEM_SEZIONECONTRATTORAPPORTIMEZZI AS t2 ON t2.IDCONTRATTO = t1.IDCONTRATTO AND 
                      t2.SEZIONECONTRATTO = t1.SEZIONECONTRATTO AND t1.IDRAPPORTO = t2.IDRAPPORTO INNER JOIN
                      ANAGRAFICAARTICOLI AS AA ON t2.CodMezzo = AA.CODICE LEFT OUTER JOIN
                      GEM_Vista_CheckList AS t4 ON t2.VersioneChekList = t4.VersioneChekList AND 
                      t2.CodiceMezzoChekList COLLATE Latin1_General_CI_AS = t4.CodiceMezzo

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_TEMP_Vista_DettMezzoCheckListRev2013] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_TEMP_Vista_DettMezzoCheckListRev2013] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_TEMP_Vista_DettMezzoCheckListRev2013] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TEMP_Vista_DettMezzoCheckListRev2013] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_TEMP_Vista_DettMezzoCheckListRev2013] TO [Metodo98]
    AS [dbo];

