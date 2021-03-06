﻿CREATE TABLE [dbo].[CASTELLETTIIVA] (
    [IDTESTA]                DECIMAL (10)    NOT NULL,
    [CODIVA]                 DECIMAL (5)     NOT NULL,
    [TOTIMPONIBILE]          DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [TOTIMPONIBILERES]       DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [TOTIMPOSTA]             DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [TOTIMPOSTARES]          DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [TOTIMPONIBILEEURO]      DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [TOTIMPONIBILEEURORES]   DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [TOTIMPOSTAEURO]         DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [TOTIMPOSTAEURORES]      DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [TOTIMPONIBILEVALUTA]    DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [TOTIMPONIBILEVALUTARES] DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [TOTIMPOSTAVALUTA]       DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [TOTIMPOSTAVALUTARES]    DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [UTENTEMODIFICA]         VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]           DATETIME        NOT NULL,
    CONSTRAINT [PK_CASTELLETTIIVA] PRIMARY KEY CLUSTERED ([IDTESTA] ASC, [CODIVA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_CASTELLETTIIVA_IDTESTA] FOREIGN KEY ([IDTESTA]) REFERENCES [dbo].[TESTEDOCUMENTI] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [CODIVA]
    ON [dbo].[CASTELLETTIIVA]([CODIVA] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CASTELLETTIIVA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CASTELLETTIIVA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CASTELLETTIIVA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CASTELLETTIIVA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CASTELLETTIIVA] TO [Metodo98]
    AS [dbo];

