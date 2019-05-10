CREATE TABLE [dbo].[MB_RisaliteDoc] (
    [Idtesta]          DECIMAL (10) NOT NULL,
    [idriga]           INT          NOT NULL,
    [CLIORIG]          VARCHAR (7)  NULL,
    [CLIFATTORIG]      VARCHAR (7)  NULL,
    [DESTDIVMERCIORIG] DECIMAL (5)  NULL,
    [ID]               INT          IDENTITY (1, 1) NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MB_RisaliteDoc] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MB_RisaliteDoc] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_RisaliteDoc] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MB_RisaliteDoc] TO [Metodo98]
    AS [dbo];

