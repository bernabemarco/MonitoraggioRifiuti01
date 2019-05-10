CREATE TABLE [dbo].[CGesWControlloRegRicl] (
    [NrTerminale]    DECIMAL (5)  NOT NULL,
    [TipoRicl]       VARCHAR (5)  NOT NULL,
    [ProgressivoReg] DECIMAL (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [TipoRicl] ASC, [ProgressivoReg] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWControlloRegRicl] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWControlloRegRicl] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWControlloRegRicl] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWControlloRegRicl] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWControlloRegRicl] TO [Metodo98]
    AS [dbo];

