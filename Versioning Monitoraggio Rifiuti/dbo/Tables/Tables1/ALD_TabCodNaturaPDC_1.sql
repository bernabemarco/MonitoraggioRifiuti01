CREATE TABLE [dbo].[ALD_TabCodNaturaPDC_1] (
    [CodNaturaPDC_1] VARCHAR (20)  NOT NULL,
    [Descrizione]    VARCHAR (80)  NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   SMALLDATETIME NOT NULL,
    CONSTRAINT [PK_ALD_TabCodNaturaPDC_1] PRIMARY KEY CLUSTERED ([CodNaturaPDC_1] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TabCodNaturaPDC_1] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TabCodNaturaPDC_1] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TabCodNaturaPDC_1] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TabCodNaturaPDC_1] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TabCodNaturaPDC_1] TO [Metodo98]
    AS [dbo];

