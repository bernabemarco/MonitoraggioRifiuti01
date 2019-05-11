﻿CREATE TABLE [dbo].[ACCESSICAUSCONT] (
    [CODCAUSALE]     DECIMAL (5)  NOT NULL,
    [NOMEUTENTE]     VARCHAR (25) NOT NULL,
    [FLAGABILITA]    SMALLINT     DEFAULT (0) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [FLAGVISUALIZZA] SMALLINT     CONSTRAINT [DF_ACCESSICC_FLAGVISUALIZZA] DEFAULT (0) NULL,
    CONSTRAINT [PK_ACCESSICAUSCONT] PRIMARY KEY CLUSTERED ([CODCAUSALE] ASC, [NOMEUTENTE] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_FLAGABILITA_ACCESSIC] CHECK ([FLAGABILITA] = 0 or [FLAGABILITA] = 1),
    CONSTRAINT [FK_ACCESSICAUSCONT_CODCAUSALE] FOREIGN KEY ([CODCAUSALE]) REFERENCES [dbo].[CAUSALICONTABILI] ([CODICECAUSALE]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [UTENTECAUSC]
    ON [dbo].[ACCESSICAUSCONT]([NOMEUTENTE] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ACCESSICAUSALI_FK]
    ON [dbo].[ACCESSICAUSCONT]([CODCAUSALE] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ACCESSICAUSCONT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ACCESSICAUSCONT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ACCESSICAUSCONT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ACCESSICAUSCONT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ACCESSICAUSCONT] TO [Metodo98]
    AS [dbo];
