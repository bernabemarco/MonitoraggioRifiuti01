﻿CREATE TABLE [dbo].[CONSUMICLAVORAZIONE] (
    [PROGRESSIVO]     DECIMAL (10)    NOT NULL,
    [IDTESTA_RESOCL]  DECIMAL (10)    NULL,
    [IDRIGA_RESOCL]   INT             NULL,
    [IDTESTA_CONSCL]  DECIMAL (10)    NULL,
    [IDRIGA_CONSCL]   INT             NULL,
    [QTA1UMCONSUMATA] DECIMAL (16, 6) CONSTRAINT [DF_CONSUMICLAVORAZIONE_QTA1UMCONSUMATA] DEFAULT ((0)) NULL,
    [FLGERRORE]       SMALLINT        CONSTRAINT [DF_CONSUMICLAVORAZIONE_FLGERRORE] DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]  VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]    DATETIME        NOT NULL,
    [CODART]          VARCHAR (50)    NULL,
    CONSTRAINT [PK_CONSUMICLAVORAZIONE] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC),
    CONSTRAINT [CHK_CONSUMICLAVORAZIONE_FLGERRORE] CHECK ([FLGERRORE]=(1) OR [FLGERRORE]=(0))
);


GO
CREATE NONCLUSTERED INDEX [CONSUMICLAVORAZIONE_IDRESO]
    ON [dbo].[CONSUMICLAVORAZIONE]([IDTESTA_RESOCL] ASC, [IDRIGA_RESOCL] ASC);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONSUMICLAVORAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONSUMICLAVORAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONSUMICLAVORAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONSUMICLAVORAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONSUMICLAVORAZIONE] TO [Metodo98]
    AS [dbo];
