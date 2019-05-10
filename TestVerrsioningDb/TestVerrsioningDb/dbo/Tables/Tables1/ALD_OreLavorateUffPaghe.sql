CREATE TABLE [dbo].[ALD_OreLavorateUffPaghe] (
    [IdRespCid]        VARCHAR (8)     NOT NULL,
    [Esercizio]        SMALLINT        NOT NULL,
    [Mese]             SMALLINT        NOT NULL,
    [OreLavorate]      DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [OreStraordinarie] DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [UtenteModifica]   VARCHAR (25)    NOT NULL,
    [DataModifica]     DATETIME        NOT NULL,
    CONSTRAINT [PK_ALD_OreLavorateUffPaghe] PRIMARY KEY CLUSTERED ([IdRespCid] ASC, [Esercizio] ASC, [Mese] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_OreLavorateUffPaghe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_OreLavorateUffPaghe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_OreLavorateUffPaghe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_OreLavorateUffPaghe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_OreLavorateUffPaghe] TO [Metodo98]
    AS [dbo];

