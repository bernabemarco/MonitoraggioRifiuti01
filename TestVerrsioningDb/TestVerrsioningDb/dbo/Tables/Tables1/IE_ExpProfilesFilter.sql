CREATE TABLE [dbo].[IE_ExpProfilesFilter] (
    [Progressivo]    DECIMAL (18)  NOT NULL,
    [RifProgressivo] DECIMAL (18)  NOT NULL,
    [FieldTable]     VARCHAR (25)  NOT NULL,
    [FieldName]      VARCHAR (25)  NOT NULL,
    [Operator]       SMALLINT      NOT NULL,
    [FieldValue]     VARCHAR (250) NOT NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    CONSTRAINT [PK_IE_ExpProfilesFilter] PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[IE_ExpProfilesFilter] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[IE_ExpProfilesFilter] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[IE_ExpProfilesFilter] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[IE_ExpProfilesFilter] TO [Metodo98]
    AS [dbo];

