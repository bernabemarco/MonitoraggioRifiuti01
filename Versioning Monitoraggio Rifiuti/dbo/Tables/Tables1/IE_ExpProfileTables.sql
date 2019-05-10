CREATE TABLE [dbo].[IE_ExpProfileTables] (
    [Progressivo]    DECIMAL (18)    NOT NULL,
    [TableName]      VARCHAR (80)    NOT NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    [RifProgressivo] DECIMAL (18)    NULL,
    [TableCaption]   VARCHAR (50)    NULL,
    [CoordX1]        DECIMAL (16, 6) NULL,
    [CoordY1]        DECIMAL (16, 6) NULL,
    [CoordX2]        DECIMAL (16, 6) NULL,
    [CoordY2]        DECIMAL (16, 6) NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[IE_ExpProfileTables] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[IE_ExpProfileTables] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[IE_ExpProfileTables] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[IE_ExpProfileTables] TO [Metodo98]
    AS [dbo];

