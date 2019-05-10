CREATE TABLE [dbo].[MultiImport_DllBancheDati] (
    [CODBANCADATI]   VARCHAR (10)  NOT NULL,
    [RIFERIMENTO]    VARCHAR (255) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([CODBANCADATI] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MultiImport_DllBancheDati] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MultiImport_DllBancheDati] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[MultiImport_DllBancheDati] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MultiImport_DllBancheDati] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MultiImport_DllBancheDati] TO [Metodo98]
    AS [dbo];

