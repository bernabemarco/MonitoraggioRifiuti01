CREATE TABLE [dbo].[CGesWDifferenzeConto] (
    [NrTerminale]     DECIMAL (5)     NOT NULL,
    [CodConto]        VARCHAR (20)    NOT NULL,
    [CodDestinazione] VARCHAR (10)    NOT NULL,
    [DesConto]        VARCHAR (80)    DEFAULT ('') NULL,
    [DesDestinazione] VARCHAR (80)    DEFAULT ('') NULL,
    [Stanziamenti]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreCoge]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Differenza]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Ambiente]        VARCHAR (3)     DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [CodConto] ASC, [CodDestinazione] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWDifferenzeConto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWDifferenzeConto] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWDifferenzeConto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWDifferenzeConto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWDifferenzeConto] TO [Metodo98]
    AS [dbo];

