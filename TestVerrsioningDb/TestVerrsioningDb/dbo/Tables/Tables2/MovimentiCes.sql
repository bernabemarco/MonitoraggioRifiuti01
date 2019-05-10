CREATE TABLE [dbo].[MovimentiCes] (
    [Progressivo]          DECIMAL (10)    NOT NULL,
    [Cespite]              VARCHAR (10)    NOT NULL,
    [Tipo]                 DECIMAL (5)     DEFAULT (0) NULL,
    [Descrizione]          VARCHAR (80)    NULL,
    [DtaMovimento]         DATETIME        NULL,
    [DtaDocumento]         DATETIME        NULL,
    [DtaEffettiva]         DATETIME        NULL,
    [NumDocumento]         VARCHAR (20)    NULL,
    [CodFornitore]         VARCHAR (7)     NULL,
    [DesFornitore]         VARCHAR (80)    NULL,
    [CompQtaRes]           DECIMAL (16, 6) DEFAULT (0) NULL,
    [CompQtaEli]           DECIMAL (16, 6) DEFAULT (0) NULL,
    [PercAmmOrd]           DECIMAL (8, 5)  DEFAULT (0) NULL,
    [PercAmmAnt]           DECIMAL (8, 5)  DEFAULT (0) NULL,
    [PercAmmRid]           DECIMAL (8, 5)  DEFAULT (0) NULL,
    [PercRivSva]           DECIMAL (8, 5)  DEFAULT (0) NULL,
    [PercAmpOrd]           DECIMAL (8, 5)  DEFAULT (0) NULL,
    [PercAmpAnt]           DECIMAL (8, 5)  DEFAULT (0) NULL,
    [CompetenzaImp]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [CompetenzaOrd]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [CompetenzaAnt]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [CompetenzaNon]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpDocumento]         DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpResiduo]           DECIMAL (19, 4) DEFAULT (0) NULL,
    [PMValenze]            DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpImmRes]            DECIMAL (19, 4) DEFAULT (0) NULL,
    [FdoOrdRes]            DECIMAL (19, 4) DEFAULT (0) NULL,
    [FdoAntRes]            DECIMAL (19, 4) DEFAULT (0) NULL,
    [QteNonRes]            DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpImmEli]            DECIMAL (19, 4) DEFAULT (0) NULL,
    [FdoOrdEli]            DECIMAL (19, 4) DEFAULT (0) NULL,
    [FdoAntEli]            DECIMAL (19, 4) DEFAULT (0) NULL,
    [QteNonEli]            DECIMAL (19, 4) DEFAULT (0) NULL,
    [CompetenzaImpEuro]    DECIMAL (19, 4) DEFAULT (0) NULL,
    [CompetenzaOrdEuro]    DECIMAL (19, 4) DEFAULT (0) NULL,
    [CompetenzaAntEuro]    DECIMAL (19, 4) DEFAULT (0) NULL,
    [CompetenzaNonEuro]    DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpDocumentoEuro]     DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpResiduoEuro]       DECIMAL (19, 4) DEFAULT (0) NULL,
    [PMValenzeEuro]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpImmResEuro]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [FdoOrdResEuro]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [FdoAntResEuro]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [QteNonResEuro]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpImmEliEuro]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [FdoOrdEliEuro]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [FdoAntEliEuro]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [QteNonEliEuro]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [TotQtaRes]            DECIMAL (16, 6) DEFAULT (0) NULL,
    [TotQtaEli]            DECIMAL (16, 6) DEFAULT (0) NULL,
    [FlgMinUti]            SMALLINT        DEFAULT (0) NULL,
    [CompetenzaImpMax]     DECIMAL (19, 4) DEFAULT (0) NULL,
    [CompetenzaImpMaxEuro] DECIMAL (19, 4) DEFAULT (0) NULL,
    [DataIniziale]         DATETIME        NULL,
    [ImpImmResMax]         DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpImmResMaxEuro]     DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpImmEliMax]         DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpImmEliMaxEuro]     DECIMAL (19, 4) DEFAULT (0) NULL,
    [UTENTEMODIFICA]       VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]         DATETIME        NOT NULL,
    [ImpDocumentoIniz]     DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpDocumentoInizEuro] DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpDocumentoVend]     DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpDocumentoVendEuro] DECIMAL (19, 4) DEFAULT (0) NULL,
    [FDOANNOPREC]          SMALLINT        CONSTRAINT [DF_MOVIMENTICES_FDOANNOPREC] DEFAULT (0) NOT NULL,
    [CodUbicazione]        DECIMAL (5)     CONSTRAINT [DF_MOVIMENTICES_CodUbicazione] DEFAULT (0) NULL,
    [CodNuovaUbic]         DECIMAL (5)     CONSTRAINT [DF_MOVIMENTICES_CodNuovaUbic] DEFAULT (0) NULL,
    [PrcDetrai]            DECIMAL (8, 5)  NULL,
    [NuovaPrcDetrai]       DECIMAL (8, 5)  NULL,
    [ESERCIZIO]            DECIMAL (5)     NULL,
    [ESERCIZIOSTP]         DECIMAL (5)     NULL,
    [TIPORIV]              SMALLINT        DEFAULT ((0)) NULL,
    [FLAGSTP]              SMALLINT        NULL,
    [NRREGCONT]            DECIMAL (10)    NULL,
    [COMPSUPERAMMEURO]     DECIMAL (19, 4) NULL,
    [COMPIPERAMMEURO]      DECIMAL (19, 4) NULL,
    [PRCSUPERAMM]          DECIMAL (8, 5)  CONSTRAINT [DF_MOVIMENTICES_PRCSUPERAMM] DEFAULT ((0)) NULL,
    [PRCIPERAMM]           DECIMAL (8, 5)  CONSTRAINT [DF_MOVIMENTICES_PRCIPERAMM] DEFAULT ((0)) NULL,
    CONSTRAINT [MovimentiCes_PK] PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FlgMinUti_Check] CHECK ([FlgMinUti] = 1 or [FlgMinUti] = 0),
    CONSTRAINT [FK_MOVIMENTICES_CESPITE] FOREIGN KEY ([Cespite]) REFERENCES [dbo].[AnagraficaCespiti] ([Codice])
);


GO
CREATE NONCLUSTERED INDEX [MOVIMENTICES_CESPITE]
    ON [dbo].[MovimentiCes]([Cespite] ASC, [DtaEffettiva] ASC, [Progressivo] ASC);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MovimentiCes] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MovimentiCes] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[MovimentiCes] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MovimentiCes] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MovimentiCes] TO [Metodo98]
    AS [dbo];

