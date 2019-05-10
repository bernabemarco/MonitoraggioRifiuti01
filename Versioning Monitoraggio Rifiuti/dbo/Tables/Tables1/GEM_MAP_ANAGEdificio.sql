CREATE TABLE [dbo].[GEM_MAP_ANAGEdificio] (
    [CodiceEdificio]    VARCHAR (30)  NOT NULL,
    [DscEdificio]       VARCHAR (250) NULL,
    [CodiceComplesso]   VARCHAR (30)  NULL,
    [CODGRUPPOEDIFICIO] VARCHAR (50)  NULL,
    [CODTIPOEDIFICIO]   VARCHAR (50)  NULL,
    [BL]                VARCHAR (30)  NULL,
    [CodiceDWG]         VARCHAR (25)  NULL,
    [DATAINIZIO]        DATETIME      NULL,
    [DATAFINE]          DATETIME      NULL,
    [UTENTEMODIFICA]    VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]      DATETIME      NOT NULL,
    CONSTRAINT [PK_GEM_MAP_ANAGEdificio] PRIMARY KEY CLUSTERED ([CodiceEdificio] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_MAP_ANAGEdificio] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_MAP_ANAGEdificio] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_MAP_ANAGEdificio] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_MAP_ANAGEdificio] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_MAP_ANAGEdificio] TO [Metodo98]
    AS [dbo];

