CREATE TABLE [dbo].[CONTRATTI_ESERCIZI] (
    [Esercizio]      DECIMAL (5)  NOT NULL,
    [Stato]          SMALLINT     DEFAULT ((0)) NOT NULL,
    [Utentemodifica] VARCHAR (25) NOT NULL,
    [Datamodifica]   DATETIME     NOT NULL,
    CONSTRAINT [PK_CONTRATTI_ESERCIZI] PRIMARY KEY CLUSTERED ([Esercizio] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTI_ESERCIZI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTI_ESERCIZI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_ESERCIZI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTI_ESERCIZI] TO [Metodo98]
    AS [dbo];

