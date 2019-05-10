CREATE TABLE [dbo].[Tp_LivelliArticoli] (
    [CodLivelloInterno] VARCHAR (250) NOT NULL,
    [Codice]            VARCHAR (50)  NOT NULL,
    [UtenteModifica]    VARCHAR (25)  NOT NULL,
    [DataModifica]      DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([CodLivelloInterno] ASC, [Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Tp_LivelliArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Tp_LivelliArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Tp_LivelliArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Tp_LivelliArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Tp_LivelliArticoli] TO [Metodo98]
    AS [dbo];

