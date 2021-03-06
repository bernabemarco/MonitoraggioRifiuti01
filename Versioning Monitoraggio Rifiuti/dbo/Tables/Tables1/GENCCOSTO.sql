﻿CREATE TABLE [dbo].[GENCCOSTO] (
    [ESERCIZIO]       DECIMAL (5)     NOT NULL,
    [CODGENERICO]     VARCHAR (7)     NOT NULL,
    [NRRIGA]          DECIMAL (5)     NOT NULL,
    [CODCCOSTO]       VARCHAR (10)    NOT NULL,
    [PRCRIPARTIZIONE] NUMERIC (19, 4) DEFAULT (0) NULL,
    [TIPOPERC]        SMALLINT        DEFAULT (0) NULL,
    [UTENTEMODIFICA]  VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]    DATETIME        NOT NULL,
    CONSTRAINT [PK_GENCCOSTO] PRIMARY KEY CLUSTERED ([ESERCIZIO] ASC, [CODGENERICO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_TIPOPERC_GENCCOST] CHECK ([TIPOPERC] = 0 or [TIPOPERC] = 1),
    CONSTRAINT [FK_GENCCOSTO_CODGENERICO] FOREIGN KEY ([CODGENERICO]) REFERENCES [dbo].[ANAGRAFICAGENERICI] ([CODCONTO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [CCOSTO]
    ON [dbo].[GENCCOSTO]([CODCCOSTO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [GENCCOSTO_ESERCIZIO]
    ON [dbo].[GENCCOSTO]([ESERCIZIO] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GENCCOSTO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GENCCOSTO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GENCCOSTO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GENCCOSTO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GENCCOSTO] TO [Metodo98]
    AS [dbo];

