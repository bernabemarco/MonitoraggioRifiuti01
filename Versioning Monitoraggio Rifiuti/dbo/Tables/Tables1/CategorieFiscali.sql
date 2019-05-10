CREATE TABLE [dbo].[CategorieFiscali] (
    [Codice]          DECIMAL (5)    NOT NULL,
    [Descrizione]     VARCHAR (80)   NULL,
    [TipoBene]        DECIMAL (5)    DEFAULT (0) NULL,
    [FlgAmmDir]       SMALLINT       DEFAULT (0) NULL,
    [FlgAmmBIM]       SMALLINT       DEFAULT (0) NULL,
    [GenImmobi]       VARCHAR (7)    NULL,
    [GenAmmOrd]       VARCHAR (7)    NULL,
    [GenAmmAnt]       VARCHAR (7)    NULL,
    [GenFdoOrd]       VARCHAR (7)    NULL,
    [GenFdoAnt]       VARCHAR (7)    NULL,
    [GenQteNon]       VARCHAR (7)    NULL,
    [UTENTEMODIFICA]  VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]    DATETIME       NOT NULL,
    [DtaInizioAmm]    DATETIME       NULL,
    [DtaFineAmm]      DATETIME       NULL,
    [FlagPrimoAnno]   SMALLINT       DEFAULT ((1)) NOT NULL,
    [PERAMM_TIPO1]    DECIMAL (8, 5) NULL,
    [PERAMM_TIPO2]    DECIMAL (8, 5) NULL,
    [PERAMM_TIPO3]    DECIMAL (8, 5) NULL,
    [DURATAAMM_TIPO1] SMALLINT       NULL,
    [DURATAAMM_TIPO2] SMALLINT       NULL,
    [DURATAAMM_TIPO3] SMALLINT       NULL,
    [CODGEN_ATI]      VARCHAR (7)    NULL,
    [GENAMM_ATI]      VARCHAR (7)    NULL,
    [GENFDO_ATI]      VARCHAR (7)    NULL,
    [PRCSUPERAMM]     DECIMAL (8, 5) NULL,
    [PRCIPERAMM]      DECIMAL (8, 5) NULL,
    CONSTRAINT [CategorieFiscali_PK] PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FlgAmmBIMCat_Check] CHECK ([FlgAmmBIM] = 1 or [FlgAmmBIM] = 0),
    CONSTRAINT [FlgAmmDirCat_Check] CHECK ([FlgAmmDir] = 1 or [FlgAmmDir] = 0),
    CONSTRAINT [FK_CATEGORIEFISCALI_TIPOBENE] FOREIGN KEY ([TipoBene]) REFERENCES [dbo].[TabTipiBene] ([Codice])
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CategorieFiscali] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CategorieFiscali] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CategorieFiscali] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CategorieFiscali] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CategorieFiscali] TO [Metodo98]
    AS [dbo];

