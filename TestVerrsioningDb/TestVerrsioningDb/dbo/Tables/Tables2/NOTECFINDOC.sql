﻿CREATE TABLE [dbo].[NOTECFINDOC] (
    [CODCONTO]       VARCHAR (7)   NOT NULL,
    [ESERCIZIO]      DECIMAL (5)   NOT NULL,
    [TIPODOC]        VARCHAR (3)   NOT NULL,
    [NOTE]           VARCHAR (255) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    CONSTRAINT [PK_NOTECFINDOC] PRIMARY KEY CLUSTERED ([CODCONTO] ASC, [ESERCIZIO] ASC, [TIPODOC] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_NOTECFINDOC_ESERCIZIO_CODCONTO] FOREIGN KEY ([ESERCIZIO], [CODCONTO]) REFERENCES [dbo].[ANAGRAFICARISERVATICF] ([ESERCIZIO], [CODCONTO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [NOTECFTIPODOC]
    ON [dbo].[NOTECFINDOC]([TIPODOC] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [NOTECFESERCIZIO]
    ON [dbo].[NOTECFINDOC]([ESERCIZIO] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[NOTECFINDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[NOTECFINDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[NOTECFINDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[NOTECFINDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[NOTECFINDOC] TO [Metodo98]
    AS [dbo];

