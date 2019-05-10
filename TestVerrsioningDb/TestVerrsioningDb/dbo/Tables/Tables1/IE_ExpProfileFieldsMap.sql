CREATE TABLE [dbo].[IE_ExpProfileFieldsMap] (
    [Progressivo]    DECIMAL (18)  NOT NULL,
    [RifProgressivo] DECIMAL (18)  NOT NULL,
    [FieldName]      VARCHAR (50)  NOT NULL,
    [FieldAlias]     VARCHAR (50)  NOT NULL,
    [FieldType]      SMALLINT      NOT NULL,
    [FieldPath]      VARCHAR (250) NOT NULL,
    [XmlNodeName]    VARCHAR (50)  NOT NULL,
    [XmlNodePath]    VARCHAR (250) NOT NULL,
    [IsKey]          SMALLINT      NOT NULL,
    [IsVisible]      SMALLINT      NOT NULL,
    [Format]         VARCHAR (25)  NOT NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    [IsFixed]        SMALLINT      NULL,
    [FixedValue]     VARCHAR (25)  NULL,
    [IsFunction]     SMALLINT      NULL,
    CONSTRAINT [PK_IE_ExpProfileFieldsMap] PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[IE_ExpProfileFieldsMap] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[IE_ExpProfileFieldsMap] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[IE_ExpProfileFieldsMap] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[IE_ExpProfileFieldsMap] TO [Metodo98]
    AS [dbo];

