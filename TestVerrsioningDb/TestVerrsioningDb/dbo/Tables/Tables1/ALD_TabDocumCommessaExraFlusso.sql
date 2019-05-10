CREATE TABLE [dbo].[ALD_TabDocumCommessaExraFlusso] (
    [IdRiga]         DECIMAL (5)   NOT NULL,
    [CODDoc]         VARCHAR (3)   NOT NULL,
    [Natura]         VARCHAR (2)   NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   SMALLDATETIME NOT NULL,
    CONSTRAINT [PK_ALD_TabDocumCommessaExraFlusso] PRIMARY KEY CLUSTERED ([IdRiga] ASC, [CODDoc] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TabDocumCommessaExraFlusso] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TabDocumCommessaExraFlusso] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TabDocumCommessaExraFlusso] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TabDocumCommessaExraFlusso] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TabDocumCommessaExraFlusso] TO [Metodo98]
    AS [dbo];

