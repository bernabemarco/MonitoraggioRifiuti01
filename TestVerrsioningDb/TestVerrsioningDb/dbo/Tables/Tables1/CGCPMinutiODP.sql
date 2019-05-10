CREATE TABLE [dbo].[CGCPMinutiODP] (
    [IDTesta]        DECIMAL (10)    NOT NULL,
    [IDRiga]         INT             NOT NULL,
    [Tipo]           SMALLINT        NOT NULL,
    [Anno]           DECIMAL (5)     NOT NULL,
    [Mese]           INT             NOT NULL,
    [Minuti]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([IDTesta] ASC, [IDRiga] ASC, [Tipo] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPMinutiODP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPMinutiODP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPMinutiODP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPMinutiODP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPMinutiODP] TO [Metodo98]
    AS [dbo];

