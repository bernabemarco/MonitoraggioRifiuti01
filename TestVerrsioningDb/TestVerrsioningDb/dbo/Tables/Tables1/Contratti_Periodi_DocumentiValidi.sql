CREATE TABLE [dbo].[Contratti_Periodi_DocumentiValidi] (
    [PROGRESSIVO]               DECIMAL (10) NOT NULL,
    [TIPODOC]                   VARCHAR (3)  NULL,
    [CONSIDERARIGHEVALORE]      SMALLINT     NULL,
    [CONSIDERARIGHEQTASCTMERCE] SMALLINT     NULL,
    [FLGESERCIZIO]              SMALLINT     NULL,
    [INSOTTRAZIONE]             SMALLINT     NULL,
    [DADATA]                    DATETIME     NULL,
    [ADATA]                     DATETIME     NULL,
    [GGDADATA]                  INT          NULL,
    [GGADATA]                   INT          NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Contratti_Periodi_DocumentiValidi] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Contratti_Periodi_DocumentiValidi] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Contratti_Periodi_DocumentiValidi] TO [Metodo98]
    AS [dbo];

