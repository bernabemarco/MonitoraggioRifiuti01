CREATE TABLE [dbo].[Contratti_RiferimentoDocumenti] (
    [PROGRESSIVO]       DECIMAL (10)    NOT NULL,
    [NUMEROCONTRATTO]   DECIMAL (10)    NOT NULL,
    [IDTESTA]           DECIMAL (10)    NOT NULL,
    [IDRIGA]            INT             NOT NULL,
    [KEYIDTIDR]         BIGINT          NULL,
    [TOTSPESETRASPRES]  DECIMAL (19, 4) NOT NULL,
    [TOTIMPONIBILEEURO] DECIMAL (19, 4) NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Contratti_RiferimentoDocumenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Contratti_RiferimentoDocumenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Contratti_RiferimentoDocumenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Contratti_RiferimentoDocumenti] TO [Metodo98]
    AS [dbo];

