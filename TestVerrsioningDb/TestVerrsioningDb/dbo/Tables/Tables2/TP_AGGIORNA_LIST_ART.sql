CREATE TABLE [dbo].[TP_AGGIORNA_LIST_ART] (
    [CodArt]         VARCHAR (50)    NOT NULL,
    [NrListino]      DECIMAL (5)     NOT NULL,
    [UM]             VARCHAR (10)    NOT NULL,
    [DataAgg]        DATETIME        NOT NULL,
    [PrezzoLire]     NUMERIC (19, 6) NOT NULL,
    [PrezzoEuro]     NUMERIC (19, 6) NOT NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NULL,
    [CODIVA]         DECIMAL (5)     NULL,
    [Gruppo]         DECIMAL (5)     NULL,
    [Categoria]      DECIMAL (5)     NULL,
    [CategStat]      DECIMAL (5)     NULL,
    [Sconto]         VARCHAR (20)    NULL,
    [Scorporo]       SMALLINT        NULL,
    CONSTRAINT [PK_TP_AGGIORNA_LIST_ART] PRIMARY KEY CLUSTERED ([CodArt] ASC, [NrListino] ASC, [UM] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_AGGIORNA_LIST_ART] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_AGGIORNA_LIST_ART] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_AGGIORNA_LIST_ART] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_AGGIORNA_LIST_ART] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_AGGIORNA_LIST_ART] TO [Metodo98]
    AS [dbo];

