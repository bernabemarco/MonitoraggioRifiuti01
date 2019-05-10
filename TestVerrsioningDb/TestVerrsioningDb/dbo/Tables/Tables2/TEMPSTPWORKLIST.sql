CREATE TABLE [dbo].[TEMPSTPWORKLIST] (
    [IDSessione]           INT             NOT NULL,
    [CdLavoro]             VARCHAR (5)     NULL,
    [Macchina]             VARCHAR (5)     NULL,
    [ProgCiclo]            NUMERIC (10)    NOT NULL,
    [NumeroFase]           INT             NOT NULL,
    [StatoOperazione]      SMALLINT        NULL,
    [OreCaricoSetup]       DECIMAL (16, 6) DEFAULT (0) NULL,
    [OreCaricoSetupRes]    DECIMAL (16, 6) DEFAULT (0) NULL,
    [OreCaricoMacchina]    DECIMAL (16, 6) DEFAULT (0) NULL,
    [OreCaricoMacchinaRes] DECIMAL (16, 6) DEFAULT (0) NULL,
    [OreCaricoUomo]        DECIMAL (16, 6) DEFAULT (0) NULL,
    [OreCaricoUomoRes]     DECIMAL (16, 6) DEFAULT (0) NULL,
    [OreCaricoTotale]      DECIMAL (16, 6) DEFAULT (0) NULL,
    [OreCaricoTotaleRes]   DECIMAL (16, 6) DEFAULT (0) NULL,
    [UTENTEMODIFICA]       VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]         DATETIME        NOT NULL,
    CONSTRAINT [PK_TEMPSTPWORKLIST] PRIMARY KEY CLUSTERED ([IDSessione] ASC, [ProgCiclo] ASC, [NumeroFase] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPWORKLIST] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPWORKLIST] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTPWORKLIST] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPWORKLIST] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPWORKLIST] TO [Metodo98]
    AS [dbo];

