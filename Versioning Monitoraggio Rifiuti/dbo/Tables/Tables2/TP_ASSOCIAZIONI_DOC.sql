CREATE TABLE [dbo].[TP_ASSOCIAZIONI_DOC] (
    [Cod_Doc]        VARCHAR (3)  NOT NULL,
    [Tipo]           INT          NOT NULL,
    [Genera]         VARCHAR (50) NULL,
    [Doc_Com]        CHAR (1)     NULL,
    [UtenteModifica] VARCHAR (25) NULL,
    [DataModifica]   DATETIME     NULL,
    CONSTRAINT [PK__TP_ASSOCIAZIONI_DOC] PRIMARY KEY CLUSTERED ([Tipo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ASSOCIAZIONI_DOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ASSOCIAZIONI_DOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ASSOCIAZIONI_DOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ASSOCIAZIONI_DOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ASSOCIAZIONI_DOC] TO [Metodo98]
    AS [dbo];

