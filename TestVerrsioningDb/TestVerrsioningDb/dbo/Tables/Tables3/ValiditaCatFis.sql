CREATE TABLE [dbo].[ValiditaCatFis] (
    [CodCatFis]      DECIMAL (5)    NOT NULL,
    [Progressivo]    DECIMAL (10)   DEFAULT (0) NOT NULL,
    [DtaIniz]        DATETIME       NULL,
    [DtaFine]        DATETIME       NULL,
    [PrcAmmMin]      DECIMAL (8, 5) DEFAULT (0) NULL,
    [PrcAmmOrd]      DECIMAL (8, 5) DEFAULT (0) NULL,
    [PrcAmmAnt]      DECIMAL (8, 5) DEFAULT (0) NULL,
    [UTENTEMODIFICA] VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]   DATETIME       NOT NULL,
    CONSTRAINT [ValiditaCatFis_PK] PRIMARY KEY CLUSTERED ([CodCatFis] ASC, [Progressivo] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_VALIDITACATFIS_CODCATFIS] FOREIGN KEY ([CodCatFis]) REFERENCES [dbo].[CategorieFiscali] ([Codice]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ValiditaCatFis] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ValiditaCatFis] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ValiditaCatFis] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ValiditaCatFis] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ValiditaCatFis] TO [Metodo98]
    AS [dbo];

