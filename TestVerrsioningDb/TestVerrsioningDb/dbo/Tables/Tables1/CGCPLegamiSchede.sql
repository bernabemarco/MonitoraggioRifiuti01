CREATE TABLE [dbo].[CGCPLegamiSchede] (
    [Progressivo]     DECIMAL (10) NOT NULL,
    [Tipo]            VARCHAR (5)  DEFAULT ('') NULL,
    [Voce]            VARCHAR (10) DEFAULT ('') NULL,
    [TipoLegame]      VARCHAR (1)  DEFAULT ('') NULL,
    [VoceLegata]      VARCHAR (10) DEFAULT ('') NULL,
    [GruppoCosti]     VARCHAR (3)  DEFAULT ('') NULL,
    [Segno]           SMALLINT     DEFAULT (1) NULL,
    [Grassetto]       SMALLINT     DEFAULT (0) NULL,
    [Colore]          SMALLINT     DEFAULT (0) NULL,
    [VoceRiferimento] VARCHAR (10) DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25) NOT NULL,
    [DataModifica]    DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPLegamiSchede] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPLegamiSchede] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPLegamiSchede] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPLegamiSchede] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPLegamiSchede] TO [Metodo98]
    AS [dbo];

