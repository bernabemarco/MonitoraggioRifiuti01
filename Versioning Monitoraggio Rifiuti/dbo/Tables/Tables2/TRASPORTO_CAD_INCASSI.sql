﻿CREATE TABLE [dbo].[TRASPORTO_CAD_INCASSI] (
    [RIFPROGRESSIVO] DECIMAL (5)     NOT NULL,
    [CODPAGAMENTO]   VARCHAR (4)     NOT NULL,
    [VALORE]         DECIMAL (18, 6) DEFAULT ((0)) NULL,
    [CODICE]         VARCHAR (5)     DEFAULT ('IA016') NOT NULL,
    [CODTIPOCOSTO]   SMALLINT        NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [VALOREMINIMO]   DECIMAL (19, 6) CONSTRAINT [DF_TRASPORTO_CAD_INCASSI_VALOREMINIMO] DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [CODPAGAMENTO] ASC),
    CONSTRAINT [FK_TRASPORTO_CAD_INCASSI_TRASPORTO_CAD] FOREIGN KEY ([RIFPROGRESSIVO]) REFERENCES [dbo].[TRASPORTO_CAD] ([PROGRESSIVO]) ON DELETE CASCADE,
    CONSTRAINT [FK_TRASPORTO_CAD_INCASSI_TRASPORTO_CAD_TIPOCOSTO] FOREIGN KEY ([CODTIPOCOSTO]) REFERENCES [dbo].[TRASPORTO_CAD_TIPOCOSTO] ([PROGRESSIVO]) ON DELETE SET NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TRASPORTO_CAD_INCASSI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TRASPORTO_CAD_INCASSI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TRASPORTO_CAD_INCASSI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TRASPORTO_CAD_INCASSI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TRASPORTO_CAD_INCASSI] TO [Metodo98]
    AS [dbo];
