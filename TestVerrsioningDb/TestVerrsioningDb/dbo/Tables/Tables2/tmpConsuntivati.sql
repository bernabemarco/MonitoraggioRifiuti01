CREATE TABLE [dbo].[tmpConsuntivati] (
    [CONTRATTO]           DECIMAL (18) NOT NULL,
    [TIPODOC]             VARCHAR (3)  NOT NULL,
    [NUMERODOC]           DECIMAL (18) NOT NULL,
    [CODCLIFOR]           VARCHAR (7)  NOT NULL,
    [CODCFFATT]           VARCHAR (7)  NOT NULL,
    [NUMDESTDIVERSAMERCI] DECIMAL (18) NOT NULL,
    [PROGRESSIVO]         DECIMAL (18) NOT NULL,
    [IDRIGA]              INT          NOT NULL,
    [sessione]            DECIMAL (5)  NOT NULL,
    [scartata]            SMALLINT     DEFAULT ((0)) NOT NULL,
    [tipologia]           VARCHAR (1)  NOT NULL,
    [timestamp]           ROWVERSION   NOT NULL,
    [NRTERMINALE]         DECIMAL (5)  DEFAULT ((0)) NULL,
    [FINOALLADATA]        DATETIME     NULL,
    [DATACONSUNTIV]       DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([CONTRATTO] ASC, [TIPODOC] ASC, [NUMERODOC] ASC, [PROGRESSIVO] ASC, [IDRIGA] ASC, [sessione] ASC, [timestamp] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpConsuntivati] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpConsuntivati] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tmpConsuntivati] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpConsuntivati] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpConsuntivati] TO [Metodo98]
    AS [dbo];

