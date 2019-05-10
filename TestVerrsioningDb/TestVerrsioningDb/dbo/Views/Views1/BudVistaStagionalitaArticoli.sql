CREATE VIEW BudVistaStagionalitaArticoli AS 
    SELECT BSA.Progressivo, BSA.Articolo, (SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE = BSA.Articolo) AS DescrizioneArt, 
           BSA.Descrizione AS NoteT, BSAR.Anno, BSAR.Mese, BSAR.Valore, BSAR.Note AS NoteR, BSAR.Progressivo AS ProgressivoR 
    FROM BudStagionalitaArticoli BSA INNER JOIN BudStagionalitaArticoliRighe BSAR ON BSA.Progressivo = BSAR.RifProgressivo

GO
GRANT SELECT
    ON OBJECT::[dbo].[BudVistaStagionalitaArticoli] TO [Metodo98]
    AS [dbo];

