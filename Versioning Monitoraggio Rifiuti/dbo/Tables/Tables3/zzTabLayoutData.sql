CREATE TABLE [dbo].[zzTabLayoutData] (
    [UserId]         VARCHAR (25)  NOT NULL,
    [ControlId]      VARCHAR (256) NOT NULL,
    [LayoutData]     VARCHAR (MAX) CONSTRAINT [DF_zzTabLayoutData_LayoutData] DEFAULT ('') NOT NULL,
    [UtenteModifica] VARCHAR (25)  CONSTRAINT [DF_zzTabLayoutData_UtenteModifica] DEFAULT (user_name()) NOT NULL,
    [DataModifica]   DATETIME      CONSTRAINT [DF_zzTabLayoutData_DataModifica] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_zzTabLayoutData] PRIMARY KEY CLUSTERED ([UserId] ASC, [ControlId] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[zzTabLayoutData] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[zzTabLayoutData] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[zzTabLayoutData] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[zzTabLayoutData] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[zzTabLayoutData] TO [Metodo98]
    AS [dbo];

