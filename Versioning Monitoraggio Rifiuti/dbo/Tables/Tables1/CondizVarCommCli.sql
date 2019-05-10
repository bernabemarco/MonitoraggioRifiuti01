CREATE TABLE [dbo].[CondizVarCommCli] (
    [RifProgressivo] DECIMAL (10)    NOT NULL,
    [NumRiga]        SMALLINT        NOT NULL,
    [Condizione]     VARCHAR (40)    NULL,
    [TipoVar]        SMALLINT        CONSTRAINT [DF__CondizVar__TipoV__2003926C] DEFAULT (0) NULL,
    [ValoreVar]      DECIMAL (19, 6) CONSTRAINT [DF__CondizVar__Valor__20F7B6A5] DEFAULT (0) NULL,
    [ImportoVariato] DECIMAL (5)     NULL,
    [ValOfferta]     DECIMAL (13, 6) CONSTRAINT [DF__CondizVar__ValOf__22DFFF17] DEFAULT (1) NULL,
    [ValFormale]     DECIMAL (13, 6) CONSTRAINT [DF__CondizVar__ValFo__23D42350] DEFAULT (1) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [CODDIVISA]      NUMERIC (5)     CONSTRAINT [DF__CONDIZVAR__CODDI__7DAF45BF] DEFAULT (0) NULL,
    CONSTRAINT [CondizVarCommCli_PK] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [NumRiga] ASC),
    CONSTRAINT [FK_CONDIZVARCOMMCLI_RIFPROGRESSIVO] FOREIGN KEY ([RifProgressivo]) REFERENCES [dbo].[AnagraficaCommesse] ([Progressivo]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CondizVarCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CondizVarCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CondizVarCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CondizVarCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CondizVarCommCli] TO [Metodo98]
    AS [dbo];

