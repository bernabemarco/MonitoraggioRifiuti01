CREATE VIEW CGesVistaNomiBilancio AS 
   SELECT Nome, Ambiente, TipoReport, AnnoInizio, MeseInizio, AnnoFine, MeseFine
   FROM CGesBilancioTeste
   GROUP BY Nome, Ambiente, TipoReport, AnnoInizio, MeseInizio, AnnoFine, MeseFine

GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesVistaNomiBilancio] TO [Metodo98]
    AS [dbo];

