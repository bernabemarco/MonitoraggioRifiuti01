CREATE TABLE [dbo].[ALd_TabValoriDefaultAnagCli] (
    [Codice]         INT           NOT NULL,
    [PORTO]          DECIMAL (5)   NULL,
    [TRASPACURA]     DECIMAL (5)   NULL,
    [CODLISTINO]     DECIMAL (5)   NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   SMALLDATETIME NOT NULL,
    CONSTRAINT [PK_ALd_TabValoriDefaultAnagCli] PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALd_TabValoriDefaultAnagCli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALd_TabValoriDefaultAnagCli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALd_TabValoriDefaultAnagCli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALd_TabValoriDefaultAnagCli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALd_TabValoriDefaultAnagCli] TO [Metodo98]
    AS [dbo];

