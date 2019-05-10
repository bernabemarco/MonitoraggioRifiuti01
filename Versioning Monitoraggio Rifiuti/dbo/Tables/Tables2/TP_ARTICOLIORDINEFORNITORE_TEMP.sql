CREATE TABLE [dbo].[TP_ARTICOLIORDINEFORNITORE_TEMP] (
    [IdSessione]     DECIMAL (10)    NOT NULL,
    [CodArt]         VARCHAR (50)    NOT NULL,
    [DescArticolo]   VARCHAR (80)    NOT NULL,
    [QtaOrdinata]    DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [Previsione]     DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [Annulla]        SMALLINT        DEFAULT ((0)) NOT NULL,
    [Nuovo]          SMALLINT        DEFAULT ((0)) NOT NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([IdSessione] ASC, [CodArt] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ARTICOLIORDINEFORNITORE_TEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ARTICOLIORDINEFORNITORE_TEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ARTICOLIORDINEFORNITORE_TEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ARTICOLIORDINEFORNITORE_TEMP] TO [Metodo98]
    AS [dbo];

