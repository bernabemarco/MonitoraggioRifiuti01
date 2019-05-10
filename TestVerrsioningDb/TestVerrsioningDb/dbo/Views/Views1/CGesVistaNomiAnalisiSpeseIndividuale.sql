CREATE VIEW CGesVistaNomiAnalisiSpeseIndividuale AS 
   SELECT Nome, Ambiente, TipoReport, AnnoInizio, MeseInizio, AnnoFine, MeseFine
   FROM CGesAnalisiIndividualeTeste
   GROUP BY Nome, Ambiente, TipoReport, AnnoInizio, MeseInizio, AnnoFine, MeseFine

GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesVistaNomiAnalisiSpeseIndividuale] TO [Metodo98]
    AS [dbo];

