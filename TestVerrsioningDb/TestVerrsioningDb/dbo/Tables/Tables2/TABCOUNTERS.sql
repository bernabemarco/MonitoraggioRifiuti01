CREATE TABLE [dbo].[TABCOUNTERS] (
    [ID]          INT            NOT NULL,
    [Descrizione] NVARCHAR (MAX) NULL,
    [Parametro1]  NVARCHAR (MAX) NULL,
    [Parametro2]  NVARCHAR (MAX) NULL,
    [Parametro3]  NVARCHAR (MAX) NULL,
    [Parametro4]  NVARCHAR (MAX) NULL,
    [Parametro5]  NVARCHAR (MAX) NULL,
    [Plugin]      NVARCHAR (100) NULL,
    CONSTRAINT [PK_TABCOUNTERS] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABCOUNTERS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABCOUNTERS] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABCOUNTERS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABCOUNTERS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABCOUNTERS] TO [Metodo98]
    AS [dbo];

