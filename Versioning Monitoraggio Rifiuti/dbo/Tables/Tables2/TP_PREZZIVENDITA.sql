CREATE TABLE [dbo].[TP_PREZZIVENDITA] (
    [IDTESTA]               DECIMAL (10)    NOT NULL,
    [IDRIGA]                INT             NOT NULL,
    [ESERCIZIO]             DECIMAL (5)     NOT NULL,
    [NUMERODOC]             DECIMAL (10)    NOT NULL,
    [NUMRIFDOC]             VARCHAR (15)    NULL,
    [CodConto]              VARCHAR (7)     NOT NULL,
    [Tipo]                  CHAR (1)        NOT NULL,
    [CodArticolo]           VARCHAR (50)    NOT NULL,
    [UmGest]                VARCHAR (3)     NOT NULL,
    [CodListino]            NUMERIC (5)     NOT NULL,
    [PrezzoLst]             NUMERIC (19, 6) NOT NULL,
    [QtaGest]               NUMERIC (19, 6) NOT NULL,
    [DataDoc]               DATETIME        NOT NULL,
    [ScontoEsteso]          VARCHAR (50)    NOT NULL,
    [TIPODOC]               VARCHAR (3)     NOT NULL,
    [PREZZOUNITLORDO]       DECIMAL (19, 6) NOT NULL,
    [PREZZOUNITNETTO]       DECIMAL (19, 6) NOT NULL,
    [PREZZOUNITLORDOEURO]   DECIMAL (19, 6) NOT NULL,
    [PREZZOUNITNETTOEURO]   DECIMAL (19, 6) NOT NULL,
    [CODAGENTE1]            VARCHAR (7)     NULL,
    [CODAGENTE2]            VARCHAR (7)     NULL,
    [CODAGENTE3]            VARCHAR (7)     NULL,
    [DESCRIZIONEPROMOZIONE] VARCHAR (50)    NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]          DATETIME        NOT NULL,
    [PROVVAG1]              VARCHAR (20)    DEFAULT ('') NOT NULL,
    [PROVVAG2]              VARCHAR (20)    DEFAULT ('') NOT NULL,
    [PROVVAG3]              VARCHAR (20)    DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_TP_PREZZIVENDITA] PRIMARY KEY CLUSTERED ([IDTESTA] ASC, [IDRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_PREZZIVENDITA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_PREZZIVENDITA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_PREZZIVENDITA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_PREZZIVENDITA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_PREZZIVENDITA] TO [Metodo98]
    AS [dbo];

