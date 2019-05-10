CREATE TABLE [dbo].[CGesWCodiceRiclassificazione] (
    [Riclassificazione] VARCHAR (5) NOT NULL,
    PRIMARY KEY CLUSTERED ([Riclassificazione] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWCodiceRiclassificazione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWCodiceRiclassificazione] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWCodiceRiclassificazione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWCodiceRiclassificazione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWCodiceRiclassificazione] TO [Metodo98]
    AS [dbo];

