CREATE TABLE [dbo].[CGesWControlloRiclassificazioni] (
    [NrTerminale]      DECIMAL (5)     NOT NULL,
    [CodConto]         VARCHAR (20)    NOT NULL,
    [DescrizioneConto] VARCHAR (80)    DEFAULT ('') NULL,
    [Importo]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [CodDestinazione]  VARCHAR (10)    DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [CodConto] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWControlloRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWControlloRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWControlloRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWControlloRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWControlloRiclassificazioni] TO [Metodo98]
    AS [dbo];

