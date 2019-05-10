CREATE TABLE [dbo].[Query_Security] (
    [CodQuery]  NVARCHAR (5) CONSTRAINT [DF_Query_Secu_CodQuery_2__10] DEFAULT ('') NOT NULL,
    [CodGruppo] NVARCHAR (5) CONSTRAINT [DF_Query_Secu_CodGruppo_1__10] DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_Query_Security] PRIMARY KEY NONCLUSTERED ([CodQuery] ASC, [CodGruppo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Query_Security] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Query_Security] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Query_Security] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Query_Security] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Query_Security] TO [Metodo98]
    AS [dbo];

