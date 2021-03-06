﻿CREATE VIEW [dbo].[VISTA_FETS_ListaFornitori_Import]
AS
Select Distinct VISTACLIFOR.* FROM VISTACLIFOR,
(Select COUNT(CODFISCALE) CF, CODFISCALE, COUNT(PARTITAIVA) [PI], PARTITAIVA from VISTACLIFOR Where  TIPOCONTO = 'F' AND STATOFATTURE <> 2 GROUP BY CODFISCALE, PARTITAIVA ) _CLI
Where  TIPOCONTO = 'F' 
AND STATOFATTURE <> 2
AND ((_CLI.PARTITAIVA = VISTACLIFOR.PARTITAIVA AND _CLI.[PI] = 1) OR (_CLI.CODFISCALE = VISTACLIFOR.CODFISCALE AND _CLI.[CF] = 1))

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_FETS_ListaFornitori_Import] TO [Metodo98]
    AS [dbo];

