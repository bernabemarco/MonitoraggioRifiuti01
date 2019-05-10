CREATE VIEW CGesVistaAmbientiOperativi AS 
   SELECT * FROM CGesAmbienti
   WHERE Codice <> (SELECT AllAmbienti FROM CGesDatiVariAzienda WHERE Codice = 1)

GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesVistaAmbientiOperativi] TO [Metodo98]
    AS [dbo];

