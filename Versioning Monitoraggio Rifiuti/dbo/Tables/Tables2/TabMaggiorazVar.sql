CREATE TABLE [dbo].[TabMaggiorazVar] (
    [ARTICOLO]       VARCHAR (50)    NOT NULL,
    [IDRIGA]         INT             NOT NULL,
    [MAGGNORMAL]     INT             NOT NULL,
    [NRLISTINO]      DECIMAL (5)     NOT NULL,
    [TIPOLOGIA]      VARCHAR (25)    NOT NULL,
    [SEGNO]          VARCHAR (2)     NOT NULL,
    [VARIANTE1]      VARCHAR (25)    NOT NULL,
    [VARIANTE2]      VARCHAR (25)    NULL,
    [PERC]           NUMERIC (19, 6) NULL,
    [PREZZO]         NUMERIC (19, 6) NULL,
    [CTRLESISTENZA]  INT             DEFAULT (1) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [PK_TabMaggiorazvar] PRIMARY KEY CLUSTERED ([ARTICOLO] ASC, [IDRIGA] ASC, [MAGGNORMAL] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CHK_ESISTENZA] CHECK ([CtrlEsistenza] = 1 or [CtrlEsistenza] = 0)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [TabMaggiorazvar_IndUnique]
    ON [dbo].[TabMaggiorazVar]([NRLISTINO] ASC, [ARTICOLO] ASC, [SEGNO] ASC, [TIPOLOGIA] ASC, [VARIANTE1] ASC, [VARIANTE2] ASC, [MAGGNORMAL] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabMaggiorazVar] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabMaggiorazVar] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabMaggiorazVar] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabMaggiorazVar] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabMaggiorazVar] TO [Metodo98]
    AS [dbo];

