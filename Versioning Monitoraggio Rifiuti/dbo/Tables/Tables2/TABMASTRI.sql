CREATE TABLE [dbo].[TABMASTRI] (
    [CODICE]            DECIMAL (5)   NOT NULL,
    [DESCRIZIONE]       VARCHAR (80)  NULL,
    [TIPO]              CHAR (1)      NOT NULL,
    [NOTE]              VARCHAR (100) NULL,
    [DATAINIVALIDITA]   DATETIME      NOT NULL,
    [DATAFINEVALIDITA]  DATETIME      NOT NULL,
    [UTENTEMODIFICA]    VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]      DATETIME      NOT NULL,
    [CodiceVoce]        VARCHAR (6)   NULL,
    [CodContoMFMCliFor] VARCHAR (20)  NULL,
    [GrConti]           VARCHAR (4)   NULL,
    [CodContoMastroSap] VARCHAR (20)  NULL,
    [GrCashMng]         VARCHAR (10)  NULL,
    [idOrFatt]          SMALLINT      DEFAULT ((0)) NULL,
    [GrContiDDV]        VARCHAR (4)   DEFAULT ('') NULL,
    [FlgCtrlRA]         INT           DEFAULT ((0)) NULL,
    [FlgSplitPay]       INT           DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TABMASTRI] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_TIPO_TABMASTR] CHECK ([TIPO] = 'O' or [TIPO] = 'P' or [TIPO] = 'E')
);


GO
CREATE NONCLUSTERED INDEX [TABMASTRI_DSC]
    ON [dbo].[TABMASTRI]([DESCRIZIONE] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [TABMASTRI_TIPO]
    ON [dbo].[TABMASTRI]([TIPO] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABMASTRI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABMASTRI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABMASTRI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABMASTRI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABMASTRI] TO [Metodo98]
    AS [dbo];

