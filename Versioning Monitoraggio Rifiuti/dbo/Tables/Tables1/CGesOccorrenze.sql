CREATE TABLE [dbo].[CGesOccorrenze] (
    [NrTerminale]     DECIMAL (5)  NOT NULL,
    [CodDestinazione] VARCHAR (10) NOT NULL,
    [Anno]            DECIMAL (5)  NOT NULL,
    [Mese]            INT          NOT NULL,
    [Occorrenze]      DECIMAL (7)  DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [CodDestinazione] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesOccorrenze] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesOccorrenze] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesOccorrenze] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesOccorrenze] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesOccorrenze] TO [Metodo98]
    AS [dbo];

