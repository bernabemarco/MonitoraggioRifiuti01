CREATE TABLE [dbo].[VBsituazionecassaT] (
    [Progressivo]    DECIMAL (18) NOT NULL,
    [Data]           DATETIME     NOT NULL,
    [Cassa]          NUMERIC (18) NOT NULL,
    [Turno]          NUMERIC (18) NOT NULL,
    [Operatore]      VARCHAR (25) NULL,
    [NrScontrini]    DECIMAL (19) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_VBsituazionecassaT] PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[VBsituazionecassaT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VBsituazionecassaT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VBsituazionecassaT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VBsituazionecassaT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VBsituazionecassaT] TO [Metodo98]
    AS [dbo];

