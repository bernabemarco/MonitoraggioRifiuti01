CREATE TABLE [dbo].[Ald_TEMPGiacenzaArticoloDA] (
    [NRTERMINALE]    DECIMAL (10)    NOT NULL,
    [CODART]         VARCHAR (50)    NOT NULL,
    [QTA]            DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [PK_Ald_TEMPGiacenzaArticoloDA] PRIMARY KEY CLUSTERED ([NRTERMINALE] ASC, [CODART] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_TEMPGiacenzaArticoloDA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_TEMPGiacenzaArticoloDA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_TEMPGiacenzaArticoloDA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_TEMPGiacenzaArticoloDA] TO [Metodo98]
    AS [dbo];

