CREATE TABLE [dbo].[xInteressiMora] (
    [CODICE]                NUMERIC (6)     NOT NULL,
    [DAIMPORTOINSOLUTO]     NUMERIC (19, 4) DEFAULT (0) NULL,
    [AIMPORTOINSOLUTO]      NUMERIC (19, 4) DEFAULT (0) NULL,
    [INTERESSIMORA]         NUMERIC (19, 4) DEFAULT (0) NULL,
    [DAIMPORTOINSOLUTOEURO] NUMERIC (19, 4) DEFAULT (0) NULL,
    [AIMPORTOINSOLUTOEURO]  NUMERIC (19, 4) DEFAULT (0) NULL,
    [INTERESSIMORAEURO]     NUMERIC (19, 4) DEFAULT (0) NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NULL,
    [DATAMODIFICA]          DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[xInteressiMora] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[xInteressiMora] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[xInteressiMora] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[xInteressiMora] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[xInteressiMora] TO [Metodo98]
    AS [dbo];

