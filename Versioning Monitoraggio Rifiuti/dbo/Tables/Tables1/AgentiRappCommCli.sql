CREATE TABLE [dbo].[AgentiRappCommCli] (
    [RifProgressivo] DECIMAL (10)    NOT NULL,
    [NumRiga]        SMALLINT        NOT NULL,
    [CodConto]       VARCHAR (7)     NULL,
    [ProvvAg]        VARCHAR (10)    NULL,
    [ImportoProvv]   DECIMAL (19, 4) CONSTRAINT [DF__AgentiRap__Impor__26B08FFB] DEFAULT (0) NULL,
    [ValOfferta]     DECIMAL (13, 6) CONSTRAINT [DF__AgentiRap__ValOf__2898D86D] DEFAULT (1) NULL,
    [ValFormale]     DECIMAL (13, 6) CONSTRAINT [DF__AgentiRap__ValFo__298CFCA6] DEFAULT (1) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [CODDIVISA]      NUMERIC (5)     CONSTRAINT [DF__AGENTIRAP__CODDI__008BB26A] DEFAULT (0) NULL,
    CONSTRAINT [AgentiRappCommCli_PK] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [NumRiga] ASC),
    CONSTRAINT [FK_AGENTIRAPPCOMMCLI_RIFPROGRESSIVO] FOREIGN KEY ([RifProgressivo]) REFERENCES [dbo].[AnagraficaCommesse] ([Progressivo]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[AgentiRappCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AgentiRappCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[AgentiRappCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AgentiRappCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AgentiRappCommCli] TO [Metodo98]
    AS [dbo];

