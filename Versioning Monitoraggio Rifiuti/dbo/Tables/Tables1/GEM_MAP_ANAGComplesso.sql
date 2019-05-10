CREATE TABLE [dbo].[GEM_MAP_ANAGComplesso] (
    [CodiceComplesso] VARCHAR (30)  NOT NULL,
    [DscComplesso]    VARCHAR (250) NULL,
    [IDBeneImmobile]  VARCHAR (30)  CONSTRAINT [DF_GEM_MAP_ANAGComplesso_IDBeneImmobile] DEFAULT ('EDILE') NULL,
    [TipoComplesso]   VARCHAR (30)  CONSTRAINT [DF_GEM_MAP_ANAGComplesso_TipoComplesso] DEFAULT ('STANDARD') NULL,
    [DATAINIZIO]      DATETIME      NULL,
    [DATAFINE]        DATETIME      NULL,
    [UTENTEMODIFICA]  VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]    DATETIME      NOT NULL,
    CONSTRAINT [PK_GEM_MAP_ANAGComplesso] PRIMARY KEY CLUSTERED ([CodiceComplesso] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_MAP_ANAGComplesso] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_MAP_ANAGComplesso] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_MAP_ANAGComplesso] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_MAP_ANAGComplesso] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_MAP_ANAGComplesso] TO [Metodo98]
    AS [dbo];

