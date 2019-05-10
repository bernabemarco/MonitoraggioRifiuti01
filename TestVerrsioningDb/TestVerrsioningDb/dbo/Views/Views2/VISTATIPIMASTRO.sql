﻿
CREATE VIEW VISTATIPIMASTRO AS
SELECT 'P' AS TIPO,'Patrimoniale' AS DSCTIPO UNION SELECT 'E' AS TIPO,'Economico' AS DSCTIPO UNION SELECT 'O' AS TIPO,'Ordine' AS DSCTIPO

GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTATIPIMASTRO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTATIPIMASTRO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTATIPIMASTRO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATIPIMASTRO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTATIPIMASTRO] TO [Metodo98]
    AS [dbo];

