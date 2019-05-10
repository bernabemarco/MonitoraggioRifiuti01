CREATE TABLE [dbo].[GEM_MAP_ANAGVano] (
    [CodiceVano]      VARCHAR (50)    NOT NULL,
    [DscVano]         VARCHAR (250)   NULL,
    [CodiceComplesso] VARCHAR (30)    NULL,
    [CodiceEdificio]  VARCHAR (30)    NULL,
    [CodiceLivello]   VARCHAR (50)    NULL,
    [IDCDC]           INT             NULL,
    [CodiceDWG]       VARCHAR (25)    NULL,
    [ATTIVO]          SMALLINT        NULL,
    [DESTUSO]         VARCHAR (50)    NULL,
    [RM]              VARCHAR (50)    NULL,
    [MG]              DECIMAL (16, 4) NULL,
    [DATAINIZIO]      DATETIME        NULL,
    [DATAFINE]        DATETIME        NULL,
    [Reparto]         VARCHAR (250)   NULL,
    [DATAVERSIONE]    DATETIME        NULL,
    [UTENTEMODIFICA]  VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]    DATETIME        NOT NULL,
    CONSTRAINT [PK_GEM_MAP_ANAGVano] PRIMARY KEY CLUSTERED ([CodiceVano] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_MAP_ANAGVano] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_MAP_ANAGVano] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_MAP_ANAGVano] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_MAP_ANAGVano] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_MAP_ANAGVano] TO [Metodo98]
    AS [dbo];

