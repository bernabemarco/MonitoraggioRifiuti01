CREATE TABLE [dbo].[Tp_LivelliMerceologici] (
    [CodicePadre]    VARCHAR (100) NOT NULL,
    [Codice]         VARCHAR (100) NOT NULL,
    [Posizione]      DECIMAL (10)  NOT NULL,
    [Descrizione]    VARCHAR (80)  NOT NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([CodicePadre] ASC, [Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Tp_LivelliMerceologici] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Tp_LivelliMerceologici] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Tp_LivelliMerceologici] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Tp_LivelliMerceologici] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Tp_LivelliMerceologici] TO [Metodo98]
    AS [dbo];

