CREATE VIEW CGesVistaContiPresentiRiclassificazione AS 
   SELECT CGesConti.CodConto, CGesConti.Descrizione, CGesLegamiRiclassificazioni.Tipo
   FROM CGesConti INNER JOIN CGesLegamiRiclassificazioni ON CGesConti.CodConto = CGesLegamiRiclassificazioni.CodConto
   GROUP BY CGesConti.CodConto, CGesConti.Descrizione, CGesLegamiRiclassificazioni.Tipo

GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesVistaContiPresentiRiclassificazione] TO [Metodo98]
    AS [dbo];

