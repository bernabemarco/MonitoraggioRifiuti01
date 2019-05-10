CREATE TABLE [dbo].[TabRigheTipoDocConsMiss] (
    [RIFPROGRESSIVO] DECIMAL (10) NOT NULL,
    [DOCMISS]        VARCHAR (3)  NOT NULL,
    [DOCCONS]        VARCHAR (3)  NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TabRigheTipoDocConsMiss] PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [DOCMISS] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabRigheTipoDocConsMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabRigheTipoDocConsMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabRigheTipoDocConsMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabRigheTipoDocConsMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabRigheTipoDocConsMiss] TO [Metodo98]
    AS [dbo];

