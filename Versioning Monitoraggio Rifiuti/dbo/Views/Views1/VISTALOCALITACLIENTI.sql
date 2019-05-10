﻿

CREATE VIEW VISTALOCALITACLIENTI
AS
SELECT DISTINCT LOCALITA
FROM         dbo.ANAGRAFICACF
WHERE     (TIPOCONTO = 'C')

GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTALOCALITACLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTALOCALITACLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTALOCALITACLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTALOCALITACLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTALOCALITACLIENTI] TO [Metodo98]
    AS [dbo];

