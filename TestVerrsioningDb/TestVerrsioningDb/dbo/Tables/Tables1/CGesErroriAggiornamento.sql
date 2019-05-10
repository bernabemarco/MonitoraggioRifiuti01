CREATE TABLE [dbo].[CGesErroriAggiornamento] (
    [Tipo]           SMALLINT      NOT NULL,
    [NumTransazione] DECIMAL (10)  NOT NULL,
    [NumErrore]      INT           DEFAULT (0) NULL,
    [DesErrore]      VARCHAR (200) DEFAULT ('') NULL,
    [Ambiente]       VARCHAR (3)   DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Tipo] ASC, [NumTransazione] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesErroriAggiornamento] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesErroriAggiornamento] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesErroriAggiornamento] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesErroriAggiornamento] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesErroriAggiornamento] TO [Metodo98]
    AS [dbo];

