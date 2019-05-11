﻿
CREATE VIEW VISTAARTICOLIDSCBASE
AS
SELECT AA1.CODICE, (CASE WHEN CHARINDEX('#', 
    AA1.CODICE) 
    > 0 THEN AA1.CODICEPRIMARIO ELSE AA1.CODICE END)
     AS CODARTICOLOBASE, 
    AA2.DESCRIZIONE AS DSCARTICOLOBASE
FROM ANAGRAFICAARTICOLI AA1, ANAGRAFICAARTICOLI AA2
WHERE AA2.CODICE = (CASE WHEN CHARINDEX('#', 
    AA1.CODICE) 
    > 0 THEN AA1.CODICEPRIMARIO ELSE AA1.CODICE END)

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAARTICOLIDSCBASE] TO [Metodo98]
    AS [dbo];
