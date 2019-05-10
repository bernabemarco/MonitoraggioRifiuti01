CREATE TABLE [dbo].[CGesWSchedaConguaglio] (
    [NrTerminale]        DECIMAL (5)     NOT NULL,
    [ContoConguaglio]    VARCHAR (3)     NOT NULL,
    [CodContoRaccordo]   VARCHAR (30)    NOT NULL,
    [TipoRiga]           SMALLINT        NOT NULL,
    [DesContoConguaglio] VARCHAR (80)    DEFAULT ('') NULL,
    [DesConto]           VARCHAR (80)    DEFAULT ('') NULL,
    [ValoreVariabile]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreFisso]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreTotale]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [Ambiente]           VARCHAR (3)     DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [ContoConguaglio] ASC, [CodContoRaccordo] ASC, [TipoRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWSchedaConguaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWSchedaConguaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWSchedaConguaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWSchedaConguaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWSchedaConguaglio] TO [Metodo98]
    AS [dbo];

