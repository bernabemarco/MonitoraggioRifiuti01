﻿CREATE VIEW dbo.BRIOANAGRAFICAARTICOLI
AS
SELECT     *
FROM         dbo.ANAGRAFICAARTICOLI 

GO
GRANT SELECT
    ON OBJECT::[dbo].[BRIOANAGRAFICAARTICOLI] TO [Metodo98]
    AS [dbo];

