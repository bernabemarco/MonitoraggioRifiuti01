CREATE TABLE [dbo].[TMPPRELPL] (
    [IdSessione] DECIMAL (5)  NOT NULL,
    [IdTesta]    DECIMAL (18) NOT NULL,
    [IdRiga]     NUMERIC (4)  NOT NULL,
    CONSTRAINT [PK_TMPPRELPL] PRIMARY KEY CLUSTERED ([IdSessione] ASC, [IdTesta] ASC, [IdRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMPPRELPL] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMPPRELPL] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TMPPRELPL] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMPPRELPL] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMPPRELPL] TO [Metodo98]
    AS [dbo];

