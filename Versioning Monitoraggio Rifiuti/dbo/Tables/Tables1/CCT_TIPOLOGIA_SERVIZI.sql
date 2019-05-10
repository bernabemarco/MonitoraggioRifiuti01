CREATE TABLE [dbo].[CCT_TIPOLOGIA_SERVIZI] (
    [Codice]                  DECIMAL (5)   NOT NULL,
    [Descrizione]             VARCHAR (500) NULL,
    [CliFor]                  CHAR (1)      NOT NULL,
    [VisualizzaParametri]     SMALLINT      NOT NULL,
    [SchemaValoriAddizionali] VARCHAR (MAX) NULL,
    [DataOra1Value]           VARCHAR (25)  NULL,
    [DataOra1Name]            VARCHAR (50)  NULL,
    [DataOra2Value]           VARCHAR (25)  NULL,
    [DataOra2Name]            VARCHAR (50)  NULL,
    [DataOra3Value]           VARCHAR (25)  NULL,
    [DataOra3Name]            VARCHAR (50)  NULL,
    [Testo1Value]             VARCHAR (25)  NULL,
    [Testo1Name]              VARCHAR (50)  NULL,
    [Testo2Value]             VARCHAR (25)  NULL,
    [Testo2Name]              VARCHAR (50)  NULL,
    [Testo3Value]             VARCHAR (25)  NULL,
    [Testo3Name]              VARCHAR (50)  NULL,
    [Intero1Value]            VARCHAR (25)  NULL,
    [Intero1Name]             VARCHAR (50)  NULL,
    [Intero2Value]            VARCHAR (25)  NULL,
    [Intero2Name]             VARCHAR (50)  NULL,
    [Intero3Value]            VARCHAR (25)  NULL,
    [Intero3Name]             VARCHAR (50)  NULL,
    [Decimale1Value]          VARCHAR (25)  NULL,
    [Decimale1Name]           VARCHAR (50)  NULL,
    [Decimale2Value]          VARCHAR (25)  NULL,
    [Decimale2Name]           VARCHAR (50)  NULL,
    [Decimale3Value]          VARCHAR (25)  NULL,
    [Decimale3Name]           VARCHAR (50)  NULL,
    [Utentemodifica]          VARCHAR (25)  NOT NULL,
    [Datamodifica]            DATETIME      NOT NULL,
    CONSTRAINT [PK_CCT_TIPOLOGIA_SERVIZI] PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CCT_TIPOLOGIA_SERVIZI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CCT_TIPOLOGIA_SERVIZI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CCT_TIPOLOGIA_SERVIZI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CCT_TIPOLOGIA_SERVIZI] TO [Metodo98]
    AS [dbo];

