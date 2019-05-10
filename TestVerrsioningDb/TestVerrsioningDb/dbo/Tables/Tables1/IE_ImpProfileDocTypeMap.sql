CREATE TABLE [dbo].[IE_ImpProfileDocTypeMap] (
    [CodDocMet]      VARCHAR (3)  NOT NULL,
    [CodDocExt]      VARCHAR (5)  NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([CodDocMet] ASC, [CodDocExt] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[IE_ImpProfileDocTypeMap] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[IE_ImpProfileDocTypeMap] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[IE_ImpProfileDocTypeMap] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[IE_ImpProfileDocTypeMap] TO [Metodo98]
    AS [dbo];

