﻿CREATE VIEW dbo.BRIOVISTAANAGRAFICAAGENTI
AS
SELECT     *
FROM         dbo.ANAGRAFICAAGENTI

GO
GRANT SELECT
    ON OBJECT::[dbo].[BRIOVISTAANAGRAFICAAGENTI] TO [Metodo98]
    AS [dbo];

