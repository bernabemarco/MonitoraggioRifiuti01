﻿CREATE TABLE [dbo].[TEMPANALISIDISPARTICOLO] (
    [IDSESSIONE]     INT             NOT NULL,
    [NRMOVIMENTO]    DECIMAL (10)    NOT NULL,
    [DATADISP]       DATETIME        NULL,
    [CODART]         VARCHAR (50)    NOT NULL,
    [ORDINATO]       SMALLINT        NULL,
    [IMPEGNATO]      SMALLINT        NULL,
    [ORDINATO2UM]    SMALLINT        NULL,
    [IMPEGNATO2UM]   SMALLINT        NULL,
    [QUANTITA]       DECIMAL (16, 6) NOT NULL,
    [QUANTITA2UM]    DECIMAL (16, 6) NOT NULL,
    [SITUAZIONE]     DECIMAL (16, 6) NOT NULL,
    [SITUAZIONE2UM]  DECIMAL (16, 6) NOT NULL,
    [GGSCOPERTO]     INT             NULL,
    [ORDINELETTURA]  INT             NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [SCADUTO]        SMALLINT        CONSTRAINT [DF_TEMPANALISIDISPARTICOLO_SCADUTO] DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [NRMOVIMENTO] ASC, [CODART] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPANALISIDISPARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPANALISIDISPARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPANALISIDISPARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPANALISIDISPARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPANALISIDISPARTICOLO] TO [Metodo98]
    AS [dbo];

