

CREATE VIEW AIOT_ANALISICOSTIF
AS

SELECT     CONTRATTO.ESERCIZIO, CONTRATTO.NUMEROCONTRATTO, CONTRATTO.DESCRIZIONECONTRATTO, CONTRATTO.CODICE, RIGHE.CODART, 
                      RIGHE.PREZZOUNITNETTOEURO, RIGHE.UMGEST, RIGHE.QTAGEST, RIGHE.TOTNETTORIGA, COST.perctrasporto, COST.incidenzabudgetincond, 
                      COST.incidenzabudgetcond, COST.incidenzaincond, COST.incidenzacond, COST.totalenettobudgetincond, COST.totalenettobudgetcond, COST.totalenettocond, 
                      COST.totalenettoprovvigioni, COST.totalenettoscontimerce, COST.totalenettobudgetincondvalore, COST.totalenettoincondvalore, COST.totalenettobudgetcondvalore, 
                      COST.totalenettocondvalore, CONTRATTO.PROGRESSIVO, RIGHE.DESCRIZIONEART, COST.valorerigapremio, COST.incidenzacondriga, 
                      COST.incidenzapremiomaturato
FROM         dbo.CONTRATTI_COSTIFICAZIONERIGHE AS COST INNER JOIN
                      dbo.RIGHEDOCUMENTI AS RIGHE ON RIGHE.IDTESTA = COST.idtestadoc AND RIGHE.IDRIGA = COST.idrigadoc INNER JOIN
                      dbo.TESTE_CONTRATTI AS CONTRATTO ON CONTRATTO.PROGRESSIVO = COST.contratto


GO
GRANT SELECT
    ON OBJECT::[dbo].[AIOT_ANALISICOSTIF] TO [Metodo98]
    AS [dbo];

