CREATE TABLE [dbo].[GEM_MAP_ANAGLivello] (
    [CodiceLivello]   VARCHAR (50)    NOT NULL,
    [DscLivello]      VARCHAR (250)   NULL,
    [CodiceComplesso] VARCHAR (30)    NULL,
    [CodiceEdificio]  VARCHAR (30)    NULL,
    [FL]              VARCHAR (30)    NULL,
    [MQ]              DECIMAL (16, 4) NULL,
    [CodiceDWG]       VARCHAR (25)    NULL,
    [DATAINIZIO]      DATETIME        NULL,
    [DATAFINE]        DATETIME        NULL,
    [ORDINE]          VARCHAR (50)    NULL,
    [UTENTEMODIFICA]  VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]    DATETIME        NOT NULL,
    CONSTRAINT [PK_GEM_MAP_ANAGLivello] PRIMARY KEY CLUSTERED ([CodiceLivello] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_MAP_ANAGLivello] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_MAP_ANAGLivello] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_MAP_ANAGLivello] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_MAP_ANAGLivello] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_MAP_ANAGLivello] TO [Metodo98]
    AS [dbo];

