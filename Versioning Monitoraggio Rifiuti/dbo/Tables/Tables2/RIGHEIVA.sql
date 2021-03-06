﻿CREATE TABLE [dbo].[RIGHEIVA] (
    [TIPOREGISTRO]     DECIMAL (5)     NOT NULL,
    [ESERCIZIO]        DECIMAL (5)     NOT NULL,
    [NRREG]            DECIMAL (10)    NOT NULL,
    [NRRIGA]           SMALLINT        NOT NULL,
    [POSIZIONE]        SMALLINT        NOT NULL,
    [DATADOC]          DATETIME        NULL,
    [NUMDOC]           VARCHAR (12)    NULL,
    [CODIVA]           DECIMAL (5)     NULL,
    [ALIQUOTA]         DECIMAL (8, 5)  DEFAULT (0) NOT NULL,
    [IMPONIBILE]       DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPOSTA]          DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPONIBILEEURO]   DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPOSTAEURO]      DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [CODCAMBIO]        DECIMAL (5)     NULL,
    [VALORECAMBIO]     DECIMAL (13, 6) DEFAULT (1) NOT NULL,
    [CONTO]            VARCHAR (7)     NULL,
    [DATASTAMPA]       DATETIME        NULL,
    [NOTAACCR]         SMALLINT        DEFAULT (0) NULL,
    [MESELIQUIDAZ]     SMALLINT        NULL,
    [ANNOLIQUIDAZ]     DECIMAL (5)     NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL,
    [IMPONIBILEVALUTA] DECIMAL (19, 4) NULL,
    [IMPOSTAVALUTA]    DECIMAL (19, 4) NULL,
    [NUMPROTORIGSOSP]  VARCHAR (12)    NULL,
    [ANNODOCORIGSOSP]  DECIMAL (5)     CONSTRAINT [DF_RIGHEIVA_ANNODOCORIGSOSP] DEFAULT ((0)) NULL,
    [RIFSCADRIGSOSP]   DECIMAL (10)    NULL,
    CONSTRAINT [PK_RIGHEIVA] PRIMARY KEY CLUSTERED ([TIPOREGISTRO] ASC, [NRREG] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_NOTAACCR_RIGHEIVA] CHECK ([NOTAACCR] = 0 or [NOTAACCR] = 1),
    CONSTRAINT [FK_RIGHEIVA_NRREG] FOREIGN KEY ([NRREG]) REFERENCES [dbo].[TESTECONTABILITA] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [RGIVA_CODIVA]
    ON [dbo].[RIGHEIVA]([CODIVA] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [RGIVA_CONTO]
    ON [dbo].[RIGHEIVA]([CONTO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [RGIVA_DATADOC]
    ON [dbo].[RIGHEIVA]([DATADOC] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [RGIVA_NUMDOC]
    ON [dbo].[RIGHEIVA]([NUMDOC] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [RGIVA_POS]
    ON [dbo].[RIGHEIVA]([POSIZIONE] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[RIGHEIVA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[RIGHEIVA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[RIGHEIVA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[RIGHEIVA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[RIGHEIVA] TO [Metodo98]
    AS [dbo];

