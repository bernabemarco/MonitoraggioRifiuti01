﻿CREATE TABLE [dbo].[TRASPORTO_CAD_TREEVIEW] (
    [PROGRESSIVO]    DECIMAL (5)   NOT NULL,
    [RIFPROGRESSIVO] DECIMAL (5)   DEFAULT ((0)) NULL,
    [RIFPROGPADRE]   DECIMAL (5)   NOT NULL,
    [RIFNODOPADRE]   VARCHAR (250) NOT NULL,
    [RIFNODO]        VARCHAR (250) NOT NULL,
    [TIPONODO]       SMALLINT      DEFAULT ((0)) NOT NULL,
    [LIVELLONODO]    SMALLINT      DEFAULT ((0)) NOT NULL,
    [RIFTIPOLOGIE]   DECIMAL (5)   DEFAULT ((0)) NULL,
    [UTENTEMODIFICA] VARCHAR (30)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC),
    CONSTRAINT [FK_TRASPORTO_CAD_TREEVIEW_TRASPORTO_CAD_TIPOLOGIE] FOREIGN KEY ([RIFTIPOLOGIE]) REFERENCES [dbo].[TRASPORTO_CAD_TIPOLOGIE] ([PROGRESSIVO]) ON DELETE SET DEFAULT
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TRASPORTO_CAD_TREEVIEW] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TRASPORTO_CAD_TREEVIEW] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TRASPORTO_CAD_TREEVIEW] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TRASPORTO_CAD_TREEVIEW] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TRASPORTO_CAD_TREEVIEW] TO [Metodo98]
    AS [dbo];

