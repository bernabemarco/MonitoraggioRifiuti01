CREATE TABLE [dbo].[CGesLegamiRiclassificazioni] (
    [Progressivo]        DECIMAL (10) NOT NULL,
    [Tipo]               VARCHAR (5)  DEFAULT ('') NULL,
    [Voce]               VARCHAR (10) DEFAULT ('') NULL,
    [TipoLegame]         VARCHAR (1)  DEFAULT ('') NULL,
    [TipoValore]         SMALLINT     DEFAULT (0) NULL,
    [VoceLegata]         VARCHAR (10) DEFAULT ('') NULL,
    [CodConto]           VARCHAR (20) DEFAULT ('') NULL,
    [CodDestinazione]    VARCHAR (10) DEFAULT ('') NULL,
    [CodDestinazioneRev] VARCHAR (10) DEFAULT ('') NULL,
    [Segno]              SMALLINT     DEFAULT (1) NULL,
    [Totalizzazione]     SMALLINT     DEFAULT (0) NULL,
    [Grassetto]          SMALLINT     DEFAULT (0) NULL,
    [Colore]             SMALLINT     DEFAULT (0) NULL,
    [UtenteModifica]     VARCHAR (25) NOT NULL,
    [DataModifica]       DATETIME     NOT NULL,
    [ValoreVarFis]       SMALLINT     DEFAULT (0) NULL,
    [ValorePosNeg]       SMALLINT     DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesLegamiRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesLegamiRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesLegamiRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesLegamiRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesLegamiRiclassificazioni] TO [Metodo98]
    AS [dbo];

