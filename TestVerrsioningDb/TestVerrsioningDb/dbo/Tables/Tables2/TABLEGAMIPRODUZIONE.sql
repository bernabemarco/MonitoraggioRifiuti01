﻿CREATE TABLE [dbo].[TABLEGAMIPRODUZIONE] (
    [TIPOLEGAME]     SMALLINT     DEFAULT (0) NULL,
    [IDTESTA]        DECIMAL (10) NULL,
    [IDRIGA]         INT          NULL,
    [IDIMPEGNO]      INT          NULL,
    [RIFTESTA]       DECIMAL (10) NULL,
    [RIFRIGA]        INT          NULL,
    [RIFIMPEGNO]     INT          NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [LEGAME]
    ON [dbo].[TABLEGAMIPRODUZIONE]([TIPOLEGAME] ASC, [IDTESTA] ASC, [IDRIGA] ASC, [IDIMPEGNO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [LEGAMERIF]
    ON [dbo].[TABLEGAMIPRODUZIONE]([TIPOLEGAME] ASC, [RIFTESTA] ASC, [RIFRIGA] ASC, [RIFIMPEGNO] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABLEGAMIPRODUZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABLEGAMIPRODUZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABLEGAMIPRODUZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABLEGAMIPRODUZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABLEGAMIPRODUZIONE] TO [Metodo98]
    AS [dbo];
