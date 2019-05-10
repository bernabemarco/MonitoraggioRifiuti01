CREATE TABLE [dbo].[ALD_StatoDocsComm] (
    [Codice]         SMALLINT      DEFAULT ((1)) NOT NULL,
    [Descrizione]    VARCHAR (80)  NULL,
    [Tipo]           SMALLINT      NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   SMALLDATETIME NOT NULL,
    CONSTRAINT [PK_ALD_StatoDocsComm] PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_StatoDocsComm] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_StatoDocsComm] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_StatoDocsComm] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_StatoDocsComm] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_StatoDocsComm] TO [Metodo98]
    AS [dbo];

