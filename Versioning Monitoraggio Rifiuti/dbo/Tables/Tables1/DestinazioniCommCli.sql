CREATE TABLE [dbo].[DestinazioniCommCli] (
    [RifProgressivo]  DECIMAL (10) NOT NULL,
    [NumRiga]         SMALLINT     DEFAULT (0) NOT NULL,
    [OggettoDest]     VARCHAR (30) NULL,
    [RagioneSociale]  VARCHAR (50) NULL,
    [Indirizzo]       VARCHAR (40) NULL,
    [CAP]             VARCHAR (8)  NULL,
    [Localita]        VARCHAR (40) NULL,
    [Provincia]       VARCHAR (2)  NULL,
    [Telefono]        VARCHAR (16) NULL,
    [Fax]             VARCHAR (16) NULL,
    [Inoltrotrasp]    SMALLINT     DEFAULT (0) NULL,
    [CodDeposito]     VARCHAR (10) NULL,
    [CodDepositoColl] VARCHAR (10) NULL,
    [CodDepComp]      VARCHAR (10) NULL,
    [CodDepCompColl]  VARCHAR (10) NULL,
    [UTENTEMODIFICA]  VARCHAR (25) NOT NULL,
    [DATAMODIFICA]    DATETIME     NOT NULL,
    CONSTRAINT [DestinazioniCommCli_PK] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [NumRiga] ASC),
    CONSTRAINT [FK_DESTINAZIONICOMMCLI_RIFPROGRESSIVO] FOREIGN KEY ([RifProgressivo]) REFERENCES [dbo].[AnagraficaCommesse] ([Progressivo]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[DestinazioniCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[DestinazioniCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[DestinazioniCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[DestinazioniCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[DestinazioniCommCli] TO [Metodo98]
    AS [dbo];

