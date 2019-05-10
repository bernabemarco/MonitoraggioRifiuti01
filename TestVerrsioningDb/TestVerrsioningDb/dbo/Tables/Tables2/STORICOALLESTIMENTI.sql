﻿CREATE TABLE [dbo].[STORICOALLESTIMENTI] (
    [IDSTORICO]      VARCHAR (10)    NOT NULL,
    [CODART]         VARCHAR (50)    NOT NULL,
    [CODCLIFOR]      VARCHAR (7)     NOT NULL,
    [CODPARTITA]     VARCHAR (15)    NOT NULL,
    [UBICAZIONE]     VARCHAR (10)    NOT NULL,
    [UM]             VARCHAR (3)     NOT NULL,
    [QUANTITA]       DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [PK_STORICOALLESTIMENTI] PRIMARY KEY CLUSTERED ([IDSTORICO] ASC, [CODART] ASC, [CODCLIFOR] ASC, [CODPARTITA] ASC, [UBICAZIONE] ASC, [UM] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [STALL_CODART]
    ON [dbo].[STORICOALLESTIMENTI]([CODART] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [STALL_CLIFOR]
    ON [dbo].[STORICOALLESTIMENTI]([CODCLIFOR] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [STALL_PART]
    ON [dbo].[STORICOALLESTIMENTI]([CODPARTITA] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [STALL_UBICAZIONE]
    ON [dbo].[STORICOALLESTIMENTI]([UBICAZIONE] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[STORICOALLESTIMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[STORICOALLESTIMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[STORICOALLESTIMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[STORICOALLESTIMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[STORICOALLESTIMENTI] TO [Metodo98]
    AS [dbo];

