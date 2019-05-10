


CREATE view [dbo].[GRI_VistaMezziCheckList]
as
SELECT     Gem_VCodMezzi.TipoRapporto, RM_CL.IDRAPPORTO, 
 rapMezzi.CodiceMezzoChekList as CodMezzo, rap.IdTipoRapporto, RM_CL.IdRigaMezzo, RM_CL.IdRigaCL, rapMezzi.TitoloChekList, 
                      rapMezzi.VersioneChekList, RM_CL.Valore_0_NC, RM_CL.Valore_1_C, RM_CL.Valore_2_NE, RM_CL.Valore_3_NA, RM_CL.Ordine, RM_CL.Esito, 
                      RM_CL.ValoreRilevazione, RM_CL.AnnotazioneTecnica, AA.DESCRIZIONE AS DscCodiceMezzo, rapMezzi.POSIZIONE, rapMezzi.SUBPOSIZIONE, 
                      rapMezzi.UBICAZIONE, rapMezzi.POSCLIENTE, rapMezzi.NOTE, rapMezzi.CarTesto1, rapMezzi.CarTesto2, rapMezzi.CarTesto3, rapMezzi.CarTesto4, 
                      rapMezzi.CarTesto5, rapMezzi.CarTesto6, rapMezzi.CarTesto7, rapMezzi.CarTesto8, rapMezzi.CarTesto9
FROM         GRI_RAPPORTI AS rap INNER JOIN
                      GRI_RAPPORTIMEZZI AS rapMezzi ON rap.IDRAPPORTO = rapMezzi.IDRAPPORTO INNER JOIN
                      GRI_RAPPORTI_MEZZIChecklist AS RM_CL ON rapMezzi.IDRAPPORTO = RM_CL.IDRAPPORTO AND rapMezzi.IdRigaMezzo = RM_CL.IdRigaMezzo INNER JOIN
                      GEM_Vista_CodiciMezziAssegnati AS Gem_VCodMezzi ON rap.CodiceMezzo = Gem_VCodMezzi.CodiceMezzo COLLATE SQL_Latin1_General_CP1_CI_AS INNER JOIN
                      ANAGRAFICAARTICOLI AS AA ON rapMezzi.CodMezzo = AA.CODICE



GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_VistaMezziCheckList] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_VistaMezziCheckList] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_VistaMezziCheckList] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_VistaMezziCheckList] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_VistaMezziCheckList] TO [Metodo98]
    AS [dbo];

