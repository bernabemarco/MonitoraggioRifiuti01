CREATE TABLE [dbo].[SST_IMG_Log] (
    [Codice]     INT            IDENTITY (1, 1) NOT NULL,
    [Data]       DATETIME       DEFAULT (getdate()) NOT NULL,
    [Utente]     VARCHAR (25)   DEFAULT (user_name()) NOT NULL,
    [Errore]     BIT            DEFAULT ((0)) NOT NULL,
    [Messaggio]  NVARCHAR (MAX) DEFAULT ('') NOT NULL,
    [StackTrace] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SST_IMG_Log] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SST_IMG_Log] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SST_IMG_Log] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SST_IMG_Log] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SST_IMG_Log] TO [Metodo98]
    AS [dbo];

