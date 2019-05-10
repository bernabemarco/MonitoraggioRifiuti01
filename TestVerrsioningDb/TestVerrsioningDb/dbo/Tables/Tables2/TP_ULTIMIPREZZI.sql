CREATE TABLE [dbo].[TP_ULTIMIPREZZI] (
    [Progressivo]           DECIMAL (10)    NOT NULL,
    [CODART]                VARCHAR (50)    NULL,
    [CODCLIFOR]             VARCHAR (7)     NULL,
    [DATADOC]               DATETIME        NULL,
    [ESERCIZIO]             DECIMAL (5)     NULL,
    [TIPODOC]               VARCHAR (3)     NULL,
    [NUMERODOC]             DECIMAL (10)    NULL,
    [PREZZOUNITNETTO]       DECIMAL (19, 4) NULL,
    [PREZZOUNITNETTOEURO]   DECIMAL (19, 4) NULL,
    [PREZZOUNITLORDO]       DECIMAL (19, 4) NULL,
    [PREZZOUNITLORDOEURO]   DECIMAL (19, 4) NULL,
    [SCONTIESTESI]          VARCHAR (20)    NULL,
    [QTAGEST]               DECIMAL (19, 6) NULL,
    [UMGEST]                VARCHAR (5)     NULL,
    [DESCRIZIONEPROMOZIONE] VARCHAR (50)    NULL,
    CONSTRAINT [PK_TP_ULTIMIPREZZIPRIMARY] PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ULTIMIPREZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ULTIMIPREZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ULTIMIPREZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ULTIMIPREZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ULTIMIPREZZI] TO [Metodo98]
    AS [dbo];

