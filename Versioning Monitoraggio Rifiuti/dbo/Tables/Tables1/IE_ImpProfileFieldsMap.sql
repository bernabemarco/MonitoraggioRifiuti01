CREATE TABLE [dbo].[IE_ImpProfileFieldsMap] (
    [Progressivo]        DECIMAL (18)  NOT NULL,
    [RifProgressivo]     DECIMAL (18)  NOT NULL,
    [FieldName]          VARCHAR (25)  NOT NULL,
    [FieldType]          SMALLINT      NOT NULL,
    [NodeName]           VARCHAR (25)  NOT NULL,
    [Reference]          VARCHAR (25)  NOT NULL,
    [Required]           SMALLINT      DEFAULT ((0)) NOT NULL,
    [Recursive]          SMALLINT      DEFAULT ((0)) NOT NULL,
    [Head]               SMALLINT      DEFAULT ((0)) NOT NULL,
    [Row]                SMALLINT      DEFAULT ((0)) NOT NULL,
    [Extra]              SMALLINT      DEFAULT ((0)) NOT NULL,
    [Format]             VARCHAR (25)  DEFAULT ('') NOT NULL,
    [ConversionFunction] VARCHAR (25)  DEFAULT ('') NOT NULL,
    [SortNumber]         INT           DEFAULT ((0)) NOT NULL,
    [ReferenceNode]      VARCHAR (100) DEFAULT ('') NOT NULL,
    [ReferenceXml]       VARCHAR (100) DEFAULT ('') NOT NULL,
    [UtenteModifica]     VARCHAR (25)  NOT NULL,
    [DataModifica]       DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC, [RifProgressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[IE_ImpProfileFieldsMap] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[IE_ImpProfileFieldsMap] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[IE_ImpProfileFieldsMap] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[IE_ImpProfileFieldsMap] TO [Metodo98]
    AS [dbo];

