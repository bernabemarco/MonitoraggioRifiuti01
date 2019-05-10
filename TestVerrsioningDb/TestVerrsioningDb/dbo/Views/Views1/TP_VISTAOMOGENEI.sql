

CREATE VIEW TP_VISTAOMOGENEI
AS
SELECT   TP_EXTRAMAG.CodArt,
	 TP_EXTRAMAG.CodiceOmogeneo,
 	 TP_EXTRAMAG.Stato_Rev_Sos_Esa,
	(SELECT Descrizione 
	 FROM AnagraficaArticoli 
         WHERE Codice = TP_EXTRAMAG.CodArt) AS DesArticolo,
	StoricoPrezziArticolo.Data,
	StoricoPrezziArticolo.CodCliFor,
	(SELECT DscConto1 
	 FROM AnagraficaCF 
	 WHERE CodConto = CodCliFor) AS DesCliFor,
	StoricoPrezziArticolo.UM,
	StoricoPrezziArticolo.PrezzoEuro AS PrezzoUltimoAcquisto,
	ListiniArticoli.NrListino,
	ListiniArticoli.TP_PrezzoPartEuro,
	ListiniArticoli.TP_Sconti,
	ListiniArticoli.PrezzoEuro AS PrezzoVendita,
        (CASE  WHEN ListiniArticoli.PrezzoEuro > 0 
			THEN (ListiniArticoli.PrezzoEuro - StoricoPrezziArticolo.PrezzoEuro) 
		ELSE 0
	 END)	AS MARGINALITAVALORE,
        (CASE  WHEN ListiniArticoli.PrezzoEuro > 0 
			THEN (((ListiniArticoli.PrezzoEuro - StoricoPrezziArticolo.PrezzoEuro) * 100) / ListiniArticoli.PrezzoEuro) 
		ELSE 0
	 END)	AS MARGINALITAPERC
FROM TP_EXTRAMAG
	LEFT JOIN StoricoPrezziArticolo ON StoricoPrezziArticolo.CodArticolo=TP_EXTRAMAG.CODART AND StoricoPrezziArticolo.ULTIMO=1 AND StoricoPrezziArticolo.TIPOPREZZO='F'
	LEFT JOIN ListiniArticoli ON LISTINIARTICOLI.CODART=TP_EXTRAMAG.CODART
	INNER JOIN TABLISTINI ON TABLISTINI.NRLISTINO=LISTINIARTICOLI.NRLISTINO AND TABLISTINI.TP_TIPO='V'
WHERE TP_EXTRAMAG.CodiceOmogeneo<>''

GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VISTAOMOGENEI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VISTAOMOGENEI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_VISTAOMOGENEI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTAOMOGENEI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VISTAOMOGENEI] TO [Metodo98]
    AS [dbo];

