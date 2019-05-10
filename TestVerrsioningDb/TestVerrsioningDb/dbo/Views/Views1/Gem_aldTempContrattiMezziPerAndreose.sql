create view Gem_aldTempContrattiMezziPerAndreose
as
SELECT --TOP 160 
IDCONTRATTO,IdStato,
(SELECT DSCStato FROM [GEM_Vista_StatoContratto] WHERE [IdStato]=GEM_VistaDettMezziSezione.[IdStato]) 
AS DSCStato,SUBPOSIZIONE,DURATA,CODCLIENTE,
(SELECT DSCCONTO1 FROM Anagraficacf WHERE CodConto=CODCLIENTE) AS DSCCONTO1,
SEZIONECONTRATTO,DESCRIZIONESEZIONE,REPARTO,idTipologMezzo,DescTipologMezzo,CodiceMezzo,
(SELECT Descrizione FROM [anagraficaarticoli] WHERE [Codice]=GEM_VistaDettMezziSezione.[CodiceMezzo]) AS DscCodMezzo,
coddest,SedeRagSoc,SedeIndirizzo,SedeLocalita,SedeProvincia,CodSezioniAggregate,SezioneAggrPrimaria,IdRigaMezzo,CodMezzoDM,DataInserimento,
CarTesto1,CarTesto2,CarTesto3,CarTesto4,CarTesto5,CarTesto6,CarTesto7,CarTesto8,CarTesto9,OMOLOGATO,ANNO,FLAG_INST,STATO,POSIZIONE,POSCLIENTE,
UBICAZIONE,EliminatoDM,DataEliminazione,DATA_REV,DATA_PREV,DATA_COLL,DATA_PCOLL,NOTE_DM,Proprieta,Cespiste,ValoreCespite,StatoFuoriSede,
(SELECT Descrizione FROM [GEM_Vista_StatoFuoriSedeMezzo] WHERE [Codice]=GEM_VistaDettMezziSezione.[StatoFuoriSede]) AS DscStatoFS, replace(IMPORTOAT1,'.',',') as IMPORTOAT1,
replace(IMPORTOAT2,'.',',') as IMPORTOAT2,replace(IMPORTOAT3,'.',',') as IMPORTOAT3,replace(IMPORTOAT4,'.',',') as IMPORTOAT4, 
replace(IMPORTOAT5,'.',',') as IMPORTOAT5, replace(PROV1AT1,'.',',') as PROV1AT1, replace(PROV1AT2,'.',',') as PROV1AT2, 
replace(PROV1AT3,'.',',') as PROV1AT3, replace(PROV2AT1,'.',',') as PROV2AT1,
 replace(PROV2AT2,'.',',') as PROV2AT2, replace(PROV2AT3,'.',',') as PROV2AT3,SEZ_FLGUSAPRZGEMMA,idGListinoContr,
( SELECT IdDivisione FROM GEM_SEZIONICONTRATTO GSC  WHERE GEM_VistaDettMezziSezione.IDCONTRATTO=GSC.IDCONTRATTO  
AND GEM_VistaDettMezziSezione.SEZIONECONTRATTO=GSC.SEZIONECONTRATTO) AS IdDivisione,
( SELECT DscDivisione FROM GEM_SEZIONICONTRATTO GSC INNER JOIN  Ald_TabDivisioni ATD ON ATD.IdDivisione=GSC.IdDivisione  
WHERE GEM_VistaDettMezziSezione.IDCONTRATTO=GSC.IDCONTRATTO  AND GEM_VistaDettMezziSezione.SEZIONECONTRATTO=GSC.SEZIONECONTRATTO) AS DscDivisione,
CodTecnicoRisorsa,DescTecnicoRisorsa,AnnotazioniTecnica,
(select a.MINISFS  from GEM_TESTACONTRATTO  a where a.IDCONTRATTO = GEM_VistaDettMezziSezione.IDCONTRATTO) as MINISFS,
(select a.STAGIONALE  from GEM_TESTACONTRATTO  a where a.IDCONTRATTO = GEM_VistaDettMezziSezione.IDCONTRATTO) as STAGIONALE,
(SELECT CODNaturaServizio FROM GEM_Vista_CategoriaContratto CC, GEM_TESTACONTRATTO  a WHERE CC.CODCategoriaContratto=a.CODCategoriaContratto 
and a.IDCONTRATTO = GEM_VistaDettMezziSezione.IDCONTRATTO) AS CODNaturaServizio,(SELECT DSCNaturaServizio FROM GEM_Vista_CategoriaContratto CC, 
GEM_TESTACONTRATTO  a WHERE CC.CODCategoriaContratto=a.CODCategoriaContratto and a.IDCONTRATTO = GEM_VistaDettMezziSezione.IDCONTRATTO) AS DSCNaturaServizio,
(SELECT StatoAltro FROM VistaClienti WHERE CodConto=CODCLIENTE) AS StatoAltro FROM GEM_VistaDettMezziSezione 
WHERE (((IdStato =  1 ) AND (isnull(EliminatoDM,'N') in ('N','0','',' ')) AND (isnull(SEZ_FLAG_ELIMINATO,'N') in ('N','0','',' ')) 
AND (CodiceMezzo IN ('ESTINTNOL','ESTINTORE','IDRANTE','IDRANTNOL','S30','S31','S32','S38','S39')) 
AND (1=1) AND (1=1) AND (1=1) AND (1=1) AND (1=1) AND (1=1) AND (1=1) AND (1=1))) 
--ORDER BY IDCONTRATTO,SEZIONECONTRATTO,IdRigaMezzo

GO
GRANT DELETE
    ON OBJECT::[dbo].[Gem_aldTempContrattiMezziPerAndreose] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Gem_aldTempContrattiMezziPerAndreose] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Gem_aldTempContrattiMezziPerAndreose] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Gem_aldTempContrattiMezziPerAndreose] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Gem_aldTempContrattiMezziPerAndreose] TO [Metodo98]
    AS [dbo];

