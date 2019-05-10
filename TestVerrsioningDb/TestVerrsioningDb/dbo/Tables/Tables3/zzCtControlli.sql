CREATE TABLE [dbo].[zzCtControlli] (
    [Progressivo]    BIGINT        IDENTITY (1, 1) NOT NULL,
    [UserId]         VARCHAR (25)  CONSTRAINT [DF_zzCtControlli_UserId] DEFAULT ('*') NOT NULL,
    [NomeControllo]  VARCHAR (100) CONSTRAINT [DF_zzCtControlli_NomeControllo] DEFAULT ('') NOT NULL,
    [PercorsoDll]    VARCHAR (MAX) CONSTRAINT [DF_zzCtControlli_PercorsoDll] DEFAULT ('') NOT NULL,
    [NomeClasse]     VARCHAR (MAX) CONSTRAINT [DF_zzCtControlli_NomeClasse] DEFAULT ('') NOT NULL,
    [UtenteModifica] VARCHAR (25)  CONSTRAINT [DF_zzCtControlli_UtenteModifica] DEFAULT (user_name()) NOT NULL,
    [DataModifica]   DATETIME      CONSTRAINT [DF_zzCtControlli_DataModifica] DEFAULT (getdate()) NOT NULL,
    [NomeProduttore] VARCHAR (100) CONSTRAINT [DF_zzCtControlli_NomeProduttore] DEFAULT ('') NOT NULL,
    [Parametri]      VARCHAR (MAX) CONSTRAINT [DF_zzCtControlli_Parametri] DEFAULT ('') NOT NULL,
    [ControlloPadre] VARCHAR (50)  CONSTRAINT [DF_zzCtControlli_ControlloPadre] DEFAULT ('XucCustomerTouch') NOT NULL,
    CONSTRAINT [PK_zzCtControlli] PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[zzCtControlli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[zzCtControlli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[zzCtControlli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[zzCtControlli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[zzCtControlli] TO [Metodo98]
    AS [dbo];

