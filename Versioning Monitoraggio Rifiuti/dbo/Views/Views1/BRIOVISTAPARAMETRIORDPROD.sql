﻿CREATE VIEW dbo.BRIOVISTAPARAMETRIORDPROD
AS
SELECT     *
FROM         dbo.PARAMETRIORDPROD

GO
GRANT SELECT
    ON OBJECT::[dbo].[BRIOVISTAPARAMETRIORDPROD] TO [Metodo98]
    AS [dbo];
