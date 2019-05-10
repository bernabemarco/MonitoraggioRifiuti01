CREATE TABLE [dbo].[SYS_Config] (
    [Chiave] NVARCHAR (32)  CONSTRAINT [DF_SYS_Config_Chiave_1__10] DEFAULT ('') NOT NULL,
    [Valore] NVARCHAR (255) NULL,
    CONSTRAINT [PK_SYS_Config] PRIMARY KEY NONCLUSTERED ([Chiave] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SYS_Config] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SYS_Config] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SYS_Config] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SYS_Config] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SYS_Config] TO [Metodo98]
    AS [dbo];

