CREATE TABLE [dbo].[GRI_T_TAB_ORE_ADDEBITO] (
    [idRiga]                    DECIMAL (5)     NOT NULL,
    [DESCRIZIONE]               VARCHAR (80)    NULL,
    [TipoAgente]                SMALLINT        NULL,
    [CodArticoloMET_OREORD]     VARCHAR (50)    NOT NULL,
    [CodArticoloMET_ORESTRA]    VARCHAR (50)    NOT NULL,
    [CodArticoloMET_OREVIAGGIO] VARCHAR (50)    NOT NULL,
    [CodArticoloMET_TRASFERTA]  VARCHAR (50)    NOT NULL,
    [CodArticoloMET_KM]         VARCHAR (50)    NOT NULL,
    [UTENTEMODIFICA]            VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]              DATETIME        NOT NULL,
    [Provv3OreOrd]              NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [Provv3OreStraord]          NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [Provv3OreViaggio]          NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [Provv3Trasferta]           NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [Provv3KM]                  NUMERIC (10, 2) DEFAULT ((0)) NULL,
    CONSTRAINT [PK_GRI_T_TAB_ORE_ADDEBITO] PRIMARY KEY CLUSTERED ([idRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_T_TAB_ORE_ADDEBITO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_T_TAB_ORE_ADDEBITO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_T_TAB_ORE_ADDEBITO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_T_TAB_ORE_ADDEBITO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_T_TAB_ORE_ADDEBITO] TO [Metodo98]
    AS [dbo];

