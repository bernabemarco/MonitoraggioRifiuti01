﻿CREATE VIEW dbo.BRIOVISTAANAGRAFICAGENERICI
AS
SELECT     *
FROM         dbo.ANAGRAFICAGENERICI

GO
GRANT SELECT
    ON OBJECT::[dbo].[BRIOVISTAANAGRAFICAGENERICI] TO [Metodo98]
    AS [dbo];
