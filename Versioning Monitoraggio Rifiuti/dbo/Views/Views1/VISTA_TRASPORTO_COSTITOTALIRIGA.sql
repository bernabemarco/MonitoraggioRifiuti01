﻿
CREATE VIEW [dbo].[VISTA_TRASPORTO_COSTITOTALIRIGA]
AS
	SELECT     
		IDFILTRO, 
		CODSPEDIZIONIERE, 
		DATADOC, 
		IDTESTADOC, 
		IDRIGADOC, 
		SUM(TOTRIGHEDOC) AS TOTRIGHEDOC, 
		SUM(TOTVALORE) AS TOTVALORE, 
		SUM(TOTALERIGADOC) AS TOTALERIGADOC, 
		SUM(TOTVALORE_RIGADOC) AS TOTVALORE_RIGADOC, 
		MIN(QTATOT) AS QTATOT, 
		MIN(QTACONV) AS QTACONV
	FROM         
		dbo.TRASPORTO_CALCOLOBATCH_RIGHE
	GROUP BY 
		IDFILTRO, 
		CODSPEDIZIONIERE, 
		DATADOC, 
		IDTESTADOC, 
		IDRIGADOC

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_TRASPORTO_COSTITOTALIRIGA] TO [Metodo98]
    AS [dbo];

