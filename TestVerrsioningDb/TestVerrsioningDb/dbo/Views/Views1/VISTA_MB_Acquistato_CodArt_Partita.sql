﻿

CREATE View [dbo].[VISTA_MB_Acquistato_CodArt_Partita] 
AS

SELECT 
    ACQ.CODARTICOLO
    ,[NRRIFPARTITA]
    ,SUM([QTA]) QTATOT
    ,[UM]
    ,ACQ.[CODICE]
    ,ACQ.CODARTICOLO CODART
    ,SUM([VALORENETTO]/[QTA]) COSTOMEDIO
    ,SUM([VALORELORDO]/[QTA]) VALORMEDIOESCONTO
FROM MB_ACQUISTATO_STORICO ACQ
WHERE TIPO =0
GROUP BY ACQ.CODARTICOLO, ACQ.Codice,[UM],[NRRIFPARTITA] 

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_MB_Acquistato_CodArt_Partita] TO [Metodo98]
    AS [dbo];
