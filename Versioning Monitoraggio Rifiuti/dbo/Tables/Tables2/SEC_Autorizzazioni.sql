CREATE TABLE [dbo].[SEC_Autorizzazioni] (
    [CodModulo] NVARCHAR (16) CONSTRAINT [DF_SEC_Autori_CodModulo_2__10] DEFAULT ('') NOT NULL,
    [SecGrup]   SMALLINT      CONSTRAINT [DF_SEC_Autori_SecGrup_3__10] DEFAULT (0) NOT NULL,
    [CodGruppo] NVARCHAR (5)  CONSTRAINT [DF_SEC_Autori_CodGruppo_1__10] DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_SEC_Autorizzazioni] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC, [SecGrup] ASC, [CodGruppo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SEC_Autorizzazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SEC_Autorizzazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SEC_Autorizzazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SEC_Autorizzazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SEC_Autorizzazioni] TO [Metodo98]
    AS [dbo];

