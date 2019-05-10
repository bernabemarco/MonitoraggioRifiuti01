CREATE TABLE [dbo].[CGesWReversioni] (
    [NrTerminale]      DECIMAL (5)  NOT NULL,
    [Progressivo]      DECIMAL (10) NOT NULL,
    [CodDestOrigine]   VARCHAR (10) DEFAULT ('') NULL,
    [TipoTariffa]      SMALLINT     DEFAULT (0) NULL,
    [CodConto]         VARCHAR (20) DEFAULT ('') NULL,
    [AnnoValidita]     DECIMAL (5)  DEFAULT (0) NULL,
    [MeseValidita]     INT          DEFAULT (0) NULL,
    [CriterioRev]      SMALLINT     DEFAULT (0) NULL,
    [ModalitaRev]      SMALLINT     DEFAULT (0) NULL,
    [ModalitaErr]      SMALLINT     DEFAULT (0) NULL,
    [TipoReversione]   SMALLINT     DEFAULT (0) NULL,
    [ModalitaCosto]    SMALLINT     DEFAULT (0) NULL,
    [UnitaMisura]      VARCHAR (5)  DEFAULT ('') NULL,
    [ContoSelezionato] VARCHAR (20) DEFAULT ('') NULL,
    [Normalizzate]     SMALLINT     DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesWReversioni_DTCAM]
    ON [dbo].[CGesWReversioni]([NrTerminale] ASC, [CodDestOrigine] ASC, [TipoTariffa] ASC, [CodConto] ASC, [AnnoValidita] ASC, [MeseValidita] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CGesWReversioni_DC]
    ON [dbo].[CGesWReversioni]([NrTerminale] ASC, [CodDestOrigine] ASC, [CodConto] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CGesWReversioni_DTAM]
    ON [dbo].[CGesWReversioni]([NrTerminale] ASC, [CodDestOrigine] ASC, [TipoTariffa] ASC, [AnnoValidita] ASC, [MeseValidita] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CGesWReversioni_AMC]
    ON [dbo].[CGesWReversioni]([NrTerminale] ASC, [AnnoValidita] ASC, [MeseValidita] ASC, [CodConto] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWReversioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWReversioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWReversioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWReversioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWReversioni] TO [Metodo98]
    AS [dbo];

