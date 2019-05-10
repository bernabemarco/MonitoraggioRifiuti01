CREATE TABLE [dbo].[CGesWCalcoloFormule] (
    [NrTerminale] DECIMAL (5)     NOT NULL,
    [Tipo]        VARCHAR (5)     NOT NULL,
    [Voce]        VARCHAR (10)    NOT NULL,
    [Valore]      DECIMAL (19, 6) DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Tipo] ASC, [Voce] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWCalcoloFormule] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWCalcoloFormule] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWCalcoloFormule] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWCalcoloFormule] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWCalcoloFormule] TO [Metodo98]
    AS [dbo];

