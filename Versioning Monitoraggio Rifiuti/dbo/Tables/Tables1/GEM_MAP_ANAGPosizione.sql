CREATE TABLE [dbo].[GEM_MAP_ANAGPosizione] (
    [CodicePosizione]       VARCHAR (50)    NOT NULL,
    [TipologiaMezzo]        VARCHAR (250)   NULL,
    [PosizioneCli]          VARCHAR (30)    NULL,
    [SubPosizione]          INT             NULL,
    [Ubicazione]            VARCHAR (50)    NULL,
    [BarcodePosizione]      VARCHAR (30)    NULL,
    [TipoBarcode]           VARCHAR (10)    NULL,
    [DataInserimento]       DATETIME        NULL,
    [DataEliminazione]      DATETIME        NULL,
    [FlagEliminazione]      SMALLINT        NULL,
    [PosizioneClienteQlick] VARCHAR (30)    NULL,
    [CodUbicazioneQlick]    VARCHAR (30)    NULL,
    [CoordinataX]           DECIMAL (16, 4) NULL,
    [CoordinataY]           DECIMAL (16, 4) NULL,
    [Note]                  VARCHAR (250)   NULL,
    [CodiceComplesso]       VARCHAR (30)    NULL,
    [CodiceEdificio]        VARCHAR (30)    NULL,
    [CodiceLivello]         VARCHAR (50)    NULL,
    [CodiceVano]            VARCHAR (50)    NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]          DATETIME        NOT NULL,
    [Cliente]               VARCHAR (7)     NOT NULL,
    [Sede]                  DECIMAL (5)     NOT NULL,
    [Protocollo]            DECIMAL (10)    NOT NULL,
    CONSTRAINT [PK_GEM_MAP_ANAGPosizione] PRIMARY KEY CLUSTERED ([CodicePosizione] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_MAP_ANAGPosizione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_MAP_ANAGPosizione] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_MAP_ANAGPosizione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_MAP_ANAGPosizione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_MAP_ANAGPosizione] TO [Metodo98]
    AS [dbo];

