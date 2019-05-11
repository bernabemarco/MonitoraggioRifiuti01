﻿CREATE TABLE [dbo].[temp_GDETT_RAP_ESTINTORI] (
    [IDESTINTORE]    NUMERIC (18)  NOT NULL,
    [IDCONTRATTO]    CHAR (13)     NOT NULL,
    [IDRAPPORTO]     CHAR (14)     NOT NULL,
    [FLAGSC]         CHAR (1)      NULL,
    [FLAGREV]        CHAR (1)      NULL,
    [FLAGCOL]        CHAR (1)      NULL,
    [FLAGRICARICA]   CHAR (1)      NULL,
    [DATA_REV]       DATETIME      NULL,
    [DATA_PROS_REV]  DATETIME      NULL,
    [DATA_COLL]      DATETIME      NULL,
    [DATA_PROS_COLL] DATETIME      NULL,
    [DATA_ULT_MOD]   DATETIME      NULL,
    [UTENTE_ULT_MOD] NVARCHAR (50) NULL,
    [IP_ULT_MOD]     NVARCHAR (50) NULL,
    [NUOVARIGA]      CHAR (1)      DEFAULT ('N') NULL,
    [ELIMINATO]      CHAR (1)      NULL,
    CONSTRAINT [PK_temp_DETT_RAP_ESTINTORI] PRIMARY KEY CLUSTERED ([IDESTINTORE] ASC, [IDCONTRATTO] ASC, [IDRAPPORTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[temp_GDETT_RAP_ESTINTORI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[temp_GDETT_RAP_ESTINTORI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[temp_GDETT_RAP_ESTINTORI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[temp_GDETT_RAP_ESTINTORI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[temp_GDETT_RAP_ESTINTORI] TO [Metodo98]
    AS [dbo];
