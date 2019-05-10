CREATE TABLE [dbo].[tmpdocctr] (
    [progressivodoc] DECIMAL (10) NOT NULL,
    [progressivoctr] DECIMAL (10) NOT NULL,
    [sessione]       DECIMAL (5)  NOT NULL,
    [elabora]        SMALLINT     DEFAULT (0) NOT NULL,
    [assegna]        SMALLINT     DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([progressivodoc] ASC, [progressivoctr] ASC, [sessione] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpdocctr] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpdocctr] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tmpdocctr] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpdocctr] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpdocctr] TO [Metodo98]
    AS [dbo];

