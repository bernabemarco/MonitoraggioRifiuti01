CREATE TABLE [dbo].[Tp_OmogeneiPassivi] (
    [Codice]         VARCHAR (7)  NOT NULL,
    [Descrizione]    VARCHAR (50) NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    CONSTRAINT [PK_Tp_OmogeneiPassivi] PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Tp_OmogeneiPassivi] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Tp_OmogeneiPassivi] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Tp_OmogeneiPassivi] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Tp_OmogeneiPassivi] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Tp_OmogeneiPassivi] TO [Metodo98]
    AS [dbo];

