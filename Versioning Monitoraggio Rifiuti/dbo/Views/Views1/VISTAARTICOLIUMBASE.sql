﻿
CREATE VIEW VISTAARTICOLIUMBASE
AS
SELECT CODICE,
        (SELECT UM
      FROM ARTICOLIUMPREFERITE
      WHERE CODART = CODICE AND TIPOUM = 1) AS UM1,
        (SELECT UM
      FROM ARTICOLIUMPREFERITE
      WHERE CODART = CODICE AND TIPOUM = 2) 
    AS UM2
FROM ANAGRAFICAARTICOLI

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAARTICOLIUMBASE] TO [Metodo98]
    AS [dbo];

