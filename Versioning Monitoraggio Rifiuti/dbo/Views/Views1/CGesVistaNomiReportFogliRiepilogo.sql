CREATE VIEW CGesVistaNomiReportFogliRiepilogo AS 
   SELECT Nome, Ambiente, TipoReport, AnnoInizio, MeseInizio, AnnoFine, MeseFine
   FROM CGesReportFogliRiepilogoTeste
   GROUP BY Nome, Ambiente, TipoReport, AnnoInizio, MeseInizio, AnnoFine, MeseFine

GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesVistaNomiReportFogliRiepilogo] TO [Metodo98]
    AS [dbo];

