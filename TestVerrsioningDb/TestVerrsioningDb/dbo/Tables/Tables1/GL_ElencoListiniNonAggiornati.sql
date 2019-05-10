CREATE TABLE [dbo].[GL_ElencoListiniNonAggiornati] (
    [IDSESSIONE]     DECIMAL (5)     NOT NULL,
    [CODART]         VARCHAR (50)    NOT NULL,
    [NRLISTINO]      DECIMAL (5)     NOT NULL,
    [UM]             VARCHAR (3)     NOT NULL,
    [DataVal]        DATETIME        NOT NULL,
    [DataVal_New]    DATETIME        NOT NULL,
    [TP_Tipo]        CHAR (1)        DEFAULT ('') NULL,
    [CodConto]       VARCHAR (7)     DEFAULT ('') NULL,
    [PREZZO]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [PREZZOEURO]     DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [AGGIORNATO]     SMALLINT        DEFAULT ((0)) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [PK_GL_ElencoListiniNonAggiornati] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [CODART] ASC, [NRLISTINO] ASC, [UM] ASC, [DataVal] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GL_ElencoListiniNonAggiornati] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GL_ElencoListiniNonAggiornati] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GL_ElencoListiniNonAggiornati] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GL_ElencoListiniNonAggiornati] TO [Metodo98]
    AS [dbo];

