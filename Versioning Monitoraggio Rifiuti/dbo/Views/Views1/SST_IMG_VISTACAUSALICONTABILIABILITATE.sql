﻿

CREATE VIEW dbo.SST_IMG_VISTACAUSALICONTABILIABILITATE
AS
    SELECT  CC.CODICECAUSALE ,
            CC.DESCRIZIONE ,
            CC.NOTE
    FROM    dbo.CAUSALICONTABILI AS CC
    WHERE   CC.UTILIZZOINGOLD = 1

GO
GRANT DELETE
    ON OBJECT::[dbo].[SST_IMG_VISTACAUSALICONTABILIABILITATE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SST_IMG_VISTACAUSALICONTABILIABILITATE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SST_IMG_VISTACAUSALICONTABILIABILITATE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SST_IMG_VISTACAUSALICONTABILIABILITATE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SST_IMG_VISTACAUSALICONTABILIABILITATE] TO [Metodo98]
    AS [dbo];

