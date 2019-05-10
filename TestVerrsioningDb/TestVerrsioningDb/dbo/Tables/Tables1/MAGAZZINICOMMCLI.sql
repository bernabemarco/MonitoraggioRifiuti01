﻿CREATE TABLE [dbo].[MAGAZZINICOMMCLI] (
    [IDCOMMCLI]      DECIMAL (10) NOT NULL,
    [RIFCOMMCLI]     VARCHAR (30) NULL,
    [CODDEPOSITO]    VARCHAR (10) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [POSIZIONE]      SMALLINT     NULL,
    CONSTRAINT [PK_MAGAZZINICOMMCLI] PRIMARY KEY CLUSTERED ([IDCOMMCLI] ASC, [CODDEPOSITO] ASC),
    CONSTRAINT [FK_MAGAZZINICOMMCLI_IDCOMMCLI] FOREIGN KEY ([IDCOMMCLI]) REFERENCES [dbo].[AnagraficaCommesse] ([Progressivo]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MAGAZZINICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MAGAZZINICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[MAGAZZINICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MAGAZZINICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MAGAZZINICOMMCLI] TO [Metodo98]
    AS [dbo];

