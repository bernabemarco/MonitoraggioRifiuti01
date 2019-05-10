CREATE TABLE [dbo].[TP_RIGHE_EXPORTDOC] (
    [RifProgressivo]  DECIMAL (18)  NOT NULL,
    [NrRiga]          INT           NOT NULL,
    [FlagRiga]        SMALLINT      NOT NULL,
    [Posizione]       INT           NOT NULL,
    [CharID]          VARCHAR (3)   NOT NULL,
    [AliasID]         VARCHAR (1)   NULL,
    [Testa]           CHAR (1)      NULL,
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
    [REMOVESPACES]    SMALLINT      DEFAULT ((0)) NULL,
    [RifRiga]         SMALLINT      DEFAULT ((0)) NOT NULL,
    [HDRifTable]      VARCHAR (100) DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_TP_RIGHE_EXPORTDOC] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [NrRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_RIGHE_EXPORTDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_RIGHE_EXPORTDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_RIGHE_EXPORTDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_RIGHE_EXPORTDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_RIGHE_EXPORTDOC] TO [Metodo98]
    AS [dbo];

