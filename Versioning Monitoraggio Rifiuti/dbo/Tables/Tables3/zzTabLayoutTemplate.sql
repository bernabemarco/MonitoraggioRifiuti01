CREATE TABLE [dbo].[zzTabLayoutTemplate] (
    [NomeTemplate]   VARCHAR (200) NOT NULL,
    [ControlId]      VARCHAR (256) NOT NULL,
    [LayoutData]     VARCHAR (MAX) CONSTRAINT [DF_zzTabLayoutTemplate_LayoutData] DEFAULT ('') NOT NULL,
    [UtenteModifica] VARCHAR (25)  CONSTRAINT [DF_zzTabLayoutTemplate_UtenteModifica] DEFAULT (user_name()) NOT NULL,
    [DataModifica]   DATETIME      CONSTRAINT [DF_zzTabLayoutTemplate_DataModifica] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_zzTabLayoutTemplate] PRIMARY KEY CLUSTERED ([NomeTemplate] ASC, [ControlId] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[zzTabLayoutTemplate] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[zzTabLayoutTemplate] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[zzTabLayoutTemplate] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[zzTabLayoutTemplate] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[zzTabLayoutTemplate] TO [Metodo98]
    AS [dbo];

