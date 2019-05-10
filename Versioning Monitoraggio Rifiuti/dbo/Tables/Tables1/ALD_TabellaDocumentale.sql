CREATE TABLE [dbo].[ALD_TabellaDocumentale] (
    [GuiID]     VARCHAR (255) NOT NULL,
    [IdDoc]     DECIMAL (18)  NULL,
    [IdCon]     DECIMAL (18)  NULL,
    [KeyUnique] VARCHAR (255) NULL,
    [CodCliFor] VARCHAR (7)   NULL,
    CONSTRAINT [PK_ALD_TabellaDocumentale] PRIMARY KEY CLUSTERED ([GuiID] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TabellaDocumentale] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TabellaDocumentale] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TabellaDocumentale] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TabellaDocumentale] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TabellaDocumentale] TO [Metodo98]
    AS [dbo];

