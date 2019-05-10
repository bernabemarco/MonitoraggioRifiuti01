

CREATE view [dbo].[CRM_VISTA_DestinazioneDiverse]
as
SELECT  
(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) as IdAzienda,	
   (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + DESTINAZIONIDIVERSE.CODCONTO AS codConto,DESTINAZIONIDIVERSE.CODCONTO as codcontometodo, DESTINAZIONIDIVERSE.CODICE, 
                      DESTINAZIONIDIVERSE.RAGIONESOCIALE, DESTINAZIONIDIVERSE.INDIRIZZO, DESTINAZIONIDIVERSE.CAP, DESTINAZIONIDIVERSE.LOCALITA, 
                      DESTINAZIONIDIVERSE.PROVINCIA, DESTINAZIONIDIVERSE.TELEFONO, DESTINAZIONIDIVERSE.FAX, DESTINAZIONIDIVERSE.ZonaSped, 
                      DESTINAZIONIDIVERSE.CodSettoreGiriVisite, ALD_TabSettoriGiriVisite.Descrizione AS DscTabSettoriGiroVisite, DESTINAZIONIDIVERSE.email, 
                      DESTINAZIONIDIVERSE.IdAmmnistratore, ald_tblAmministratoriCondomini.Nominativo AS DscAmministratore, DESTINAZIONIDIVERSE.codIstatComune, 
                      DESTINAZIONIDIVERSE.CODNAZIONE, TABNAZIONI.DESCRIZIONE AS DscNazione, DESTINAZIONIDIVERSE.Dismesso, EXTRACLIENTI.CodCRM
, 3 as ava_tipocliente
, 4 as ava_stato --3 in portafoglio da qualificare; 4 in portafoglio qualificato
FROM         DESTINAZIONIDIVERSE INNER JOIN
                      EXTRACLIENTI ON DESTINAZIONIDIVERSE.CODCONTO = EXTRACLIENTI.CODCONTO LEFT OUTER JOIN
                      ALD_TabSettoriGiriVisite ON DESTINAZIONIDIVERSE.CodSettoreGiriVisite = ALD_TabSettoriGiriVisite.Codice LEFT OUTER JOIN
                      ald_tblAmministratoriCondomini ON DESTINAZIONIDIVERSE.IdAmmnistratore = ald_tblAmministratoriCondomini.IdAmmnistratore LEFT OUTER JOIN
                      TABNAZIONI ON DESTINAZIONIDIVERSE.CODNAZIONE = TABNAZIONI.CODICE
WHERE     (DESTINAZIONIDIVERSE.Dismesso = 0) AND (LEFT(DESTINAZIONIDIVERSE.CODCONTO, 1) = 'C')
and isnull(EXTRACLIENTI.CodCRM,'')<>''
--aggiunto controllo per verifica su codice=1
--and DESTINAZIONIDIVERSE.CODICE=1


GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTA_DestinazioneDiverse] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTA_DestinazioneDiverse] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTA_DestinazioneDiverse] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTA_DestinazioneDiverse] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTA_DestinazioneDiverse] TO [Metodo98]
    AS [dbo];

