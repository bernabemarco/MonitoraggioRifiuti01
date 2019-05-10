CREATE TABLE [dbo].[ContrattiDoc_TOP] (
    [RIFPROGRESSIVO]            DECIMAL (10) NOT NULL,
    [NRRIGA]                    INT          NOT NULL,
    [FLAGRIGA]                  SMALLINT     NULL,
    [POSIZIONE]                 INT          NULL,
    [TIPODOC]                   VARCHAR (3)  NOT NULL,
    [UTENTEMODIFICA]            VARCHAR (25) NOT NULL,
    [DATAMODIFICA]              DATETIME     NOT NULL,
    [CONSIDERARIGHEVALORE]      SMALLINT     DEFAULT (0) NULL,
    [CONSIDERARIGHEQTASCTMERCE] SMALLINT     DEFAULT (0) NULL,
    [FLGESERCIZIO]              SMALLINT     DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ContrattiDoc_TOP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ContrattiDoc_TOP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ContrattiDoc_TOP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ContrattiDoc_TOP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ContrattiDoc_TOP] TO [Metodo98]
    AS [dbo];

