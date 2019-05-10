
CREATE VIEW FRCVistaRisorse AS 
	SELECT Progressivo, Codice, Cognome, Nome, DataValidita, Qualifica, Livello, Attivo, CodDestinazione, Note, DataFineValidita, 
		   (SELECT Descrizione FROM FRCQualifiche WHERE Codice = FRCRisorse.Qualifica) AS DesQualifica, 
		   (SELECT Descrizione FROM CGesDestinazioni WHERE CodDestinazione = FRCRisorse.CodDestinazione) AS DesDestinazione
	FROM FRCRisorse

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaRisorse] TO [Metodo98]
    AS [dbo];

