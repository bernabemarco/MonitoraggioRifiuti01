﻿CREATE VIEW dbo.BRIOVISTATABNAZIONI
AS
SELECT     *
FROM         dbo.TABNAZIONI

GO
GRANT SELECT
    ON OBJECT::[dbo].[BRIOVISTATABNAZIONI] TO [Metodo98]
    AS [dbo];

