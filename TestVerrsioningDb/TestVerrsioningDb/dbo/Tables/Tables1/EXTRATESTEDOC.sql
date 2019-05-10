CREATE TABLE [dbo].[EXTRATESTEDOC] (
    [IDTESTA]              DECIMAL (10)     NOT NULL,
    [UTENTEMODIFICA]       VARCHAR (25)     NOT NULL,
    [DATAMODIFICA]         DATETIME         NOT NULL,
    [NOTEDOC]              VARCHAR (500)    NULL,
    [TotRitAccCondominio]  DECIMAL (19, 4)  DEFAULT (0) NULL,
    [CommessaService]      VARCHAR (50)     DEFAULT ('') NULL,
    [RefAmmInterno]        DECIMAL (5)      DEFAULT ((0)) NULL,
    [RefCommessaMF]        VARCHAR (30)     DEFAULT ('') NULL,
    [IdDivisione]          SMALLINT         DEFAULT ((0)) NULL,
    [RefAmmInternoDSC]     VARCHAR (30)     DEFAULT ('') NULL,
    [NrRevisione]          DECIMAL (5)      DEFAULT ((0)) NULL,
    [DataRevisione]        SMALLDATETIME    NULL,
    [RifOfferta]           VARCHAR (30)     DEFAULT ('') NULL,
    [DATALISTINOVALID]     DATETIME         NULL,
    [CHKDTCONS]            SMALLINT         NULL,
    [RefGestioneOrd]       SMALLINT         NULL,
    [RefRespCommessa]      SMALLINT         NULL,
    [flagNonFFConforme]    SMALLINT         DEFAULT ((0)) NULL,
    [RefAcquisti]          SMALLINT         NULL,
    [RespConformitaACQ]    SMALLINT         NULL,
    [DataConformitaACQ]    DATETIME         NULL,
    [ImportCRM]            SMALLINT         DEFAULT ((0)) NULL,
    [AldCodIva]            DECIMAL (5)      NULL,
    [AnnotationID]         UNIQUEIDENTIFIER NULL,
    [DtAccettazione]       DATETIME         NULL,
    [RISOLTACONFORMITA]    SMALLINT         NULL,
    [SCADENZEBLOCCATE]     SMALLINT         NULL,
    [NOTESCADENZEBLOCCATE] VARCHAR (100)    NULL,
    [UTENTECREAZIONE]      VARCHAR (25)     NULL,
    [IDRefCli]             VARCHAR (10)     DEFAULT ('') NULL,
    [ReferenteCliente]     VARCHAR (200)    DEFAULT ('') NULL,
    [TelRefCliente]        VARCHAR (200)    DEFAULT ('') NULL,
    [MailRefCliente]       VARCHAR (200)    DEFAULT ('') NULL,
    [InvioSDI]             INT              NULL,
    [PROGRESSIVOINVIO]     VARCHAR (10)     NULL,
    [EsitoRicSDI]          VARCHAR (5)      NULL,
    [dtEsitoRicSDI]        DATETIME         NULL,
    CONSTRAINT [PK_EXTRATESTEDOC] PRIMARY KEY CLUSTERED ([IDTESTA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_EXTRATESTEDOC_IDTESTA] FOREIGN KEY ([IDTESTA]) REFERENCES [dbo].[TESTEDOCUMENTI] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [ald_ExtraTESTEDOC_IdDivisione]
    ON [dbo].[EXTRATESTEDOC]([IdDivisione] ASC);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EXTRATESTEDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EXTRATESTEDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EXTRATESTEDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EXTRATESTEDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EXTRATESTEDOC] TO [Metodo98]
    AS [dbo];

