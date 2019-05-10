CREATE TABLE [dbo].[ALD_TabSettoriGiriVisite] (
    [Codice]         VARCHAR (7)  NOT NULL,
    [Descrizione]    VARCHAR (80) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_ALD_TabSettoriGiriVisite] PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TabSettoriGiriVisite] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TabSettoriGiriVisite] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TabSettoriGiriVisite] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TabSettoriGiriVisite] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TabSettoriGiriVisite] TO [Metodo98]
    AS [dbo];

