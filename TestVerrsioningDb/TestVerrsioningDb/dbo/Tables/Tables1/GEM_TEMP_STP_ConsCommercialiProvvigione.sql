CREATE TABLE [dbo].[GEM_TEMP_STP_ConsCommercialiProvvigione] (
    [IDCONTRATTO]        VARCHAR (13)    NOT NULL,
    [ID]                 VARCHAR (14)    NOT NULL,
    [IDR]                NUMERIC (18)    DEFAULT ((0)) NULL,
    [TipoAnalisi]        VARCHAR (1)     NOT NULL,
    [IMPORTONetto]       DECIMAL (12, 4) DEFAULT ('0') NULL,
    [IMPORTOProvvigione] DECIMAL (12, 4) DEFAULT ('0') NULL,
    [UTENTEMODIFICA]     VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]       DATETIME        NOT NULL,
    CONSTRAINT [GEM_TEMP_STP_ConsCommercialiProvvigione_PK] PRIMARY KEY CLUSTERED ([IDCONTRATTO] ASC, [ID] ASC, [TipoAnalisi] ASC, [UTENTEMODIFICA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_TEMP_STP_ConsCommercialiProvvigione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_TEMP_STP_ConsCommercialiProvvigione] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_TEMP_STP_ConsCommercialiProvvigione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TEMP_STP_ConsCommercialiProvvigione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_TEMP_STP_ConsCommercialiProvvigione] TO [Metodo98]
    AS [dbo];

