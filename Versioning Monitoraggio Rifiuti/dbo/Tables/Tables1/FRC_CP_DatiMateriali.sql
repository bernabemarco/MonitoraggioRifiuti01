CREATE TABLE [dbo].[FRC_CP_DatiMateriali] (
    [ID]               INT             IDENTITY (1, 1) NOT NULL,
    [IDOrigine]        INT             NOT NULL,
    [IDOrigineDB]      INT             NOT NULL,
    [NomeEsplosione]   VARCHAR (50)    NULL,
    [COMPONENTE]       VARCHAR (50)    NULL,
    [UMCOMPONENTE]     VARCHAR (3)     NULL,
    [QUANTITA]         DECIMAL (16, 6) NULL,
    [COSTOUNIEURO]     DECIMAL (19, 6) NULL,
    [COSTOTOTEURO]     DECIMAL (19, 6) NULL,
    [GRUPPO]           DECIMAL (5)     NULL,
    [CATEGORIA]        DECIMAL (5)     NULL,
    [CODCATEGORIASTAT] DECIMAL (5)     NULL,
    [FORNITOREPREF]    VARCHAR (7)     NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL,
    CONSTRAINT [KEY_FRC_CP_DatiMateriali] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRC_CP_DatiMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRC_CP_DatiMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRC_CP_DatiMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRC_CP_DatiMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRC_CP_DatiMateriali] TO [Metodo98]
    AS [dbo];

