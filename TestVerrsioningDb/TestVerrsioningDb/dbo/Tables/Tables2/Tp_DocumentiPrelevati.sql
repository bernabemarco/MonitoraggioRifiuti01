CREATE TABLE [dbo].[Tp_DocumentiPrelevati] (
    [Progressivo]    DECIMAL (10)    NOT NULL,
    [IdRiga]         INT             NOT NULL,
    [IdSessione]     INT             NULL,
    [CodArt]         VARCHAR (50)    NOT NULL,
    [QtaPRP]         DECIMAL (16, 6) NULL,
    [UmPRP]          VARCHAR (3)     NULL,
    [DepositoPRP]    VARCHAR (10)    NULL,
    [QtaORD]         DECIMAL (16, 6) NULL,
    [UmORD]          VARCHAR (3)     NULL,
    [DepositoORD]    VARCHAR (10)    NULL,
    [Stato]          SMALLINT        NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC, [IdRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Tp_DocumentiPrelevati] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Tp_DocumentiPrelevati] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Tp_DocumentiPrelevati] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Tp_DocumentiPrelevati] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Tp_DocumentiPrelevati] TO [Metodo98]
    AS [dbo];

