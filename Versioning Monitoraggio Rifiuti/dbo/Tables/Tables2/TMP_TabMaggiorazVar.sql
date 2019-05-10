CREATE TABLE [dbo].[TMP_TabMaggiorazVar] (
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
    [CTRLESISTENZA]  INT             NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([ARTICOLO] ASC, [IDRIGA] ASC, [MAGGNORMAL] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMP_TabMaggiorazVar] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMP_TabMaggiorazVar] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TMP_TabMaggiorazVar] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMP_TabMaggiorazVar] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMP_TabMaggiorazVar] TO [Metodo98]
    AS [dbo];

