﻿

CREATE VIEW VISTACONTRATTIVINCOLIFORESERCIZIO
AS
SELECT     dbo.CONTRATTI_VINCOLIESERCIZIOFOR.CODCONTO, dbo.CONTRATTI_VINCOLIESERCIZIOFOR.ESERCIZIO, dbo.ANAGRAFICACF.DSCCONTO1, 
                      dbo.CONTRATTI_VINCOLIESERCIZIOFOR.DADATA, dbo.CONTRATTI_VINCOLIESERCIZIOFOR.ADATA
FROM         dbo.CONTRATTI_VINCOLIESERCIZIOFOR LEFT OUTER JOIN
                      dbo.ANAGRAFICACF ON dbo.CONTRATTI_VINCOLIESERCIZIOFOR.CODCONTO = dbo.ANAGRAFICACF.CODCONTO


GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTACONTRATTIVINCOLIFORESERCIZIO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTACONTRATTIVINCOLIFORESERCIZIO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTACONTRATTIVINCOLIFORESERCIZIO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACONTRATTIVINCOLIFORESERCIZIO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTACONTRATTIVINCOLIFORESERCIZIO] TO [Metodo98]
    AS [dbo];
