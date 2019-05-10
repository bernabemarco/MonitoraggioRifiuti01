﻿CREATE TABLE [dbo].[TP_RELAZIONI_EXPORT] (
    [RifProgressivo]      DECIMAL (18)  NOT NULL,
    [Posizione]           INT           NOT NULL,
    [TABELLASORGENTE]     VARCHAR (50)  NULL,
    [CAMPOSORGENTE]       VARCHAR (200) NULL,
    [TABELLADESTINAZIONE] VARCHAR (50)  NULL,
    [CAMPODESTINAZIONE]   VARCHAR (200) NULL,
    [TIPORELAZIONE]       SMALLINT      NULL,
    [UtenteModifica]      VARCHAR (25)  NOT NULL,
    [DataModifica]        DATETIME      NOT NULL,
    CONSTRAINT [PK_TP_RELAZIONI_EXPORT] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [Posizione] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_RELAZIONI_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_RELAZIONI_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_RELAZIONI_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_RELAZIONI_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_RELAZIONI_EXPORT] TO [Metodo98]
    AS [dbo];

