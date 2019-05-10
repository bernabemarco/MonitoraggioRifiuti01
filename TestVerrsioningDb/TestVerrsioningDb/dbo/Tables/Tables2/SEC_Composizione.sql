CREATE TABLE [dbo].[SEC_Composizione] (
    [CodUtente] NVARCHAR (25) CONSTRAINT [DF_SEC_Compos_CodUtente_2__10] DEFAULT ('') NOT NULL,
    [CodGruppo] NVARCHAR (5)  CONSTRAINT [DF_SEC_Compos_CodGruppo_1__10] DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_SEC_Composizione] PRIMARY KEY NONCLUSTERED ([CodUtente] ASC, [CodGruppo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SEC_Composizione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SEC_Composizione] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SEC_Composizione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SEC_Composizione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SEC_Composizione] TO [Metodo98]
    AS [dbo];

