
CREATE VIEW FRCVistaVociCostoPersonale AS 
	SELECT Codice, Descrizione, Gruppo, RiferimentoTemporale, Divisore, PercMaggiorazione, Coefficiente, Contributi, TFR, Note, 
		   (SELECT Descrizione FROM FRCGruppiCosti WHERE Codice = FRCVociCostoPersonale.Gruppo) AS DesGruppo 
	FROM FRCVociCostoPersonale

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaVociCostoPersonale] TO [Metodo98]
    AS [dbo];

