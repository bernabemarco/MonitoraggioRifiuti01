﻿CREATE TABLE [dbo].[TEMPANALISIORDPROD] (
    [NRTERMINALE]    SMALLINT     DEFAULT (0) NOT NULL,
    [IDCOMMESSA]     DECIMAL (10) NOT NULL,
    [IDORDINE]       INT          NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    CONSTRAINT [PK_TEMPANALISIORDPROD] PRIMARY KEY CLUSTERED ([NRTERMINALE] ASC, [IDCOMMESSA] ASC, [IDORDINE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPANALISIORDPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPANALISIORDPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPANALISIORDPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPANALISIORDPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPANALISIORDPROD] TO [Metodo98]
    AS [dbo];

