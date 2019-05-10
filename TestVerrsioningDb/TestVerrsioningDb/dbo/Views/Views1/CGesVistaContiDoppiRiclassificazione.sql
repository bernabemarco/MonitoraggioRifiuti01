
CREATE VIEW CGesVistaContiDoppiRiclassificazione AS 
   SELECT C1.CodConto, C1.Descrizione, COUNT(C1.CodConto) AS NumConti
   FROM CGesConti C1 INNER JOIN CGesLegamiRiclassificazioni C2 ON C1.CodConto = C2.CodConto
   WHERE C2.CodConto <> '' AND C2.Tipo IN (SELECT TipoRicl FROM CGesRiclassificazioneSelezionata)
   GROUP BY C1.CodConto, C1.Descrizione
GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesVistaContiDoppiRiclassificazione] TO [Metodo98]
    AS [dbo];

