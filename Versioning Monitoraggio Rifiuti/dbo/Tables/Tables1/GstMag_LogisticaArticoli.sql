CREATE TABLE [dbo].[GstMag_LogisticaArticoli] (
    [Progressivo]     NUMERIC (5)     NOT NULL,
    [CodArt]          VARCHAR (50)    NOT NULL,
    [CodContenitore]  VARCHAR (10)    NOT NULL,
    [UM]              VARCHAR (5)     NOT NULL,
    [Sovrapponibile]  DECIMAL (16, 6) DEFAULT (0) NULL,
    [QtaArt]          DECIMAL (16, 6) DEFAULT (0) NULL,
    [CodImballo]      VARCHAR (10)    DEFAULT (0) NULL,
    [CodDisposizione] NUMERIC (5)     NULL,
    [QtaStrati]       DECIMAL (16, 6) DEFAULT (0) NULL,
    [QtaArtXStrato]   DECIMAL (16, 6) DEFAULT (0) NULL,
    [AltImballo]      DECIMAL (16, 6) DEFAULT (0) NULL,
    [IngTotAltezza]   DECIMAL (16, 6) DEFAULT (0) NULL,
    [VolumeTot]       DECIMAL (16, 6) DEFAULT (0) NULL,
    [UtenteModifica]  VARCHAR (25)    NOT NULL,
    [DataModifica]    DATETIME        NOT NULL,
    [PesoImballo]     DECIMAL (16, 6) NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC, [CodArt] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GstMag_LogisticaArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GstMag_LogisticaArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GstMag_LogisticaArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GstMag_LogisticaArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GstMag_LogisticaArticoli] TO [Metodo98]
    AS [dbo];

