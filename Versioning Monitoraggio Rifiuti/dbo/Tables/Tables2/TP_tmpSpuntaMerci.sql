CREATE TABLE [dbo].[TP_tmpSpuntaMerci] (
    [Utente]     VARCHAR (25) NULL,
    [Ordine]     VARCHAR (15) NULL,
    [Articolo]   VARCHAR (50) NULL,
    [Lotto]      VARCHAR (15) NULL,
    [QtaSparata] DECIMAL (18) NULL,
    [Deposito]   VARCHAR (10) NULL,
    [Matricola]  VARCHAR (50) NULL,
    [Passato]    CHAR (1)     NULL,
    [IdRiga]     NUMERIC (18) NULL,
    [Esercizio]  DECIMAL (5)  NULL,
    CONSTRAINT [IX_TP_tmpSpuntaMerci] UNIQUE NONCLUSTERED ([Ordine] ASC, [IdRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [IX_TP_tmpSpuntaMerci_1]
    ON [dbo].[TP_tmpSpuntaMerci]([Ordine] ASC, [Articolo] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_tmpSpuntaMerci] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_tmpSpuntaMerci] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_tmpSpuntaMerci] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_tmpSpuntaMerci] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_tmpSpuntaMerci] TO [Metodo98]
    AS [dbo];

