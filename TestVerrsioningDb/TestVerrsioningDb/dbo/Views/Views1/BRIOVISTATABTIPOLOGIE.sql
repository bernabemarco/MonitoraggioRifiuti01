﻿CREATE VIEW dbo.BRIOVISTATABTIPOLOGIE
AS
SELECT     *
FROM         dbo.TABTIPOLOGIE

GO
GRANT SELECT
    ON OBJECT::[dbo].[BRIOVISTATABTIPOLOGIE] TO [Metodo98]
    AS [dbo];
