﻿CREATE TABLE [dbo].[TESTEFOGLICOMMCLI] (
    [PROGRESSIVO]          DECIMAL (10)  NOT NULL,
    [ESERCIZIO]            DECIMAL (5)   NULL,
    [TIPO]                 VARCHAR (3)   NULL,
    [NUMERO]               DECIMAL (10)  NULL,
    [REVISIONE]            DECIMAL (5)   NULL,
    [RIFERIMENTO]          VARCHAR (30)  NULL,
    [STATO]                SMALLINT      NULL,
    [OGGETTO]              VARCHAR (80)  NULL,
    [CODCLIENTE]           VARCHAR (7)   NULL,
    [CLIENTEFATT]          VARCHAR (7)   NULL,
    [RIFCOMMESSA]          VARCHAR (30)  NULL,
    [RIFSTRUTTURA]         DECIMAL (10)  NULL,
    [UTENTEMODIFICA]       VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]         DATETIME      NOT NULL,
    [DATAFINE]             DATETIME      NULL,
    [NRLIVELLISTRUTT]      SMALLINT      NULL,
    [CODICECONFIGURATO]    VARCHAR (50)  NULL,
    [FILESCRIPT_DATACOSTI] VARCHAR (50)  NULL,
    [DATARIFPREZZIPART]    DATETIME      NULL,
    [DOCOFFERTA]           VARCHAR (255) NULL,
    [NOTE]                 VARCHAR (500) NULL,
    [DATAOFFERTAWORD]      DATETIME      NULL,
    [EDIT_STATE]           SMALLINT      CONSTRAINT [DF_TESTEFOGLICOMMCLI_EDITSTATE] DEFAULT ((0)) NOT NULL,
    [EDIT_USER]            VARCHAR (25)  CONSTRAINT [DF_TESTEFOGLICOMMCLI_EDITUSER] DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_TESTEFOGLICOMMCLI] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TESTEFOGLICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TESTEFOGLICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TESTEFOGLICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TESTEFOGLICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TESTEFOGLICOMMCLI] TO [Metodo98]
    AS [dbo];

