CREATE TABLE [dbo].[GstMag_LogisticaArticoliTeste] (
    [CODART]                     VARCHAR (50)    NOT NULL,
    [ArtQtaNonConf]              SMALLINT        NULL,
    [GestPrelQtaNonConf]         SMALLINT        NULL,
    [FLGRabbocco]                SMALLINT        DEFAULT (0) NULL,
    [UMLOG]                      VARCHAR (3)     DEFAULT ('') NULL,
    [Altezza]                    DECIMAL (16, 6) DEFAULT (0) NULL,
    [Larghezza]                  DECIMAL (16, 6) DEFAULT (0) NULL,
    [Profondita]                 DECIMAL (16, 6) DEFAULT (0) NULL,
    [Tolleranza]                 DECIMAL (16, 6) DEFAULT (0) NULL,
    [AccettaSovrapposizioni]     SMALLINT        DEFAULT (0) NULL,
    [InputQtaDaPrel]             SMALLINT        DEFAULT (0) NULL,
    [DefaultQtaDaPrel]           SMALLINT        DEFAULT (1) NULL,
    [LETTURAOBBLIGATORIABARCODE] SMALLINT        DEFAULT (0) NULL,
    [DepositoStoccMov]           VARCHAR (10)    NULL,
    [DepositoStoccScarti]        VARCHAR (10)    NULL,
    [DepositoStoccQuality]       VARCHAR (10)    NULL,
    [ZonaStoccMov]               VARCHAR (2)     NULL,
    [ZonaStoccScarti]            VARCHAR (2)     NULL,
    [ZonaStoccQuality]           VARCHAR (2)     NULL,
    [AreaStoccMov]               VARCHAR (2)     NULL,
    [AreaStoccScarti]            VARCHAR (2)     NULL,
    [AreaStoccQuality]           VARCHAR (2)     NULL,
    [GestionePedaneDis]          SMALLINT        DEFAULT (0) NULL,
    [UtenteModifica]             VARCHAR (25)    NOT NULL,
    [DataModifica]               DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([CODART] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GstMag_LogisticaArticoliTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GstMag_LogisticaArticoliTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GstMag_LogisticaArticoliTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GstMag_LogisticaArticoliTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GstMag_LogisticaArticoliTeste] TO [Metodo98]
    AS [dbo];

