CREATE VIEW CGesVistaNomiConfrontoAnalisiIndividuale AS 
   SELECT Nome, TipoReport, 
          AmbienteRif, AnnoInizioRif, MeseInizioRif, AnnoFineRif, MeseFineRif, 
          AmbienteC1, AnnoInizioC1, MeseInizioC1, AnnoFineC1, MeseFineC1, 
          AmbienteC2, AnnoInizioC2, MeseInizioC2, AnnoFineC2, MeseFineC2, 
          AmbienteC3, AnnoInizioC3, MeseInizioC3, AnnoFineC3, MeseFineC3
   FROM CGesConfrontoAnalisiIndividualeTeste
   GROUP BY Nome, TipoReport, 
            AmbienteRif, AnnoInizioRif, MeseInizioRif, AnnoFineRif, MeseFineRif, 
            AmbienteC1, AnnoInizioC1, MeseInizioC1, AnnoFineC1, MeseFineC1, 
            AmbienteC2, AnnoInizioC2, MeseInizioC2, AnnoFineC2, MeseFineC2, 
            AmbienteC3, AnnoInizioC3, MeseInizioC3, AnnoFineC3, MeseFineC3

GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesVistaNomiConfrontoAnalisiIndividuale] TO [Metodo98]
    AS [dbo];

