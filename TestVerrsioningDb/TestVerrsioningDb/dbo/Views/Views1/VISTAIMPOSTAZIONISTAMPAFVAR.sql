﻿CREATE VIEW VISTAIMPOSTAZIONISTAMPAFVAR AS
        SELECT DISTINCT NOMEIMPOSTAZIONE, 
        (CASE WHEN NOMEUTENTE='TRM' THEN 'SI' ELSE 'NO' END)  IMPCOMUNE,
        NOMEFILTRO,
        NOMEUTENTE
        FROM IMPOSTAZIONISTAMPA WHERE TIPOIMPOSTAZIONE=3

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAIMPOSTAZIONISTAMPAFVAR] TO [Metodo98]
    AS [dbo];

