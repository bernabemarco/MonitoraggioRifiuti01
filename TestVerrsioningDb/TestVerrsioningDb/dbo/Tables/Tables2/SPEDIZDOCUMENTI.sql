﻿CREATE TABLE [dbo].[SPEDIZDOCUMENTI] (
    [IDTESTA]        DECIMAL (10) NOT NULL,
    [POSSPED]        SMALLINT     NOT NULL,
    [POSIZIONE]      SMALLINT     NULL,
    [CODSPED]        DECIMAL (5)  NULL,
    [RAGSOCSPED]     VARCHAR (80) NULL,
    [INDIRIZZOSPED]  VARCHAR (80) NULL,
    [CAPSPED]        VARCHAR (8)  NULL,
    [LOCALITASPED]   VARCHAR (80) NULL,
    [PROVSPED]       VARCHAR (4)  NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [PARTITAIVA]     VARCHAR (12) NULL,
    [CODNAZIONE]     DECIMAL (5)  DEFAULT ((0)) NULL,
    [NUMALBOTR]      VARCHAR (30) NULL,
    CONSTRAINT [PK_SPEDIZDOCUMENTI] PRIMARY KEY CLUSTERED ([IDTESTA] ASC, [POSSPED] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_SPEDIZDOCUMENTI_IDTESTA] FOREIGN KEY ([IDTESTA]) REFERENCES [dbo].[TESTEDOCUMENTI] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [SPEDDOC]
    ON [dbo].[SPEDIZDOCUMENTI]([CODSPED] ASC, [POSIZIONE] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [spedizdocumenti0]
    ON [dbo].[SPEDIZDOCUMENTI]([POSSPED] ASC, [IDTESTA] ASC, [CODSPED] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SPEDIZDOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SPEDIZDOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SPEDIZDOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SPEDIZDOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SPEDIZDOCUMENTI] TO [Metodo98]
    AS [dbo];
