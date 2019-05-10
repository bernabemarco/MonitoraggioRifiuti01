CREATE TABLE [dbo].[xSpeseInsoluto] (
    [CODICE]                NUMERIC (6)     NOT NULL,
    [CODBANCA]              VARCHAR (7)     NOT NULL,
    [DAIMPORTOINSOLUTO]     NUMERIC (19, 4) DEFAULT (0) NULL,
    [AIMPORTOINSOLUTO]      NUMERIC (19, 4) DEFAULT (0) NULL,
    [IMPORTOSPESE]          NUMERIC (19, 4) DEFAULT (0) NULL,
    [DAIMPORTOINSOLUTOEURO] NUMERIC (19, 4) DEFAULT (0) NULL,
    [AIMPORTOINSOLUTOEURO]  NUMERIC (19, 4) DEFAULT (0) NULL,
    [IMPORTOSPESEEURO]      NUMERIC (19, 4) DEFAULT (0) NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NULL,
    [DATAMODIFICA]          DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[xSpeseInsoluto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[xSpeseInsoluto] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[xSpeseInsoluto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[xSpeseInsoluto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[xSpeseInsoluto] TO [Metodo98]
    AS [dbo];

