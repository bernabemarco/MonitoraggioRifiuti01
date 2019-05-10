CREATE TABLE [dbo].[CGCPMinutiArticolo] (
    [Articolo]       VARCHAR (50)    NOT NULL,
    [Anno]           DECIMAL (5)     NOT NULL,
    [Mese]           INT             NOT NULL,
    [Minuti]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Articolo] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPMinutiArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPMinutiArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPMinutiArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPMinutiArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPMinutiArticolo] TO [Metodo98]
    AS [dbo];

