CREATE TABLE [dbo].[SEC_LivelliModulo] (
    [CodModulo] NVARCHAR (16)  CONSTRAINT [DF_SEC_Livell_CodModulo_1__10] DEFAULT ('') NOT NULL,
    [SecGrup]   SMALLINT       CONSTRAINT [DF_SEC_Livell_SecGrup_2__10] DEFAULT (0) NOT NULL,
    [SecLevel]  SMALLINT       NULL,
    [DesGroup]  NVARCHAR (100) NULL,
    CONSTRAINT [PK_SEC_LivelliModulo] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC, [SecGrup] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SEC_LivelliModulo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SEC_LivelliModulo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SEC_LivelliModulo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SEC_LivelliModulo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SEC_LivelliModulo] TO [Metodo98]
    AS [dbo];

