﻿CREATE TABLE [dbo].[IMPOSTAZIONISTAMPA] (
    [NOMEUTENTE]       VARCHAR (25)   NOT NULL,
    [NOMEFILTRO]       VARCHAR (80)   NOT NULL,
    [NOMEIMPOSTAZIONE] VARCHAR (50)   NOT NULL,
    [ID]               INT            NOT NULL,
    [TIPOIMPOSTAZIONE] SMALLINT       NOT NULL,
    [DAVALORE]         VARCHAR (5000) NULL,
    [OPERATORE]        INT            NULL,
    [AVALORE]          VARCHAR (100)  NULL,
    [UTENTEMODIFICA]   VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]     DATETIME       NOT NULL,
    [IMPDEFAULT]       SMALLINT       DEFAULT (0) NULL,
    CONSTRAINT [PK_IMPOSTAZIONISTAMPA] PRIMARY KEY CLUSTERED ([NOMEUTENTE] ASC, [NOMEFILTRO] ASC, [NOMEIMPOSTAZIONE] ASC, [ID] ASC, [TIPOIMPOSTAZIONE] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CHK_IMPDEFAULT_IMPSTAMPA] CHECK ([IMPDEFAULT] = 1 or [IMPDEFAULT] = 0)
);


GO
CREATE NONCLUSTERED INDEX [IMPOSTSTP_DSC]
    ON [dbo].[IMPOSTAZIONISTAMPA]([NOMEIMPOSTAZIONE] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[IMPOSTAZIONISTAMPA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[IMPOSTAZIONISTAMPA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[IMPOSTAZIONISTAMPA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[IMPOSTAZIONISTAMPA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[IMPOSTAZIONISTAMPA] TO [Metodo98]
    AS [dbo];

