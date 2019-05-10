CREATE TABLE [dbo].[SEC_UtentiCollegati] (
    [CodUtente] NVARCHAR (25) CONSTRAINT [DF_SEC_Utenti_CodUtente_2__10] DEFAULT ('') NOT NULL,
    [DataOra]   DATETIME      NULL,
    [Computer]  NVARCHAR (50) NULL,
    CONSTRAINT [PK_SEC_UtentiCollegati] PRIMARY KEY NONCLUSTERED ([CodUtente] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SEC_UtentiCollegati] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SEC_UtentiCollegati] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SEC_UtentiCollegati] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SEC_UtentiCollegati] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SEC_UtentiCollegati] TO [Metodo98]
    AS [dbo];

