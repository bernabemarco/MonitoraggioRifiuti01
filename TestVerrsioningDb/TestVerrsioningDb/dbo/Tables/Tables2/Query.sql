CREATE TABLE [dbo].[Query] (
    [CodQuery]          NVARCHAR (5)   CONSTRAINT [DF_Query_CodQuery_1__10] DEFAULT ('') NOT NULL,
    [DesQuery]          NVARCHAR (50)  NULL,
    [TipoElaborazione]  NVARCHAR (1)   NULL,
    [SQL]               NTEXT          NULL,
    [CartellaExcel]     NVARCHAR (64)  NULL,
    [FoglioDatiExcel]   NVARCHAR (32)  NULL,
    [MacroExcel]        NVARCHAR (32)  NULL,
    [FoglioGrafico]     NVARCHAR (32)  NULL,
    [TipoFoglioGrafico] NVARCHAR (1)   NULL,
    [FoglioParametri]   NVARCHAR (32)  NULL,
    [Database]          NVARCHAR (80)  NULL,
    [MacroAccess]       NVARCHAR (64)  NULL,
    [Titolo]            NVARCHAR (255) NULL,
    [Commento]          NTEXT          NULL,
    [Programma]         NVARCHAR (255) NULL,
    [ParamPgm]          NVARCHAR (255) NULL,
    CONSTRAINT [PK_Query] PRIMARY KEY NONCLUSTERED ([CodQuery] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Query] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Query] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Query] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Query] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Query] TO [Metodo98]
    AS [dbo];

