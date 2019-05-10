CREATE TABLE [dbo].[VIAGGI] (
    [PROGRESSIVO]            DECIMAL (10)    NOT NULL,
    [RIFTESTATARIFFARIO]     DECIMAL (10)    NULL,
    [DESCRIZIONE]            VARCHAR (100)   NULL,
    [IDTESTADOC]             DECIMAL (10)    NULL,
    [IDRIGADOC]              INT             NULL,
    [DATAVIAGGIO]            DATETIME        NULL,
    [DATARITIROMERCE]        DATETIME        NULL,
    [TIPOLOGIACARICO]        VARCHAR (5)     NULL,
    [QUANTITA]               DECIMAL (16, 6) NULL,
    [UM]                     VARCHAR (3)     NULL,
    [LUOGOCONSEGNA]          VARCHAR (100)   NULL,
    [DESTINAZIONE]           VARCHAR (100)   NULL,
    [PRIORITA]               SMALLINT        NULL,
    [PRENOTAZIONESCARICO]    SMALLINT        NULL,
    [MAGGIORAZIONIAPPLICATE] VARCHAR (50)    NULL,
    [AUTOMEZZO]              DECIMAL (10)    NULL,
    [DISTANZAVIAGGIO]        DECIMAL (16, 6) NULL,
    [COSTOVIAGGIO]           DECIMAL (19, 4) NULL,
    [TEMPOVIAGGIO]           INT             NULL,
    [FILEMPP]                VARCHAR (100)   NULL,
    [VOLUMECARICO]           DECIMAL (16, 6) NULL,
    [PESOCARICO]             DECIMAL (16, 6) NULL,
    [IDTAPPA]                INT             NULL,
    [UTENTEMODIFICA]         VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]           DATETIME        NOT NULL,
    [LUOGOPRESA]             VARCHAR (100)   NULL,
    [TRATTA]                 DECIMAL (10)    NULL,
    [RITIRO]                 INT             NULL,
    [PRESO]                  INT             NULL,
    CONSTRAINT [PK_VIAGGI] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_VIAGGI_IDTESTADOC_IDRIGADOC] FOREIGN KEY ([IDTESTADOC], [IDRIGADOC]) REFERENCES [dbo].[RIGHEDOCUMENTI] ([IDTESTA], [IDRIGA]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[VIAGGI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VIAGGI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VIAGGI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VIAGGI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VIAGGI] TO [Metodo98]
    AS [dbo];

