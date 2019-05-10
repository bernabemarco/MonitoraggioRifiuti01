
CREATE VIEW VIS_T_TAB_AssegnazioneCodMezzo_Modello AS
SELECT IdRiga,CodiceMezzo,DescrizioneListino,idGListinoModello,DataInizioValidita,DataFineValidita,UTENTEMODIFICA,DATAMODIFICA,CASE WHEN GETDATE() >= DataInizioValidita AND GETDATE() <= DataFineValidita THEN 'SI' ELSE '' END AS VIGORE 
FROM GEMMADBG..GEM_T_TAB_AssegnazioneCodMezzo_Modello

GO
GRANT SELECT
    ON OBJECT::[dbo].[VIS_T_TAB_AssegnazioneCodMezzo_Modello] TO [Metodo98]
    AS [dbo];

