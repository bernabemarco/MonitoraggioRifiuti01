CREATE TABLE [dbo].[VBTURNI] (
    [TURNO]          INT          NOT NULL,
    [DALLE]          DATETIME     NOT NULL,
    [ALLE]           DATETIME     NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [TurnoAttivo]    BIT          NULL,
    [DataTurno]      DATETIME     NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[VBTURNI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VBTURNI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VBTURNI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VBTURNI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VBTURNI] TO [Metodo98]
    AS [dbo];

