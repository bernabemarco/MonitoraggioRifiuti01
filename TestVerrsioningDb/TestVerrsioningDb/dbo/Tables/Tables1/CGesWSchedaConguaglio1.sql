CREATE TABLE [dbo].[CGesWSchedaConguaglio1] (
    [NrTerminale]      DECIMAL (5)     NOT NULL,
    [ContoConguaglio]  VARCHAR (3)     NOT NULL,
    [CodContoRaccordo] VARCHAR (30)    NOT NULL,
    [DesConto]         VARCHAR (80)    DEFAULT ('') NULL,
    [ValoreVariabile]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreFisso]      DECIMAL (19, 6) DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [ContoConguaglio] ASC, [CodContoRaccordo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWSchedaConguaglio1] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWSchedaConguaglio1] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWSchedaConguaglio1] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWSchedaConguaglio1] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWSchedaConguaglio1] TO [Metodo98]
    AS [dbo];

