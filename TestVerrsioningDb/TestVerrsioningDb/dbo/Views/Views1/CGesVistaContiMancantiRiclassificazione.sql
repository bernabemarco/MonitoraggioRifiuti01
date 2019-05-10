CREATE VIEW CGesVistaContiMancantiRiclassificazione AS 
   SELECT C1.CodConto, C1.Descrizione
   FROM CGesConti C1 LEFT OUTER JOIN CGesVistaContiRiclassificazione C2 ON C1.CodConto = C2.CodConto
   WHERE C2.CodCOnto IS NULL

GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesVistaContiMancantiRiclassificazione] TO [Metodo98]
    AS [dbo];

