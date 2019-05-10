CREATE TABLE [dbo].[ALD_TabTrust] (
    [IdTrust]            SMALLINT     NOT NULL,
    [Descrizione]        VARCHAR (80) NULL,
    [STATOCONTABILITA]   SMALLINT     DEFAULT (0) NULL,
    [STATOMAGAZZINO]     SMALLINT     DEFAULT (0) NULL,
    [STATOORDINI]        SMALLINT     DEFAULT (0) NULL,
    [STATOBOLLE]         SMALLINT     DEFAULT (0) NULL,
    [STATOFATTURE]       SMALLINT     DEFAULT (0) NULL,
    [STATONOTEACCREDITO] SMALLINT     DEFAULT (0) NULL,
    [STATOALTRO]         SMALLINT     DEFAULT (0) NULL,
    [CODCATEGORIA]       DECIMAL (5)  NULL,
    [UTENTEMODIFICA]     VARCHAR (25) NOT NULL,
    [DATAMODIFICA]       DATETIME     NOT NULL,
    [GrContiPotenziali]  VARCHAR (4)  NULL,
    [Potenziale]         SMALLINT     NULL,
    [ExporSap]           SMALLINT     NULL,
    [NaturaTrust]        VARCHAR (10) NULL,
    [ExportCRM]          SMALLINT     DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([IdTrust] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TabTrust] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TabTrust] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TabTrust] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TabTrust] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TabTrust] TO [Metodo98]
    AS [dbo];

