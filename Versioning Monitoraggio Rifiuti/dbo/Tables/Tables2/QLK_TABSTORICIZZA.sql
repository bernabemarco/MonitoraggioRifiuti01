﻿CREATE TABLE [dbo].[QLK_TABSTORICIZZA] (
    [TIPO]           VARCHAR (50) DEFAULT ('') NOT NULL,
    [STORICIZZA]     SMALLINT     DEFAULT ((0)) NOT NULL,
    [DATAINIZIO]     DATETIME     NOT NULL,
    [DATAFINE]       DATETIME     NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([TIPO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[QLK_TABSTORICIZZA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[QLK_TABSTORICIZZA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[QLK_TABSTORICIZZA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[QLK_TABSTORICIZZA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[QLK_TABSTORICIZZA] TO [Metodo98]
    AS [dbo];

