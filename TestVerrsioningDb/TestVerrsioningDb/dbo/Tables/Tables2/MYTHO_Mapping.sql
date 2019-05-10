CREATE TABLE [dbo].[MYTHO_Mapping] (
    [Progressivo]    DECIMAL (10)  NOT NULL,
    [Descrizione]    VARCHAR (200) NULL,
    [Oggetto]        INT           NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_MYTHO_Mapping] PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MYTHO_Mapping] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MYTHO_Mapping] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MYTHO_Mapping] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MYTHO_Mapping] TO [Metodo98]
    AS [dbo];

