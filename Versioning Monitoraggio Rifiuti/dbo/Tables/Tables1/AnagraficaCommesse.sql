CREATE TABLE [dbo].[AnagraficaCommesse] (
    [Progressivo]             DECIMAL (10)    NOT NULL,
    [AnnoCom]                 SMALLINT        NOT NULL,
    [TipoCom]                 VARCHAR (3)     NOT NULL,
    [NumCom]                  INT             NOT NULL,
    [CliCommitt]              VARCHAR (7)     NULL,
    [CliFatt]                 VARCHAR (7)     NULL,
    [Riferimento]             VARCHAR (255)   NULL,
    [CodArtOggetto]           VARCHAR (50)    NULL,
    [Oggetto]                 VARCHAR (255)   NULL,
    [DocContratto]            VARCHAR (255)   NULL,
    [NumOfferta]              VARCHAR (10)    NULL,
    [DataOfferta]             DATETIME        NULL,
    [IDTestaOrdCli]           NUMERIC (10)    NULL,
    [IDCliente]               VARCHAR (50)    NULL,
    [DataConferma]            DATETIME        NULL,
    [DataEmissione]           DATETIME        NULL,
    [DataConsegnaContr]       DATETIME        NULL,
    [DataConsegnaPrev]        DATETIME        NULL,
    [DataConsegnaSched]       DATETIME        NULL,
    [DataInizioConsegna]      DATETIME        NULL,
    [DataFineConsegna]        DATETIME        NULL,
    [DataChiusuraComm]        DATETIME        NULL,
    [StatoCommessa]           SMALLINT        CONSTRAINT [DF__Anagrafic__Stato__723CC7BC] DEFAULT (0) NULL,
    [ResponsabileComm]        VARCHAR (50)    NULL,
    [ModoConsegnaResa]        DECIMAL (5)     NULL,
    [ValCambioOff]            DECIMAL (13, 6) CONSTRAINT [DF__Anagrafic__ValCa__7425102E] DEFAULT (1) NULL,
    [ValCambioComm]           DECIMAL (13, 6) CONSTRAINT [DF__Anagrafic__ValCa__75193467] DEFAULT (1) NULL,
    [UTENTEMODIFICA]          VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]            DATETIME        NOT NULL,
    [CODVALUTA]               NUMERIC (5)     CONSTRAINT [DF__ANAGRAFIC__CODVA__7F978E31] DEFAULT (0) NULL,
    [RifComm]                 VARCHAR (30)    DEFAULT ('') NOT NULL,
    [flgTIPOCOMM]             SMALLINT        DEFAULT (0) NULL,
    [PROGRIEPILOGATIVA]       NUMERIC (10)    NULL,
    [DATACONSUNTIVAZIONE]     DATETIME        NULL,
    [PROGRPREVENTIVO]         DECIMAL (10)    NULL,
    [RIFPREVENTIVO]           VARCHAR (30)    NULL,
    [DATAELAB_CONS]           DATETIME        NULL,
    [DATAELAB_VAL]            DATETIME        NULL,
    [DATARIF_RILEVAZ]         DATETIME        NULL,
    [DATARIF_VALORIZ]         DATETIME        NULL,
    [RIFCOMMRIEP]             VARCHAR (30)    NULL,
    [TIPOASSEGNAZIONE]        SMALLINT        NULL,
    [TIPOVALORIZ]             SMALLINT        NULL,
    [CODICECIG]               VARCHAR (10)    CONSTRAINT [DF_ANAGRAFICACOMMESSE_CODICECIG] DEFAULT ('') NOT NULL,
    [CODICECUP]               VARCHAR (15)    CONSTRAINT [DF_ANAGRAFICACOMMESSE_CODICECUP] DEFAULT ('') NOT NULL,
    [PRIORITAELABORAZIONEMRP] INT             NULL,
    CONSTRAINT [AnagraficaCommesse_PK] PRIMARY KEY CLUSTERED ([Progressivo] ASC),
    CONSTRAINT [CKC_flgTIPOCOMM] CHECK ([flgTIPOCOMM] = 0 or [flgTIPOCOMM] = 1)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RIFCOMM_IDX]
    ON [dbo].[AnagraficaCommesse]([RifComm] ASC);


GO
GRANT DELETE
    ON OBJECT::[dbo].[AnagraficaCommesse] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AnagraficaCommesse] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[AnagraficaCommesse] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AnagraficaCommesse] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AnagraficaCommesse] TO [Metodo98]
    AS [dbo];

