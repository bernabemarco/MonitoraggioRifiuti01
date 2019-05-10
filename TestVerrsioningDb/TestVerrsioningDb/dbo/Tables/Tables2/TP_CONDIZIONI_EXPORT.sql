CREATE TABLE [dbo].[TP_CONDIZIONI_EXPORT] (
    [RifProgressivo]  DECIMAL (18)  NOT NULL,
    [Posizione]       INT           NOT NULL,
    [NomeCampo]       VARCHAR (50)  NULL,
    [Condizione]      VARCHAR (250) NULL,
    [Operatore]       VARCHAR (4)   NULL,
    [IndiceControllo] SMALLINT      NULL,
    [UtenteModifica]  VARCHAR (25)  NOT NULL,
    [DataModifica]    DATETIME      NOT NULL,
    CONSTRAINT [PK_TP_CONDIZIONI_EXPORT] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [Posizione] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_CONDIZIONI_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_CONDIZIONI_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_CONDIZIONI_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_CONDIZIONI_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_CONDIZIONI_EXPORT] TO [Metodo98]
    AS [dbo];

