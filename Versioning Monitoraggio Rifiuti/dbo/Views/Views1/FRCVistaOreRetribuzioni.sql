
CREATE VIEW FRCVistaOreRetribuzioni AS 
	SELECT ID, Ambiente, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRCOreRetribuzioni.Ambiente), '') AS Descrizione_Ambiente, Anno, 
		   Mese, IDRisorsa AS ID_Risorsa, ISNULL((SELECT Codice FROM FRCRisorse WHERE FRCRisorse.Progressivo = FRCOreRetribuzioni.IDRisorsa), '') AS Codice_Risorsa, 
		   ISNULL((SELECT Cognome FROM FRCRisorse WHERE FRCRisorse.Progressivo = FRCOreRetribuzioni.IDRisorsa), '') AS Cognome_Risorsa, 
		   ISNULL((SELECT Nome FROM FRCRisorse WHERE FRCRisorse.Progressivo = FRCOreRetribuzioni.IDRisorsa), '') AS Nome_Risorsa, 
		   VoceCosto AS Voce_Costo, ISNULL((SELECT Descrizione FROM FRCVociCostoPersonale WHERE FRCVociCostoPersonale.Codice = FRCOreRetribuzioni.VoceCosto), '') AS Descrizione_Voce_Costo, 
		   Valore, Ore 
	FROM FRCOreRetribuzioni

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaOreRetribuzioni] TO [Metodo98]
    AS [dbo];

