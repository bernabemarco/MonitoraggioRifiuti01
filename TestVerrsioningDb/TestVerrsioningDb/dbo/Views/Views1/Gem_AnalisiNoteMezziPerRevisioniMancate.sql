create view  Gem_AnalisiNoteMezziPerRevisioniMancate
as
SELECT     

TC.CODCLIENTE, AC.DSCCONTO1, 
(select top 1 DATA_EFF from GEM_SEZIONECONTRATTORAPPORTI rap where rap.IDCONTRATTO=sezMezzi.IDCONTRATTO and isnull(DATA_EFF,'')<>'' order by DATA_EFF desc) as dtUltimorapp,
sezMezzi.DATA_PREV, left(sezMezzi.NOTE,30) as note, tc.IdDivisione, sezMezzi.IDCONTRATTO, sezMezzi.SEZIONECONTRATTO, sezMezzi.IdRigaMezzo, 
                      sezMezzi.CodMezzo, sezMezzi.DataInserimento, sezMezzi.ELIMINATO,  sezMezzi.UBICAZIONE, 
                       sezMezzi.OMOLOGATO, sezMezzi.ANNO, sezMezzi.CarTesto1, sezMezzi.CarTesto2, sezMezzi.CarTesto3, sezMezzi.CarTesto4, 
                      sezMezzi.CarTesto5, sezMezzi.CarTesto6
FROM         GEM_SEZIONICONTRATTODETTMEZZI AS sezMezzi INNER JOIN
                      GEM_TESTACONTRATTO AS TC ON sezMezzi.IDCONTRATTO = TC.IDCONTRATTO INNER JOIN
                      ANAGRAFICACF AS AC ON TC.CODCLIENTE = AC.CODCONTO
WHERE    
--la vista analizza il riferimento di esercizio legato alla dt di sistema
 (YEAR(sezMezzi.DATA_PREV) <= year(getdate()) 
 AND (ISNULL(sezMezzi.NOTE, '') <> '') AND (sezMezzi.ELIMINATO = 0) 
--attivare questa condizione per avere estrazione sulla nota se contiene la parola cliente o meno
--AND  not(sezMezzi.NOTE LIKE '%cliente%') 
AND (TC.IdStato = 1)
)
--ORDER BY tc.IdDivisione, AC.DSCCONTO1,  sezMezzi.DATA_PREV

GO
GRANT DELETE
    ON OBJECT::[dbo].[Gem_AnalisiNoteMezziPerRevisioniMancate] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Gem_AnalisiNoteMezziPerRevisioniMancate] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Gem_AnalisiNoteMezziPerRevisioniMancate] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Gem_AnalisiNoteMezziPerRevisioniMancate] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Gem_AnalisiNoteMezziPerRevisioniMancate] TO [Metodo98]
    AS [dbo];

