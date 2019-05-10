﻿CREATE TABLE [dbo].[TABLEGAMISSCC] (
    [SSCC]    VARCHAR (20)    NOT NULL,
    [IDTESTA] DECIMAL (10)    NOT NULL,
    [IDRIGA]  INT             NOT NULL,
    [QTAGEST] DECIMAL (16, 6) NOT NULL,
    [QTA1UM]  DECIMAL (16, 6) NOT NULL,
    CONSTRAINT [PK_TABLEGAMISSCC] PRIMARY KEY CLUSTERED ([SSCC] ASC, [IDTESTA] ASC, [IDRIGA] ASC),
    CONSTRAINT [FK_TABLEGAMISSCC_IDTESTA_IDRIGA] FOREIGN KEY ([IDTESTA], [IDRIGA]) REFERENCES [dbo].[RIGHEDOCUMENTI] ([IDTESTA], [IDRIGA]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABLEGAMISSCC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABLEGAMISSCC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABLEGAMISSCC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABLEGAMISSCC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABLEGAMISSCC] TO [Metodo98]
    AS [dbo];

