CREATE TABLE [dbo].[SEC_ModuliInUso] (
    [CodModulo]   NVARCHAR (16) CONSTRAINT [DF_SEC_Moduli_CodModulo_1__10] DEFAULT ('') NOT NULL,
    [Progressivo] NVARCHAR (13) CONSTRAINT [DF_SEC_Moduli_Progressivo_2__10] DEFAULT ('') NOT NULL,
    [Utente]      NVARCHAR (25) NULL,
    CONSTRAINT [PK_SEC_ModuliInUso] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC, [Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [SEC_ModuliInUsoCodModulo]
    ON [dbo].[SEC_ModuliInUso]([CodModulo] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SEC_ModuliInUso] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SEC_ModuliInUso] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SEC_ModuliInUso] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SEC_ModuliInUso] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SEC_ModuliInUso] TO [Metodo98]
    AS [dbo];

