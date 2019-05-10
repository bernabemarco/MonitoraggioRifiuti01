CREATE TABLE [dbo].[FRC_CP_DatiMaterialiCLav] (
    [ID]             INT             IDENTITY (1, 1) NOT NULL,
    [IDOrigine]      INT             NOT NULL,
    [COMPONENTE]     VARCHAR (50)    NULL,
    [UMCOMPONENTE]   VARCHAR (3)     NULL,
    [QUANTITA]       DECIMAL (16, 6) NULL,
    [COSTOUNIEURO]   DECIMAL (19, 6) NULL,
    [COSTOTOTEURO]   DECIMAL (19, 6) NULL,
    [FORNITOREPREF]  VARCHAR (7)     NULL,
    [OPERAZIONE]     VARCHAR (5)     NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [KEY_FRC_CP_DatiMaterialiCLav] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRC_CP_DatiMaterialiCLav] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRC_CP_DatiMaterialiCLav] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRC_CP_DatiMaterialiCLav] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRC_CP_DatiMaterialiCLav] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRC_CP_DatiMaterialiCLav] TO [Metodo98]
    AS [dbo];

