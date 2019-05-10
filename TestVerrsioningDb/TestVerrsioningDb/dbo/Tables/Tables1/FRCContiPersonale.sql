CREATE TABLE [dbo].[FRCContiPersonale] (
    [NumeroRiga]      INT          NOT NULL,
    [Qualifica]       INT          DEFAULT ((0)) NULL,
    [CodDestinazione] VARCHAR (10) DEFAULT ('') NULL,
    [CodConto]        VARCHAR (20) DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25) NOT NULL,
    [DataModifica]    DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([NumeroRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCContiPersonale] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCContiPersonale] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCContiPersonale] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCContiPersonale] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCContiPersonale] TO [Metodo98]
    AS [dbo];

