﻿CREATE TABLE [dbo].[ANAGRAFICAAGENTIENASARCO] (
    [CODAGENTE]      VARCHAR (7)    NOT NULL,
    [NRRIGA]         SMALLINT       NOT NULL,
    [DSCNOME]        VARCHAR (80)   NOT NULL,
    [NRMATRICOLA]    VARCHAR (12)   NULL,
    [CODFISCALE]     VARCHAR (16)   NULL,
    [PERCENTUALE]    DECIMAL (6, 2) NULL,
    [UTENTEMODIFICA] VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]   DATETIME       NOT NULL,
    CONSTRAINT [PK_ANAGRAFICAAGENTIENASARCO] PRIMARY KEY CLUSTERED ([CODAGENTE] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_ANAGRAFICAAGENTIENASARCO_CODAGENTE] FOREIGN KEY ([CODAGENTE]) REFERENCES [dbo].[ANAGRAFICAAGENTI] ([CODAGENTE]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ANAGRAFICAAGENTIENASARCO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ANAGRAFICAAGENTIENASARCO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ANAGRAFICAAGENTIENASARCO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ANAGRAFICAAGENTIENASARCO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ANAGRAFICAAGENTIENASARCO] TO [Metodo98]
    AS [dbo];

