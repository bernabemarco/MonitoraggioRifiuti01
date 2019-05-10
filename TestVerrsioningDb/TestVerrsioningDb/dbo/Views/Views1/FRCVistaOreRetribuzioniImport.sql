
CREATE VIEW FRCVistaOreRetribuzioniImport AS 
	SELECT ID, Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCOreRetribuzioniImport.Ambiente), '') AS Descrizione_Ambiente, Anno, 
		   Mese, IDRisorsa AS ID_Risorsa, ISNULL((SELECT Codice FROM FRCRisorse WHERE FRCRisorse.Progressivo = FRCOreRetribuzioniImport.IDRisorsa), '') AS Codice_Risorsa, 
		   ISNULL((SELECT Cognome FROM FRCRisorse WHERE FRCRisorse.Progressivo = FRCOreRetribuzioniImport.IDRisorsa), '') AS Cognome_Risorsa, 
		   ISNULL((SELECT Nome FROM FRCRisorse WHERE FRCRisorse.Progressivo = FRCOreRetribuzioniImport.IDRisorsa), '') AS Nome_Risorsa, 
		   Centro, ISNULL((SELECT Descrizione FROM CGesDestinazioni WHERE CGesDestinazioni.CodDestinazione = FRCOreRetribuzioniImport.Centro), '') AS Descrizione_Centro, 
		   Ore, Valore, CASE WHEN ISNULL((SELECT TOP 1 T2.CodConto FROM FRCRisorse T1 INNER JOIN FRCContiPersonale T2 ON T1.Qualifica = T2.Qualifica WHERE T1.Progressivo = FRCOreRetribuzioniImport.IDRisorsa), '') = ''
		   THEN ISNULL((SELECT TOP 1 CodConto FROM FRCContiPersonale WHERE CodDestinazione = FRCOreRetribuzioniImport.Centro), '')
		   ELSE ISNULL((SELECT TOP 1 T2.CodConto FROM FRCRisorse T1 INNER JOIN FRCContiPersonale T2 ON T1.Qualifica = T2.Qualifica WHERE T1.Progressivo = FRCOreRetribuzioniImport.IDRisorsa), '')
		   END AS CodConto
	FROM FRCOreRetribuzioniImport

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaOreRetribuzioniImport] TO [Metodo98]
    AS [dbo];

