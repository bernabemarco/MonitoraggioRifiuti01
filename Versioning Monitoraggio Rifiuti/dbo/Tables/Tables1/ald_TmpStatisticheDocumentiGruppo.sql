CREATE TABLE [dbo].[ald_TmpStatisticheDocumentiGruppo] (
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [CodCliente]     VARCHAR (7)     NOT NULL,
    [TipoPar]        VARCHAR (1)     NOT NULL,
    [TotaleDoc]      DECIMAL (19, 4) CONSTRAINT [DF_ald_TmpStatisticheDocumentiGruppo_TotaleDoc] DEFAULT (0) NULL,
    CONSTRAINT [PK_ald_TmpStatisticheDocumentiGruppo] PRIMARY KEY CLUSTERED ([UtenteModifica] ASC, [CodCliente] ASC, [TipoPar] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ald_TmpStatisticheDocumentiGruppo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ald_TmpStatisticheDocumentiGruppo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ald_TmpStatisticheDocumentiGruppo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ald_TmpStatisticheDocumentiGruppo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ald_TmpStatisticheDocumentiGruppo] TO [Metodo98]
    AS [dbo];

