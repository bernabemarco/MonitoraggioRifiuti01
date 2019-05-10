CREATE TABLE [dbo].[IE_ExpProfileTablesLink] (
    [Progressivo]      DECIMAL (18)  NOT NULL,
    [RifProgressivo]   DECIMAL (18)  NOT NULL,
    [SourceTable]      VARCHAR (50)  NULL,
    [SourceField]      VARCHAR (200) NULL,
    [DestinationTable] VARCHAR (50)  NULL,
    [DestinationField] VARCHAR (200) NULL,
    [LinkType]         SMALLINT      NULL,
    [UtenteModifica]   VARCHAR (25)  NOT NULL,
    [DataModifica]     DATETIME      NOT NULL,
    CONSTRAINT [PK_IE_ExpProfileTablesLink] PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[IE_ExpProfileTablesLink] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[IE_ExpProfileTablesLink] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[IE_ExpProfileTablesLink] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[IE_ExpProfileTablesLink] TO [Metodo98]
    AS [dbo];

