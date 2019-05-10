CREATE TABLE [dbo].[DescrizioniCommCli] (
    [RifProgressivo]   DECIMAL (10)  NOT NULL,
    [NumRiga]          SMALLINT      NOT NULL,
    [TestoDescrizione] VARCHAR (256) NULL,
    [DocCollegato]     VARCHAR (255) NULL,
    [UTENTEMODIFICA]   VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]     DATETIME      NOT NULL,
    [Riga]             INT           NOT NULL,
    CONSTRAINT [DescrizioniCommCli_PK] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [Riga] ASC),
    CONSTRAINT [FK_DESCRIZIONICOMMCLI_RIFPROGRESSIVO] FOREIGN KEY ([RifProgressivo]) REFERENCES [dbo].[AnagraficaCommesse] ([Progressivo]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[DescrizioniCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[DescrizioniCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[DescrizioniCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[DescrizioniCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[DescrizioniCommCli] TO [Metodo98]
    AS [dbo];

