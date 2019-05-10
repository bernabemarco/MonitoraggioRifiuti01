CREATE TABLE [dbo].[ImportiFornCommCli] (
    [RifProgressivo] DECIMAL (10)    NOT NULL,
    [NumRiga]        SMALLINT        NOT NULL,
    [TipoFornitura]  NUMERIC (5)     NULL,
    [Importo]        DECIMAL (19, 6) NULL,
    [FlagVarContr]   SMALLINT        NULL,
    [CodDivisa]      NUMERIC (5)     NULL,
    [ValOfferta]     DECIMAL (13, 6) NULL,
    [ValFormale]     DECIMAL (13, 6) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [ImportiFornCommCli_PK] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [NumRiga] ASC),
    CONSTRAINT [FK_IMPORTIFORNCOMMCLI_RIFPROGRESSIVO] FOREIGN KEY ([RifProgressivo]) REFERENCES [dbo].[AnagraficaCommesse] ([Progressivo]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ImportiFornCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ImportiFornCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ImportiFornCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ImportiFornCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ImportiFornCommCli] TO [Metodo98]
    AS [dbo];

