CREATE TABLE [dbo].[SEC_Gruppi] (
    [CodGruppo] NVARCHAR (5)   CONSTRAINT [DF_SEC_Gruppi_CodGruppo_1__10] DEFAULT ('') NOT NULL,
    [DesGruppo] NVARCHAR (50)  NULL,
    [EMAIL]     NVARCHAR (100) NULL,
    [NOTE]      NTEXT          NULL,
    [CAMPO1]    NVARCHAR (50)  NULL,
    [CAMPO2]    NVARCHAR (50)  NULL,
    [CAMPO3]    NVARCHAR (50)  NULL,
    [CAMPO4]    NVARCHAR (50)  NULL,
    [CAMPO5]    NVARCHAR (50)  NULL,
    [CAMPO6]    NVARCHAR (50)  NULL,
    CONSTRAINT [PK_SEC_Gruppi] PRIMARY KEY NONCLUSTERED ([CodGruppo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SEC_Gruppi] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SEC_Gruppi] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SEC_Gruppi] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SEC_Gruppi] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SEC_Gruppi] TO [Metodo98]
    AS [dbo];

