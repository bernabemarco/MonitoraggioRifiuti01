CREATE TABLE [dbo].[CGesWControlloReversioniSor] (
    [NrTerminale]     DECIMAL (5)     NOT NULL,
    [CodDestinazione] VARCHAR (10)    NOT NULL,
    [ValoreVariabile] DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreFisso]     DECIMAL (19, 6) DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [CodDestinazione] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWControlloReversioniSor] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWControlloReversioniSor] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWControlloReversioniSor] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWControlloReversioniSor] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWControlloReversioniSor] TO [Metodo98]
    AS [dbo];

