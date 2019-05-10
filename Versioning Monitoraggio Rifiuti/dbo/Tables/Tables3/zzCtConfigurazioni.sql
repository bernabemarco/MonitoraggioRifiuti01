CREATE TABLE [dbo].[zzCtConfigurazioni] (
    [Nome]           VARCHAR (100) NOT NULL,
    [Valore]         VARCHAR (500) CONSTRAINT [DF_zzCtConfigurazioni_Valore] DEFAULT ('') NOT NULL,
    [UtenteModifica] VARCHAR (25)  CONSTRAINT [DF_zzCtConfigurazioni_UtenteModifica] DEFAULT (user_name()) NOT NULL,
    [DataModifica]   DATETIME      CONSTRAINT [DF_zzCtConfigurazioni_DataModifica] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_zzCtConfigurazioni] PRIMARY KEY CLUSTERED ([Nome] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[zzCtConfigurazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[zzCtConfigurazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[zzCtConfigurazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[zzCtConfigurazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[zzCtConfigurazioni] TO [Metodo98]
    AS [dbo];

