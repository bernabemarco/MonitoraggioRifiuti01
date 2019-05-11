﻿CREATE TABLE [dbo].[TP_PARAMETRI_EXPORTDOC] (
    [RIFPROGRESSIVO]     DECIMAL (18)  NOT NULL,
    [IDRIGA]             INT           NOT NULL,
    [NASCOSTO]           SMALLINT      DEFAULT ((0)) NOT NULL,
    [NASCONDIRIGA]       SMALLINT      DEFAULT ((0)) NOT NULL,
    [NASCONDIRIGAVALORE] VARCHAR (250) DEFAULT ('') NOT NULL,
    [UTENTEMODIFICA]     VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]       DATETIME      NOT NULL,
    [LINKINDEX]          SMALLINT      CONSTRAINT [DF_TP_PARAMETRI_EXPORTDOC_LINKINDEX] DEFAULT ((0)) NULL,
    [LINKNAME]           VARCHAR (250) CONSTRAINT [DF_TP_PARAMETRI_EXPORTDOC_LINKNAME] DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [IDRIGA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_PARAMETRI_EXPORTDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_PARAMETRI_EXPORTDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_PARAMETRI_EXPORTDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_PARAMETRI_EXPORTDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_PARAMETRI_EXPORTDOC] TO [Metodo98]
    AS [dbo];
