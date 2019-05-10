CREATE VIEW CGesVistaContiPresentiTotali AS 
   SELECT CGesConti.CodConto, CGesConti.Descrizione, CGesValoriStorici.Ambiente, CGesValoriStorici.Anno, CGesValoriStorici.CodDestinazione, 
          SUM((CGesValoriStorici.ValoreVariabile + CGesValoriStorici.ValoreFisso) * CGesValoriStorici.Segno) AS Importo
   FROM CGesConti INNER JOIN CGesValoriStorici ON CGesConti.CodConto = CGesValoriStorici.CodConto
   GROUP BY CGesConti.CodConto, CGesConti.Descrizione, CGesValoriStorici.Ambiente, CGesValoriStorici.Anno, CGesValoriStorici.CodDestinazione

GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesVistaContiPresentiTotali] TO [Metodo98]
    AS [dbo];

