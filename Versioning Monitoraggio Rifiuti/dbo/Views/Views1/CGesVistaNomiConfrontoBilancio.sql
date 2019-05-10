CREATE VIEW CGesVistaNomiConfrontoBilancio AS 
   SELECT Nome, AmbienteRif, AnnoInizioRif, MeseInizioRif, AnnoFineRif, MeseFineRif, 
          AmbienteC1, AnnoInizioC1, MeseInizioC1, AnnoFineC1, MeseFineC1, 
          AmbienteC2, AnnoInizioC2, MeseInizioC2, AnnoFineC2, MeseFineC2, 
          AmbienteC3, AnnoInizioC3, MeseInizioC3, AnnoFineC3, MeseFineC3
   FROM CGesConfrontoBilancioTeste
   GROUP BY Nome, AmbienteRif, AnnoInizioRif, MeseInizioRif, AnnoFineRif, MeseFineRif, 
            AmbienteC1, AnnoInizioC1, MeseInizioC1, AnnoFineC1, MeseFineC1, 
            AmbienteC2, AnnoInizioC2, MeseInizioC2, AnnoFineC2, MeseFineC2, 
            AmbienteC3, AnnoInizioC3, MeseInizioC3, AnnoFineC3, MeseFineC3

GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesVistaNomiConfrontoBilancio] TO [Metodo98]
    AS [dbo];

