﻿CREATE VIEW dbo.BRIOVISTATABREPARTI
AS
SELECT     *
FROM         dbo.TABELLAREPARTI

GO
GRANT SELECT
    ON OBJECT::[dbo].[BRIOVISTATABREPARTI] TO [Metodo98]
    AS [dbo];

