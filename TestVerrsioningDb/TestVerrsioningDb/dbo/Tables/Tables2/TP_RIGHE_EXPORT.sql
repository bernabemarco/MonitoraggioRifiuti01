CREATE TABLE [dbo].[TP_RIGHE_EXPORT] (
    [RifProgressivo]  DECIMAL (18)  NOT NULL,
    [NrRiga]          INT           NOT NULL,
    [FlagRiga]        SMALLINT      NOT NULL,
    [Posizione]       INT           NOT NULL,
    [DSCRiga]         VARCHAR (250) NOT NULL,
    [Alias]           VARCHAR (250) NULL,
    [DSCTipo]         VARCHAR (50)  NULL,
    [Dimensione]      VARCHAR (4)   NULL,
    [DSCDelimitatore] CHAR (1)      NULL,
    [Riempimento]     CHAR (1)      NULL,
    [SDecimale]       CHAR (1)      NULL,
    [NDecimale]       INT           NULL,
    [DaOss]           CHAR (1)      NULL,
    [UtenteModifica]  VARCHAR (25)  NOT NULL,
    [DataModifica]    DATETIME      NOT NULL,
    CONSTRAINT [PK_TP_RIGHE_EXPORT] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [NrRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_RIGHE_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_RIGHE_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_RIGHE_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_RIGHE_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_RIGHE_EXPORT] TO [Metodo98]
    AS [dbo];

