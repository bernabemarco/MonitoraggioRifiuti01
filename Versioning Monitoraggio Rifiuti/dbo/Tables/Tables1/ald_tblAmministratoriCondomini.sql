CREATE TABLE [dbo].[ald_tblAmministratoriCondomini] (
    [IdAmmnistratore]     SMALLINT      NOT NULL,
    [Nominativo]          VARCHAR (80)  NULL,
    [indirizzo]           VARCHAR (80)  NULL,
    [cap]                 VARCHAR (8)   NULL,
    [localita]            VARCHAR (80)  NULL,
    [provincia]           VARCHAR (4)   NULL,
    [telefono]            VARCHAR (25)  NULL,
    [fax]                 VARCHAR (25)  NULL,
    [email]               VARCHAR (50)  NULL,
    [Obsoleto]            SMALLINT      DEFAULT ((0)) NULL,
    [Note]                VARCHAR (100) NULL,
    [UTENTEMODIFICA]      VARCHAR (25)  NULL,
    [DATAMODIFICA]        DATETIME      NULL,
    [PARTITAIVA]          VARCHAR (11)  DEFAULT ('') NULL,
    [CodFiscale]          VARCHAR (16)  DEFAULT ('') NULL,
    [flagMultiCondominio] SMALLINT      DEFAULT ((0)) NULL,
    [codsap]              VARCHAR (10)  DEFAULT ('') NULL,
    [codcrm]              VARCHAR (100) DEFAULT ('') NULL,
    [flagExport]          SMALLINT      DEFAULT ((0)) NULL,
    [CONSENSO]            VARCHAR (1)   DEFAULT ('N') NOT NULL,
    [DATACONS]            DATETIME      NULL,
    [ATTESTCONS]          VARCHAR (300) NULL,
    PRIMARY KEY CLUSTERED ([IdAmmnistratore] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ald_tblAmministratoriCondomini] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ald_tblAmministratoriCondomini] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ald_tblAmministratoriCondomini] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ald_tblAmministratoriCondomini] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ald_tblAmministratoriCondomini] TO [Metodo98]
    AS [dbo];

