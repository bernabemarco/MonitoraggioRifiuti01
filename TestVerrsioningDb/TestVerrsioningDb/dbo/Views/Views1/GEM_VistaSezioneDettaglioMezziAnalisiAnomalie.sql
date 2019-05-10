

create view [dbo].[GEM_VistaSezioneDettaglioMezziAnalisiAnomalie]
as
SELECT     SC.IDCONTRATTO, SC.SEZIONECONTRATTO, SC.CodiceMezzo, SC.idTipologMezzo, SC.FLAG_ELIMINATO, DM.IdRigaMezzo, CAST(ISNULL(DM.NOTE, '') 
                      AS varchar(2000)) AS Note
FROM         GEM_SEZIONICONTRATTO AS SC INNER JOIN
                      GEM_TESTACONTRATTO AS TC ON SC.IDCONTRATTO = TC.IDCONTRATTO INNER JOIN
                      GEM_SEZIONICONTRATTODETTMEZZI AS DM ON SC.IDCONTRATTO = DM.IDCONTRATTO AND SC.SEZIONECONTRATTO = DM.SEZIONECONTRATTO
WHERE     (TC.IdStato = 1) AND (SC.idTipologMezzo <> 3) AND (SC.FLAG_ELIMINATO IN ('N', '', '0')) AND (DM.ELIMINATO = '0') AND (LEN(ISNULL(DM.NOTE, '')) > 0)



GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_VistaSezioneDettaglioMezziAnalisiAnomalie] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_VistaSezioneDettaglioMezziAnalisiAnomalie] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_VistaSezioneDettaglioMezziAnalisiAnomalie] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaSezioneDettaglioMezziAnalisiAnomalie] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_VistaSezioneDettaglioMezziAnalisiAnomalie] TO [Metodo98]
    AS [dbo];

