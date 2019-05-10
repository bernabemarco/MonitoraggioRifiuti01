CREATE TABLE [dbo].[MYTHO_Mapping_Colonne] (
    [ID]             DECIMAL (10)  IDENTITY (1, 1) NOT NULL,
    [RIFPROGRESSIVO] DECIMAL (10)  NOT NULL,
    [Nome Colonna]   VARCHAR (50)  NOT NULL,
    [Valore]         VARCHAR (100) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  DEFAULT (user_name()) NOT NULL,
    [DATAMODIFICA]   DATETIME      DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_MYTHO_Mapping_Colonne] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MYTHO_Mapping_Colonne_NomeColonna]
    ON [dbo].[MYTHO_Mapping_Colonne]([RIFPROGRESSIVO] ASC, [Nome Colonna] ASC);


GO
GRANT CONTROL
    ON OBJECT::[dbo].[MYTHO_Mapping_Colonne] TO [Metodo98]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[MYTHO_Mapping_Colonne] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MYTHO_Mapping_Colonne] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MYTHO_Mapping_Colonne] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MYTHO_Mapping_Colonne] TO [Metodo98]
    AS [dbo];

