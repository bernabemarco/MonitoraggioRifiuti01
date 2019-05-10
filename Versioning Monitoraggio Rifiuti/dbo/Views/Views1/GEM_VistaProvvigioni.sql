
CREATE VIEW GEM_VistaProvvigioni
AS

SELECT
  tp.idGProvvigioni,
  tp.Descrizione,
  tp.idTipologMezzo,
  rp.IdRigaProvvigione,
  rp.idAttivita,
  rp.SCONTO,
  rp.DaQTA,
  rp.AQTA,
  rp.DATAINIVALIDITA,
  rp.DATAFINEVALIDITA,
  rp.PROVVAG1,
  rp.PROVVAG2,
  rp.PROVVAG3

FROM [GEMMADBG].[dbo].[GEM_T_Provvigioni] tp inner join [GEMMADBG].[dbo].[GEM_T_RigheProvvigioni] rp
  on tp.idGProvvigioni = rp.idGProvvigioni

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaProvvigioni] TO [Metodo98]
    AS [dbo];

