CREATE TABLE [dbo].[TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP] (
    [IdSessione]         DECIMAL (10)    NOT NULL,
    [CodArt]             VARCHAR (50)    NOT NULL,
    [CodDeposito]        VARCHAR (10)    NOT NULL,
    [CodFornitore]       VARCHAR (7)     NOT NULL,
    [CodFornitoreFatt]   VARCHAR (7)     NOT NULL,
    [Descrizione]        VARCHAR (80)    NULL,
    [Gruppo]             DECIMAL (5)     NULL,
    [Categoria]          DECIMAL (5)     NULL,
    [CodCategoriaStat]   DECIMAL (5)     NULL,
    [VarEsplicite]       VARCHAR (255)   NULL,
    [CodFamigliaPos]     DECIMAL (5)     NULL,
    [CodRepartoPos]      DECIMAL (5)     NULL,
    [CodMarchio]         VARCHAR (50)    NULL,
    [CodLivello]         VARCHAR (250)   NULL,
    [QtaProposta]        DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [QtaForzata]         DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [DepositoOrdinabile] SMALLINT        DEFAULT ((0)) NOT NULL,
    [QtaOrdinata]        DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [QtaPromozione]      DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [DataConsegna]       DATETIME        DEFAULT (CONVERT([varchar](8),getdate(),(112))) NOT NULL,
    [IsPreferenziale]    SMALLINT        DEFAULT ((0)) NOT NULL,
    [IsPrezzoMigliore]   SMALLINT        DEFAULT ((0)) NOT NULL,
    [IsLocked]           INT             DEFAULT ((0)) NOT NULL,
    [IsProposta]         SMALLINT        DEFAULT ((0)) NOT NULL,
    [UtenteModifica]     VARCHAR (25)    NOT NULL,
    [DataModifica]       DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([IdSessione] ASC, [CodArt] ASC, [CodDeposito] ASC, [CodFornitore] ASC, [CodFornitoreFatt] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP] TO [Metodo98]
    AS [dbo];

