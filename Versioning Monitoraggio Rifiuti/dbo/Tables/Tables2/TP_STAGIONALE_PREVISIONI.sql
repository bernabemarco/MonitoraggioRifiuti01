CREATE TABLE [dbo].[TP_STAGIONALE_PREVISIONI] (
    [CodArticolo]    VARCHAR (50)    NOT NULL,
    [CodDeposito]    VARCHAR (10)    NOT NULL,
    [Tipo]           VARCHAR (2)     NOT NULL,
    [1]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [2]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [3]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [4]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [5]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [6]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [7]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [8]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [9]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [10]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [11]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [12]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([CodArticolo] ASC, [CodDeposito] ASC, [Tipo] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ORDINEFORNITORE_STAGPREV_1]
    ON [dbo].[TP_STAGIONALE_PREVISIONI]([Tipo] ASC)
    INCLUDE([CodArticolo], [CodDeposito]);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_STAGIONALE_PREVISIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_STAGIONALE_PREVISIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_STAGIONALE_PREVISIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_STAGIONALE_PREVISIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_STAGIONALE_PREVISIONI] TO [Metodo98]
    AS [dbo];

