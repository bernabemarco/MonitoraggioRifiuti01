CREATE TABLE [dbo].[TabellaEntita] (
    [EntiCEnti]         VARCHAR (26)  NOT NULL,
    [EntiDEnti]         VARCHAR (40)  NOT NULL,
    [EntiIProprieta]    VARCHAR (3)   NOT NULL,
    [EntiIEnti]         VARCHAR (1)   NOT NULL,
    [EntiNTipoDoc]      INT           NOT NULL,
    [EntiWBTempTable]   VARCHAR (26)  NOT NULL,
    [EntiWBCampoPK]     VARCHAR (16)  NOT NULL,
    [EntiWBCampoMast]   VARCHAR (16)  NOT NULL,
    [EntiIBElab]        VARCHAR (1)   NOT NULL,
    [EntiITTipoTab]     VARCHAR (1)   NOT NULL,
    [EntiWTCampoPK]     VARCHAR (16)  NOT NULL,
    [EntiWTTabMaster]   VARCHAR (26)  NOT NULL,
    [EntiWTCampoMast]   VARCHAR (16)  NOT NULL,
    [EntiWTCampoProgr]  VARCHAR (16)  NOT NULL,
    [EntiWTCampoPadre]  VARCHAR (16)  NOT NULL,
    [EntiWRPathName]    VARCHAR (256) NOT NULL,
    [EntiIROutput]      VARCHAR (1)   NOT NULL,
    [EntiWRParametri]   VARCHAR (256) NOT NULL,
    [EntiWDllName1]     VARCHAR (256) NOT NULL,
    [EntiWClassName1]   VARCHAR (256) NOT NULL,
    [EntiWDllName2]     VARCHAR (256) NOT NULL,
    [EntiWClassName2]   VARCHAR (256) NOT NULL,
    [EntiWDllPath]      VARCHAR (256) NOT NULL,
    [EntiWTSortDef]     VARCHAR (80)  NOT NULL,
    [EntiWTCampoNVar]   VARCHAR (16)  NOT NULL,
    [EntiWTKPadreProgr] VARCHAR (80)  NOT NULL,
    [EntiNAsiaSync]     INT           CONSTRAINT [EntiNAsiaSyncflt] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [EntiNTipoDoc] PRIMARY KEY CLUSTERED ([EntiNTipoDoc] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [entiKDEnti]
    ON [dbo].[TabellaEntita]([EntiDEnti] ASC);

