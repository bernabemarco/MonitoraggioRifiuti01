CREATE TABLE [dbo].[CGCPConfigurazioneIndici] (
    [TipoCosto]      DECIMAL (5)  NOT NULL,
    [Mese]           INT          NOT NULL,
    [DesMese]        VARCHAR (20) DEFAULT ('') NULL,
    [Ambiente]       VARCHAR (3)  DEFAULT ('') NULL,
    [Periodo]        DECIMAL (5)  DEFAULT (0) NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([TipoCosto] ASC, [Mese] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPConfigurazioneIndici] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPConfigurazioneIndici] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPConfigurazioneIndici] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPConfigurazioneIndici] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPConfigurazioneIndici] TO [Metodo98]
    AS [dbo];

