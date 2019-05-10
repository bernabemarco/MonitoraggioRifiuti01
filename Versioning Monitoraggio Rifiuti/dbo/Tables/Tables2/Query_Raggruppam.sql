CREATE TABLE [dbo].[Query_Raggruppam] (
    [CodModulo] NVARCHAR (16) CONSTRAINT [DF_Query_Ragg_CodModulo_1__10] DEFAULT ('') NOT NULL,
    [CodQuery]  NVARCHAR (5)  CONSTRAINT [DF_Query_Ragg_CodQuery_2__10] DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_Query_Raggruppam] PRIMARY KEY NONCLUSTERED ([CodModulo] ASC, [CodQuery] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Query_Raggruppam] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Query_Raggruppam] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Query_Raggruppam] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Query_Raggruppam] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Query_Raggruppam] TO [Metodo98]
    AS [dbo];

