CREATE TABLE [dbo].[PARAMETRIPACKINGLIST] (
    [Contatore]            DECIMAL (5)   NOT NULL,
    [NrColliPartenze]      SMALLINT      NULL,
    [ModuloStampa]         VARCHAR (50)  NULL,
    [DeviceStampa]         VARCHAR (255) NULL,
    [NrCopie]              SMALLINT      NULL,
    [ModuloStampaEtic]     VARCHAR (50)  NULL,
    [DeviceStampaEtic]     VARCHAR (255) NULL,
    [TipoStampaEtic]       SMALLINT      NULL,
    [UtenteModifica]       VARCHAR (25)  NOT NULL,
    [DataModifica]         DATETIME      NOT NULL,
    [TipoUmGest]           DECIMAL (5)   NULL,
    [DscSuGiu]             CHAR (1)      NULL,
    [TpQtaPrel]            SMALLINT      CONSTRAINT [DF_PARAMETRIPACKINGLIST_TpQtaPrel] DEFAULT (0) NOT NULL,
    [NONACCORPAART]        SMALLINT      DEFAULT (0) NULL,
    [TIPO_PRELIEVO]        SMALLINT      DEFAULT ((0)) NULL,
    [VERIFICADBA]          SMALLINT      DEFAULT ((0)) NULL,
    [MODELLOPACKINGLIST]   SMALLINT      DEFAULT ((0)) NULL,
    [MODCALCOLOCOLLIPIEDE] SMALLINT      DEFAULT ((0)) NULL,
    [MODCALCOLOPESOART]    SMALLINT      DEFAULT ((0)) NULL,
    [ModuloStampaArt]      VARCHAR (50)  DEFAULT ('') NULL,
    [DeviceStampaArt]      VARCHAR (255) DEFAULT ('') NULL,
    [NrCopieArt]           SMALLINT      DEFAULT ((0)) NULL,
    [TIPODOCEMISS]         VARCHAR (3)   DEFAULT ('') NULL,
    [TIPOPRELDOC]          SMALLINT      DEFAULT ((0)) NULL,
    [RifDocInRighe]        CHAR (1)      DEFAULT ('N') NULL,
    [PROGRESSIVO]          DECIMAL (10)  NOT NULL,
    CONSTRAINT [PK_PARAMETRIPACKINGLIST] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PARAMETRIPACKINGLIST] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PARAMETRIPACKINGLIST] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PARAMETRIPACKINGLIST] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PARAMETRIPACKINGLIST] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PARAMETRIPACKINGLIST] TO [Metodo98]
    AS [dbo];

