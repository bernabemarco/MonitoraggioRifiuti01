CREATE TABLE [dbo].[MB_Dettaglio_Tipologie] (
    [Id]               INT             IDENTITY (1, 1) NOT NULL,
    [IDtesta]          DECIMAL (10)    NOT NULL,
    [IDRiga]           INT             NOT NULL,
    [Cod]              VARCHAR (11)    NULL,
    [ValoreVenduto]    DECIMAL (19, 6) NULL,
    [ValoreAcquistato] DECIMAL (19, 6) NULL,
    [QtaTax]           DECIMAL (16, 6) NULL,
    [QtaUm]            DECIMAL (16, 6) NULL,
    [Tipo]             INT             NULL,
    CONSTRAINT [PK__MB_Detta__3214EC0774E75862] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IDX_MB_Dettaglio_Tipologie_IDtesta]
    ON [dbo].[MB_Dettaglio_Tipologie]([IDtesta] ASC)
    INCLUDE([IDRiga], [Cod], [ValoreVenduto], [ValoreAcquistato], [QtaTax], [QtaUm]);


GO
CREATE NONCLUSTERED INDEX [IX_MB_Dettaglio_Tipologie]
    ON [dbo].[MB_Dettaglio_Tipologie]([IDtesta] ASC, [IDRiga] ASC, [Cod] ASC);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MB_Dettaglio_Tipologie] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MB_Dettaglio_Tipologie] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_Dettaglio_Tipologie] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MB_Dettaglio_Tipologie] TO [Metodo98]
    AS [dbo];

