﻿

CREATE PROCEDURE [dbo].[PROC_TRASPORTO_ACQ_COSTO_ARTICOLO](@RIFPROGRESSIVO DECIMAL(18,0)) 
AS

     DELETE T
     FROM
         TP_TRASPORTOCOSTOACQARTICOLI T
     INNER JOIN
         TP_TRASPORTOTOTALEARTICOLOLOTTO L
     ON
         T.CODART = L.CODART AND
         T.NRRIFPARTITA = L.NRRIFPARTITA AND
         T.CODDEPOSITO = L.CODDEPOSITO
     WHERE
         L.RIFPROGRESSIVO =  @RIFPROGRESSIVO

     INSERT INTO TP_TRASPORTOCOSTOACQARTICOLI(CODART,NRRIFPARTITA,CODDEPOSITO,COSTOMEDIOPEDANA,COSTOMEDIOPEZZOXPEDANA,COSTOMEDIOPEZZOXKG,UTENTEMODIFICA,DATAMODIFICA,RAGGRUPPA)
     SELECT
         T.CODART,
         T.NRRIFPARTITA,
         T.CODDEPOSITO,
         SUM(T.TOTALEPEDANA * T.COSTOPEDANA) / SUM(T.TOTALEPEDANA) AS COSTOMEDIOPEDANA,
         SUM(T.TOTALEPEZZI * T.COSTOPEZZOXPEDANA) / SUM(T.TOTALEPEZZI) AS COSTOMEDIOPEZZOXPEDANA,
         SUM(T.TOTALEPEZZI * T.COSTOPEZZOXKG) / SUM(T.TOTALEPEZZI) AS COSTOMEDIOPEZZOXKG,
         USER_NAME() AS UTENTEMODIFICA,
         GETDATE() AS DATAMODIFICA,
         0 AS RAGGRUPPA
     FROM
         TP_TRASPORTOTOTALEARTICOLOLOTTO T
     INNER JOIN
         TP_TRASPORTOTOTALEARTICOLOLOTTO L
     ON
         T.CODART = L.CODART AND
         T.NRRIFPARTITA = L.NRRIFPARTITA AND
         T.CODDEPOSITO = L.CODDEPOSITO
     WHERE
         L.RIFPROGRESSIVO = @RIFPROGRESSIVO
     GROUP BY
       T.CODART,
       T.NRRIFPARTITA,
       T.CODDEPOSITO


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_TRASPORTO_ACQ_COSTO_ARTICOLO] TO [Metodo98]
    AS [dbo];

