﻿
CREATE VIEW AIOT_ANALISICOSTIFMEDIA
AS

SELECT     CODART, AVG(PREZZOUNITNETTOEURO) AS PREZZOUNITNETTOEUROMEDIO, UMGEST, AVG(QTAGEST) AS QTAGESTMEDIA, AVG(TOTNETTORIGA) 
                      AS TOTNETTORIGAMEDIA, AVG(perctrasporto) AS PERCTRASPORTOMEDIA, AVG(incidenzabudgetincond) AS INCIDENZABUDGETINCONDMEDIA, 
                      AVG(incidenzabudgetcond) AS INCIDENZABUDGETCONDMEDIA, AVG(incidenzaincond) AS INCIDENZAINCONDMEDIA, AVG(incidenzacond) AS INCIDENZACONDMEDIA, 
                      AVG(totalenettobudgetincond) AS TOTALENETTOBUDGETINCONDMEDIA, AVG(totalenettobudgetcond) AS TOTALENETTOBUDGETCONDMEDIA, AVG(totalenettocond) 
                      AS TOTALENETTOCONDMEDIA, AVG(totalenettoprovvigioni) AS TOTALENETTOPROVVIGIONIMEDIA, AVG(totalenettoscontimerce) 
                      AS TOTALENETTOSCONTIMERCEMEDIA, AVG(valorerigapremio) AS VALORERIGAPREMIO, AVG(incidenzacondriga) AS INCIDENZACONDRIGA, 
                      AVG(incidenzapremiomaturato) AS INCIDENZAPREMIOMATURATO, AVG(totalenettobudgetincondvalore) AS TOTALENETTOBUDGETINCONDVALOREMEDIA, 
                      AVG(totalenettoincondvalore) AS TOTALENETTOINCONDVALOREMEDIA, AVG(totalenettobudgetcondvalore) AS TOTALENETTOBUDGETCONDVALOREMEDIA, 
                      AVG(totalenettocondvalore) AS TOTALENETTOCONDVALOREMEDIA, PROGRESSIVO, DESCRIZIONEART
FROM         dbo.AIOT_ANALISICOSTIF
GROUP BY CODART, UMGEST, PROGRESSIVO, DESCRIZIONEART

GO
GRANT SELECT
    ON OBJECT::[dbo].[AIOT_ANALISICOSTIFMEDIA] TO [Metodo98]
    AS [dbo];

