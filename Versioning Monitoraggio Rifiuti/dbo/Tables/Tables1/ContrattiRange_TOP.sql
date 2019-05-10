CREATE TABLE [dbo].[ContrattiRange_TOP] (
    [RIFPROGRESSIVO] DECIMAL (10)    NOT NULL,
    [NRRIGA]         INT             NOT NULL,
    [POSIZIONE]      INT             NULL,
    [FLAGRIGA]       SMALLINT        NULL,
    [VALORE]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [QTA]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [UM]             VARCHAR (3)     NULL,
    [QTA2]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [UM2]            VARCHAR (2)     NULL,
    [CONSUNTIVO]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [CONSUNTIVOQTA2] DECIMAL (19, 6) DEFAULT (0) NULL,
    [DELTA]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [VALORESCONTO]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ContrattiRange_TOP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ContrattiRange_TOP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ContrattiRange_TOP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ContrattiRange_TOP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ContrattiRange_TOP] TO [Metodo98]
    AS [dbo];

