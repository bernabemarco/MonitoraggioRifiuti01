CREATE VIEW CGesVistaControlloContiRaccordo AS 
   SELECT * FROM CGesConti
   WHERE NOT EXISTS (SELECT Codice FROM CGesContiRaccordo WHERE CodConto1 = CGesConti.CodConto)

GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesVistaControlloContiRaccordo] TO [Metodo98]
    AS [dbo];

