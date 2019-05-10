CREATE TABLE [dbo].[TP_FiltroPromo] (
    [Campagna]                VARCHAR (3)  NOT NULL,
    [Promozione]              VARCHAR (4)  NOT NULL,
    [Settore]                 DECIMAL (5)  NULL,
    [Zona]                    DECIMAL (5)  NULL,
    [Categoria]               DECIMAL (5)  NULL,
    [GruppoPrezziParticolari] DECIMAL (5)  NULL,
    [UTENTEMODIFICA]          VARCHAR (25) NULL,
    [DATAMODIFICA]            DATETIME     NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_TP_FiltroPromo]
    ON [dbo].[TP_FiltroPromo]([Campagna] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_TP_FiltroPromo_1]
    ON [dbo].[TP_FiltroPromo]([Promozione] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_TP_FiltroPromo_2]
    ON [dbo].[TP_FiltroPromo]([Campagna] ASC, [Promozione] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_FiltroPromo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_FiltroPromo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_FiltroPromo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_FiltroPromo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_FiltroPromo] TO [Metodo98]
    AS [dbo];

