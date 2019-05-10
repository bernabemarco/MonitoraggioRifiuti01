﻿CREATE TABLE [dbo].[TDA_PARAMETRICONSPRODUZIONE] (
    [RIFPLUGIN]       DECIMAL (5)  NOT NULL,
    [TIPOCONSUNTIVO]  SMALLINT     NULL,
    [TIPOLISTACONS]   VARCHAR (3)  NULL,
    [CAUSALECONS]     DECIMAL (5)  NULL,
    [TIPOLISTAMOV]    VARCHAR (3)  NULL,
    [FLAGACCODA]      SMALLINT     NULL,
    [MAXRIGHE]        INT          NULL,
    [UTENTEMODIFICA]  VARCHAR (25) NOT NULL,
    [DATAMODIFICA]    DATETIME     NOT NULL,
    [TIPOSESSIONEMOV] SMALLINT     NULL,
    PRIMARY KEY CLUSTERED ([RIFPLUGIN] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_PARAMETRICONSPROD_PLUGINPROD] FOREIGN KEY ([RIFPLUGIN]) REFERENCES [dbo].[TDA_PLUGINCONSOLIDAMENTO] ([CODICE]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TDA_PARAMETRICONSPRODUZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TDA_PARAMETRICONSPRODUZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TDA_PARAMETRICONSPRODUZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TDA_PARAMETRICONSPRODUZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TDA_PARAMETRICONSPRODUZIONE] TO [Metodo98]
    AS [dbo];

