CREATE TABLE [dbo].[GEM_ListiniContrattoRigheMatrice] (
    [idGListinoContr]  DECIMAL (10)    NOT NULL,
    [IdRigaListinoC]   DECIMAL (5)     NOT NULL,
    [QtaRifProvv]      DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [Variante1]        VARCHAR (8)     NULL,
    [Variante2]        VARCHAR (8)     NULL,
    [Variante3]        VARCHAR (8)     NULL,
    [Variante4]        VARCHAR (8)     NULL,
    [Variante5]        VARCHAR (8)     NULL,
    [Variante6]        VARCHAR (8)     NULL,
    [DATAINIVALIDITA]  DATETIME        NOT NULL,
    [DATAFINEVALIDITA] DATETIME        NOT NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL,
    CONSTRAINT [GEM_ListiniContrattoRigheMatrice_PK] PRIMARY KEY CLUSTERED ([idGListinoContr] ASC, [IdRigaListinoC] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_ListiniContrattoRigheMatrice] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_ListiniContrattoRigheMatrice] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_ListiniContrattoRigheMatrice] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_ListiniContrattoRigheMatrice] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_ListiniContrattoRigheMatrice] TO [Metodo98]
    AS [dbo];

