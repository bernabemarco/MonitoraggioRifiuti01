CREATE TABLE [dbo].[ALD_TestCancTesteDoc] (
    [id]             SMALLINT     IDENTITY (1, 1) NOT NULL,
    [PROGRESSIVO]    DECIMAL (10) NOT NULL,
    [ESERCIZIO]      DECIMAL (5)  NOT NULL,
    [TIPODOC]        VARCHAR (3)  NOT NULL,
    [NUMERODOC]      DECIMAL (10) NOT NULL,
    [CODCLIFOR]      VARCHAR (7)  NULL,
    [DescrAzione]    VARCHAR (50) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_ALD_TestCancTesteDoc] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TestCancTesteDoc] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TestCancTesteDoc] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TestCancTesteDoc] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TestCancTesteDoc] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TestCancTesteDoc] TO [Metodo98]
    AS [dbo];

