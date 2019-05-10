CREATE TABLE [dbo].[EXTRAPARDOC] (
    [CODICE]                VARCHAR (3)     NOT NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]          DATETIME        NOT NULL,
    [pRitCondominio]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [DocOrSpedizione]       SMALLINT        NULL,
    [FLGDerogaDivisioneMag] SMALLINT        NULL,
    [flagCommessaObbl]      SMALLINT        DEFAULT ((0)) NULL,
    [flagCommessaDeafult]   SMALLINT        DEFAULT ((0)) NULL,
    [CTRLGiacenza]          INT             DEFAULT ((0)) NULL,
    [DDVCommessa]           INT             DEFAULT ((0)) NULL,
    CONSTRAINT [PK_EXTRAPARDOC] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_EXTRAPARDOC_CODICE] FOREIGN KEY ([CODICE]) REFERENCES [dbo].[PARAMETRIDOC] ([CODICE]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EXTRAPARDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EXTRAPARDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EXTRAPARDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EXTRAPARDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EXTRAPARDOC] TO [Metodo98]
    AS [dbo];

