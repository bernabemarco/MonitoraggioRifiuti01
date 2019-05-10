CREATE TABLE [dbo].[TP_CONFRONTOARTICOLI_TEMP] (
    [IdSessione]          DECIMAL (10)    NOT NULL,
    [Grafico]             SMALLINT        NOT NULL,
    [CodArticolo]         VARCHAR (50)    NOT NULL,
    [Descrizione]         VARCHAR (80)    NOT NULL,
    [Gruppo]              DECIMAL (5)     DEFAULT ((0)) NOT NULL,
    [Categoria]           DECIMAL (5)     DEFAULT ((0)) NOT NULL,
    [CodCategoriaStat]    DECIMAL (5)     DEFAULT ((0)) NOT NULL,
    [CodFamigliaPos]      DECIMAL (5)     DEFAULT ((0)) NOT NULL,
    [CodRepartoPos]       DECIMAL (5)     DEFAULT ((0)) NOT NULL,
    [GruppoPrzPart]       DECIMAL (5)     DEFAULT ((0)) NOT NULL,
    [LivelloMerceologico] VARCHAR (10)    DEFAULT ('') NOT NULL,
    [Tipo]                SMALLINT        DEFAULT ((0)) NOT NULL,
    [UtenteModifica]      VARCHAR (25)    NOT NULL,
    [DataModifica]        DATETIME        NOT NULL,
    [Giacenza]            DECIMAL (19, 6) DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([IdSessione] ASC, [CodArticolo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_CONFRONTOARTICOLI_TEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_CONFRONTOARTICOLI_TEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_CONFRONTOARTICOLI_TEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_CONFRONTOARTICOLI_TEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_CONFRONTOARTICOLI_TEMP] TO [Metodo98]
    AS [dbo];

