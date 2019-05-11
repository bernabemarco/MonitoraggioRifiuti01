﻿CREATE TABLE [dbo].[TABLIMITIELENCOCF] (
    [ANNO]           SMALLINT        NOT NULL,
    [LIMITEFATTURE]  DECIMAL (19, 4) NULL,
    [LIMITECORR]     DECIMAL (19, 4) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [PK_TABLIMITIELENCOCF] PRIMARY KEY CLUSTERED ([ANNO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABLIMITIELENCOCF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABLIMITIELENCOCF] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABLIMITIELENCOCF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABLIMITIELENCOCF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABLIMITIELENCOCF] TO [Metodo98]
    AS [dbo];
