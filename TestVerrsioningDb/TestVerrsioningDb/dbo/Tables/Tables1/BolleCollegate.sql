CREATE TABLE [dbo].[BolleCollegate] (
    [RIFANNOBOLLA]   SMALLINT     NOT NULL,
    [RIFNUMEROBOLLA] INT          NOT NULL,
    [ANNOBOLLA]      SMALLINT     NOT NULL,
    [NUMEROBOLLA]    INT          NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [BolleCollegate_PK] PRIMARY KEY CLUSTERED ([RIFANNOBOLLA] ASC, [RIFNUMEROBOLLA] ASC, [ANNOBOLLA] ASC, [NUMEROBOLLA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BolleCollegate] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BolleCollegate] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BolleCollegate] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BolleCollegate] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BolleCollegate] TO [Metodo98]
    AS [dbo];

