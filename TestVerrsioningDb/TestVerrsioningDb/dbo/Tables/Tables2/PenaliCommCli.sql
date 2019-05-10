CREATE TABLE [dbo].[PenaliCommCli] (
    [RifProgressivo]    DECIMAL (10)    NOT NULL,
    [NumRiga]           SMALLINT        NOT NULL,
    [CodicePenale]      SMALLINT        NOT NULL,
    [DettaglioPenale]   VARCHAR (30)    NULL,
    [Cadenza]           SMALLINT        DEFAULT (0) NULL,
    [TipoVariazione]    SMALLINT        DEFAULT (0) NULL,
    [ValorePenalita]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoModificato] DECIMAL (5)     NULL,
    [CodDivisa]         SMALLINT        DEFAULT (0) NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    CONSTRAINT [PenaliCommCli_PK] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [NumRiga] ASC),
    CONSTRAINT [FK_PENALICOMMCLI_RIFPROGRESSIVO] FOREIGN KEY ([RifProgressivo]) REFERENCES [dbo].[AnagraficaCommesse] ([Progressivo]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PenaliCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PenaliCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PenaliCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PenaliCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PenaliCommCli] TO [Metodo98]
    AS [dbo];

