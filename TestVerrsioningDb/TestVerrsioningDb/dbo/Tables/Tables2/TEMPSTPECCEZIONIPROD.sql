﻿CREATE TABLE [dbo].[TEMPSTPECCEZIONIPROD] (
    [NRTERMINALE]  DECIMAL (5)     NOT NULL,
    [NOMEPIANIF]   VARCHAR (30)    NOT NULL,
    [PROG_ID]      DECIMAL (10)    NOT NULL,
    [LIVELLO]      CHAR (1)        NOT NULL,
    [ARTICOLO]     VARCHAR (50)    NULL,
    [DATACONS]     DATETIME        NOT NULL,
    [RIFERIMENTI]  VARCHAR (80)    NULL,
    [QTAIMP]       DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [QTAORD]       DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [VERSIONEDBA]  VARCHAR (10)    NULL,
    [CONSIDERA]    SMALLINT        DEFAULT (0) NULL,
    [MESSAGGIO]    VARCHAR (80)    NULL,
    [DELTAGG]      SMALLINT        DEFAULT (0) NULL,
    [DELTAQTA]     DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [DISPONIBILE]  DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [FLGSTAMPAART] SMALLINT        DEFAULT (0) NULL,
    CONSTRAINT [PK_TEMPSTPECCEZIONIPROD] PRIMARY KEY CLUSTERED ([NRTERMINALE] ASC, [NOMEPIANIF] ASC, [PROG_ID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_CONSIDERA_TEMPSTPE] CHECK ([CONSIDERA] = 0 or [CONSIDERA] = 1)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPECCEZIONIPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPECCEZIONIPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTPECCEZIONIPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPECCEZIONIPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPECCEZIONIPROD] TO [Metodo98]
    AS [dbo];

