CREATE TABLE [dbo].[CGCPReseCentri] (
    [CodDestinazione] VARCHAR (10)    NOT NULL,
    [Anno]            DECIMAL (5)     NOT NULL,
    [Mese]            INT             NOT NULL,
    [Valore]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [Valore2]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Valore3]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Valore4]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Valore5]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Note]            VARCHAR (100)   DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25)    NOT NULL,
    [DataModifica]    DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([CodDestinazione] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPReseCentri] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPReseCentri] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPReseCentri] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPReseCentri] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPReseCentri] TO [Metodo98]
    AS [dbo];

