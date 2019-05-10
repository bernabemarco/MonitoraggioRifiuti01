CREATE TABLE [dbo].[zzConfigurazioneProfili] (
    [HelpContextId]  INT           NOT NULL,
    [Etichetta]      VARCHAR (100) CONSTRAINT [DF_zzConfigurazioneProfili_Etichetta] DEFAULT ('') NOT NULL,
    [ProfiloDefault] VARCHAR (MAX) CONSTRAINT [DF_zzConfigurazioneProfili_ProfiloDefault] DEFAULT ('') NOT NULL,
    [UtenteModifica] VARCHAR (25)  CONSTRAINT [DF_zzConfigurazioneProfili_UtenteModifica] DEFAULT (user_name()) NOT NULL,
    [DataModifica]   DATETIME      CONSTRAINT [DF_zzConfigurazioneProfili_DataModifica] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_zzConfigurazioneProfili] PRIMARY KEY CLUSTERED ([HelpContextId] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[zzConfigurazioneProfili] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[zzConfigurazioneProfili] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[zzConfigurazioneProfili] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[zzConfigurazioneProfili] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[zzConfigurazioneProfili] TO [Metodo98]
    AS [dbo];

