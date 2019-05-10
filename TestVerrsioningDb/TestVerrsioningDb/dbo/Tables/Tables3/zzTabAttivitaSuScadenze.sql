CREATE TABLE [dbo].[zzTabAttivitaSuScadenze] (
    [IdAttivita]      INT           IDENTITY (1, 1) NOT NULL,
    [IdScadenza]      DECIMAL (18)  NOT NULL,
    [UserID]          VARCHAR (25)  CONSTRAINT [DF_zzTabAttivitaSuScadenze_UserID] DEFAULT ('') NOT NULL,
    [DataInserimento] DATETIME      CONSTRAINT [DF_zzTabAttivitaSuScadenze_DataInserimento] DEFAULT (getdate()) NULL,
    [DataScadenza]    DATETIME      NULL,
    [NoteAttivita]    VARCHAR (MAX) CONSTRAINT [DF_zzTabAttivitaSuScadenze_NoteAttivita] DEFAULT ('') NULL,
    [Richiamare]      BIT           CONSTRAINT [DF_zzTabAttivitaSuScadenze_Richiamare] DEFAULT ((0)) NULL,
    [Evaso]           BIT           CONSTRAINT [DF_zzTabAttivitaSuScadenze_Evaso] DEFAULT ((0)) NULL,
    [TipoAttivita]    VARCHAR (25)  NULL,
    [Priorita]        NUMERIC (18)  NULL,
    [EsitoAttivita]   VARCHAR (25)  NULL,
    [AssegnataA]      VARCHAR (100) CONSTRAINT [DF_zzTabAttivitaSuScadenze_AssegnataA] DEFAULT ('') NULL,
    [NumeroChiamata]  VARCHAR (100) CONSTRAINT [DF_zzTabAttivitaSuScadenze_NumeroChiamata] DEFAULT ('') NULL,
    [Letti]           BIT           CONSTRAINT [DF_zzTabAttivitaSuScadenze_Letti] DEFAULT ((0)) NULL,
    [UtenteModifica]  VARCHAR (25)  NULL,
    [DataModifica]    DATETIME      NULL,
    CONSTRAINT [PK_zzTabAttivitaSuScadenze] PRIMARY KEY CLUSTERED ([IdAttivita] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[zzTabAttivitaSuScadenze] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[zzTabAttivitaSuScadenze] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[zzTabAttivitaSuScadenze] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[zzTabAttivitaSuScadenze] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[zzTabAttivitaSuScadenze] TO [Metodo98]
    AS [dbo];

