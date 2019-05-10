
CREATE view [dbo].[Ald_VistaFatturatiAnalisiCommercialeAsa05]
as 
SELECT     Ald_VistaFatturatiAsa05.ESERCIZIO, Ald_VistaFatturatiAsa05.RIFCOMMCLI, Ald_VistaFatturatiAsa05.IdASA, Ald_VistaFatturatiAsa05.TotFatturatoCliente, 
                      Ald_VistaFatturatiAsa05.CODCLIFOR, ANAGRAFICACF.DSCCONTO1, ANAGRAFICACF.INDIRIZZO, ANAGRAFICACF.CAP, ANAGRAFICACF.LOCALITA, 
                      ANAGRAFICACF.PROVINCIA, ANAGRAFICACF.CODREGIONE, TABREGIONI.DESCRIZIONE AS DscRegione, ANAGRAFICACF.TELEFONO, ANAGRAFICACF.FAX, 
                      ANAGRAFICACF.TELEX AS email, ANAGRAFICACF.CODFISCALE, ANAGRAFICACF.PARTITAIVA, ANAGRAFICACF.CODNAZIONE, EXTRACLIENTI.Condominio, 
                      EXTRACLIENTI.IdAmministratore, GEM_TESTACONTRATTO.IDCONTRATTO, GEM_TESTACONTRATTO.REFERENTE, GEM_TESTACONTRATTO.TEL_REF, 
                      GEM_TESTACONTRATTO.EMAIL_RESPONSABILE, GEM_TESTACONTRATTO.IdDivisione, Ald_TabDivisioni.DscDivisione, 
                      ald_tblAmministratoriCondomini.Nominativo AS NominativoAmministratore, ald_tblAmministratoriCondomini.telefono AS TelAmministratore, 
                      ald_tblAmministratoriCondomini.fax AS FaxAmministratore, ald_tblAmministratoriCondomini.email AS emailAmministratore
FROM         EXTRACLIENTI RIGHT OUTER JOIN
                      TABREGIONI RIGHT OUTER JOIN
                      ANAGRAFICACF ON TABREGIONI.CODICE = ANAGRAFICACF.CODREGIONE ON EXTRACLIENTI.CODCONTO = ANAGRAFICACF.CODCONTO LEFT OUTER JOIN
                      ald_tblAmministratoriCondomini ON EXTRACLIENTI.IdAmministratore = ald_tblAmministratoriCondomini.IdAmmnistratore RIGHT OUTER JOIN
                      Ald_TabDivisioni RIGHT OUTER JOIN
                      Ald_VistaFatturatiAsa05 INNER JOIN
                      GEM_TESTACONTRATTO ON Ald_VistaFatturatiAsa05.CODCLIFOR = GEM_TESTACONTRATTO.CODCLIENTE ON 
                      Ald_TabDivisioni.IdDivisione = GEM_TESTACONTRATTO.IdDivisione ON ANAGRAFICACF.CODCONTO = Ald_VistaFatturatiAsa05.CODCLIFOR

WHERE     --(Ald_VistaFatturatiAsa05.ESERCIZIO = 2014) AND (Ald_VistaFatturatiAsa05.TotFatturatoCliente <= 1000) AND 
(GEM_TESTACONTRATTO.IdStato = 1)
--ORDER BY Ald_VistaFatturatiAsa05.ESERCIZIO, Ald_VistaFatturatiAsa05.CODCLIFOR, GEM_TESTACONTRATTO.IDCONTRATTO



GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistaFatturatiAnalisiCommercialeAsa05] TO [Metodo98]
    AS [dbo];

