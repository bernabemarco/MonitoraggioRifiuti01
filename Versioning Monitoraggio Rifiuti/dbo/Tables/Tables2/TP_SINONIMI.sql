CREATE TABLE [dbo].[TP_SINONIMI] (
    [Progressivo]       NUMERIC (10)    NOT NULL,
    [Codice]            VARCHAR (50)    NOT NULL,
    [Cod_Sino]          VARCHAR (80)    NOT NULL,
    [Desc_Sino]         VARCHAR (80)    NULL,
    [Coeff_Sino]        NUMERIC (16, 6) NOT NULL,
    [UtenteModifica]    VARCHAR (25)    NULL,
    [DataModifica]      DATETIME        NULL,
    [UM]                VARCHAR (3)     NOT NULL,
    [Tipo_Barcode]      SMALLINT        CONSTRAINT [DF_SINONIMI_TIPO_BARCODE] DEFAULT (0) NULL,
    [BarcodeDaStampare] SMALLINT        DEFAULT (0) NULL,
    [BarcodeTipo]       SMALLINT        DEFAULT ((-1)) NULL,
    [BarcodeStringa]    VARCHAR (80)    DEFAULT ('') NULL,
    [ESPORTAAG]         SMALLINT        NULL,
    [ESPORTAPV]         SMALLINT        NULL,
    CONSTRAINT [PK__TP_SINONIMI] PRIMARY KEY CLUSTERED ([Progressivo] ASC, [Codice] ASC, [Cod_Sino] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [Codice]
    ON [dbo].[TP_SINONIMI]([Codice] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [Cod_sino]
    ON [dbo].[TP_SINONIMI]([Cod_Sino] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [Sinonimo]
    ON [dbo].[TP_SINONIMI]([Codice] ASC, [Cod_Sino] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_SINONIMI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_SINONIMI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_SINONIMI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_SINONIMI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_SINONIMI] TO [Metodo98]
    AS [dbo];

