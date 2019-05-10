CREATE TABLE [dbo].[DescHelpContextID] (
    [ID]             NUMERIC (20)  NOT NULL,
    [VOCEMENU]       VARCHAR (200) NOT NULL,
    [POSIZIONE]      NUMERIC (10)  NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[DescHelpContextID] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[DescHelpContextID] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[DescHelpContextID] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[DescHelpContextID] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[DescHelpContextID] TO [Metodo98]
    AS [dbo];

