CREATE TABLE [dbo].[TP_AgendaFornitore] (
    [CodiceUtente]   VARCHAR (25)  NOT NULL,
    [CodiceEvento]   NUMERIC (10)  NOT NULL,
    [Descrizione]    VARCHAR (80)  NOT NULL,
    [Filtro]         SMALLINT      DEFAULT ((0)) NOT NULL,
    [IdLink]         NUMERIC (10)  NOT NULL,
    [InizioEvento]   DATETIME      NOT NULL,
    [FineEvento]     DATETIME      NOT NULL,
    [Note]           VARCHAR (250) NOT NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([CodiceUtente] ASC, [CodiceEvento] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_AgendaFornitore] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_AgendaFornitore] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_AgendaFornitore] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_AgendaFornitore] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_AgendaFornitore] TO [Metodo98]
    AS [dbo];

