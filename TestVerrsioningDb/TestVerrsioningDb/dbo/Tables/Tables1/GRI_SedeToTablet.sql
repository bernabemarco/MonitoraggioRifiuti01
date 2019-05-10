CREATE TABLE [dbo].[GRI_SedeToTablet] (
    [PROGRESSIVO]    NUMERIC (18)  IDENTITY (1, 1) NOT NULL,
    [RifRecord]      VARCHAR (50)  NOT NULL,
    [Oggetto]        VARCHAR (100) NOT NULL,
    [TipoOperazione] VARCHAR (1)   NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    CONSTRAINT [PK_GRI_SedeToTablet] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_SedeToTablet] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_SedeToTablet] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_SedeToTablet] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_SedeToTablet] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_SedeToTablet] TO [Metodo98]
    AS [dbo];

