CREATE TABLE [dbo].[IE_ExpProfileTableFields] (
    [Progressivo]          DECIMAL (18)  NOT NULL,
    [RifProgressivoExpTbl] DECIMAL (18)  NOT NULL,
    [FieldName]            VARCHAR (80)  NOT NULL,
    [FieldAlias]           VARCHAR (80)  NOT NULL,
    [FieldValue]           VARCHAR (100) NULL,
    [FieldType]            SMALLINT      DEFAULT ((0)) NOT NULL,
    [FieldLenght]          SMALLINT      DEFAULT ((0)) NOT NULL,
    [FieldScale]           SMALLINT      DEFAULT ((0)) NOT NULL,
    [FieldFormat]          VARCHAR (50)  DEFAULT ('') NOT NULL,
    [Enabled]              SMALLINT      DEFAULT ((0)) NOT NULL,
    [UtenteModifica]       VARCHAR (25)  NOT NULL,
    [DataModifica]         DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[IE_ExpProfileTableFields] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[IE_ExpProfileTableFields] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[IE_ExpProfileTableFields] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[IE_ExpProfileTableFields] TO [Metodo98]
    AS [dbo];

