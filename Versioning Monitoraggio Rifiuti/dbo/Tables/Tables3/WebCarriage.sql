CREATE TABLE [dbo].[WebCarriage] (
    [PROGRESSIVO] DECIMAL (10)    IDENTITY (1, 1) NOT NULL,
    [UTENTE]      VARCHAR (25)    NOT NULL,
    [NRTERMINALE] DECIMAL (5)     NOT NULL,
    [TimeStamp]   ROWVERSION      NOT NULL,
    [ARTICOLO]    VARCHAR (80)    NOT NULL,
    [QTA]         DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[WebCarriage] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[WebCarriage] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[WebCarriage] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[WebCarriage] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[WebCarriage] TO [Metodo98]
    AS [dbo];

