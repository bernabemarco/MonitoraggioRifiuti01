CREATE TABLE [dbo].[EURIS_TAB_PAR] (
    [cod_azienda]      NVARCHAR (3)  NULL,
    [cod_stabilimento] NVARCHAR (50) NULL,
    [vkey]             INT           NULL,
    [parms]            NTEXT         NULL,
    CONSTRAINT [FK_EURIS_TAB_PAR_COD_AZIENDA] FOREIGN KEY ([cod_azienda]) REFERENCES [dbo].[EURIS_SCHEDULAZIONI] ([CODICE]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EURIS_TAB_PAR] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EURIS_TAB_PAR] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EURIS_TAB_PAR] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EURIS_TAB_PAR] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EURIS_TAB_PAR] TO [Metodo98]
    AS [dbo];

