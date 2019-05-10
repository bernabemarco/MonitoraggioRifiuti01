CREATE TABLE [dbo].[CGCPAssorbimentoCostDriver] (
    [Articolo]       VARCHAR (50)    NOT NULL,
    [UM]             VARCHAR (5)     NOT NULL,
    [Anno]           DECIMAL (5)     NOT NULL,
    [Mese]           INT             NOT NULL,
    [Operazione]     SMALLINT        DEFAULT (0) NULL,
    [Valore]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Articolo] ASC, [UM] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPAssorbimentoCostDriver] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPAssorbimentoCostDriver] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPAssorbimentoCostDriver] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPAssorbimentoCostDriver] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPAssorbimentoCostDriver] TO [Metodo98]
    AS [dbo];

