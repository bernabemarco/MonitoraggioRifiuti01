﻿
CREATE VIEW dbo.AIOTCONTRATTICL_PERC
AS
SELECT     dbo.CONTRATTICL_QTA.*
FROM         dbo.CONTRATTICL_QTA


GO
GRANT DELETE
    ON OBJECT::[dbo].[AIOTCONTRATTICL_PERC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AIOTCONTRATTICL_PERC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[AIOTCONTRATTICL_PERC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AIOTCONTRATTICL_PERC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AIOTCONTRATTICL_PERC] TO [Metodo98]
    AS [dbo];
