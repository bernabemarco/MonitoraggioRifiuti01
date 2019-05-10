CREATE TABLE [dbo].[ALD_TestCancAnagraficaCF] (
    [id]             INT          IDENTITY (1, 1) NOT NULL,
    [CODCONTO]       VARCHAR (7)  NULL,
    [DescrAzione]    VARCHAR (50) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_ALD_TestCancAnagraficaCF] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TestCancAnagraficaCF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TestCancAnagraficaCF] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TestCancAnagraficaCF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TestCancAnagraficaCF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TestCancAnagraficaCF] TO [Metodo98]
    AS [dbo];

