CREATE TABLE [dbo].[WebCarriageActions] (
    [PROGRESSIVO] DECIMAL (10) IDENTITY (1, 1) NOT NULL,
    [UTENTE]      VARCHAR (25) NOT NULL,
    [NRTERMINALE] DECIMAL (5)  NOT NULL,
    [TimeStamp]   ROWVERSION   NOT NULL,
    [ACTIONCODE]  INT          DEFAULT ((0)) NOT NULL,
    [CLIENTE]     VARCHAR (7)  NULL,
    [TIPODOC]     VARCHAR (3)  NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[WebCarriageActions] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[WebCarriageActions] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[WebCarriageActions] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[WebCarriageActions] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[WebCarriageActions] TO [Metodo98]
    AS [dbo];

