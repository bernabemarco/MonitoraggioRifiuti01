CREATE TABLE [dbo].[GEM_STO_SEZIONICONTRATTODETTMEZZI] (
    [IDCONTRATTO]          VARCHAR (13)    NOT NULL,
    [SEZIONECONTRATTO]     DECIMAL (5)     NOT NULL,
    [IdRigaMezzo]          DECIMAL (5)     NOT NULL,
    [CodMezzo]             VARCHAR (50)    DEFAULT ('') NULL,
    [IdOldMezzo]           NUMERIC (18)    NULL,
    [DataInserimento]      DATETIME        NULL,
    [DataEliminazione]     DATETIME        NULL,
    [ELIMINATO]            VARCHAR (1)     DEFAULT ('0') NULL,
    [POSIZIONE]            NUMERIC (5)     NULL,
    [SUBPOSIZIONE]         NUMERIC (3)     NULL,
    [UBICAZIONE]           VARCHAR (50)    NULL,
    [POSCLIENTE]           VARCHAR (10)    NULL,
    [NOTE]                 VARCHAR (900)   NULL,
    [ORDINE]               NUMERIC (18)    NULL,
    [CarTesto1]            VARCHAR (50)    NULL,
    [CarTesto2]            VARCHAR (50)    NULL,
    [CarTesto3]            VARCHAR (50)    NULL,
    [CarTesto4]            VARCHAR (50)    NULL,
    [CarTesto5]            VARCHAR (50)    NULL,
    [CarTesto6]            VARCHAR (50)    NULL,
    [CarTesto7]            VARCHAR (50)    NULL,
    [CarTesto8]            VARCHAR (50)    NULL,
    [CarTesto9]            VARCHAR (50)    NULL,
    [CodiceBarre]          VARCHAR (50)    NULL,
    [OMOLOGATO]            CHAR (1)        NULL,
    [ANNO]                 NUMERIC (5)     NULL,
    [FLAG_INST]            VARCHAR (1)     NULL,
    [STATO]                VARCHAR (1)     NULL,
    [POSQLIK]              VARCHAR (50)    NULL,
    [QUANTITA]             NUMERIC (5)     DEFAULT ((1)) NULL,
    [TEMPO_MAN]            DECIMAL (5, 2)  DEFAULT ((0)) NULL,
    [IMPORTOAT1]           DECIMAL (12, 4) DEFAULT ((0)) NULL,
    [IMPORTOAT2]           DECIMAL (12, 4) DEFAULT ((0)) NULL,
    [IMPORTOAT3]           DECIMAL (12, 4) DEFAULT ((0)) NULL,
    [IMPORTOAT4]           DECIMAL (12, 4) DEFAULT ((0)) NULL,
    [IMPORTOAT5]           DECIMAL (12, 4) DEFAULT ((0)) NULL,
    [SCONTOAT1]            NUMERIC (10, 2) NULL,
    [SCONTOAT2]            NUMERIC (10, 2) NULL,
    [SCONTOAT3]            NUMERIC (10, 2) NULL,
    [SCONTOAT4]            NUMERIC (10, 2) NULL,
    [SCONTOAT5]            NUMERIC (10, 2) NULL,
    [PROV1AT1]             NUMERIC (10, 2) NULL,
    [PROV1AT2]             NUMERIC (10, 2) NULL,
    [PROV1AT3]             NUMERIC (10, 2) NULL,
    [PROV1AT4]             NUMERIC (10, 2) NULL,
    [PROV1AT5]             NUMERIC (10, 2) NULL,
    [PROV2AT1]             NUMERIC (10, 2) NULL,
    [PROV2AT2]             NUMERIC (10, 2) NULL,
    [PROV2AT3]             NUMERIC (10, 2) NULL,
    [PROV2AT4]             NUMERIC (10, 2) NULL,
    [PROV2AT5]             NUMERIC (10, 2) NULL,
    [PROV3AT1]             NUMERIC (10, 2) NULL,
    [PROV3AT2]             NUMERIC (10, 2) NULL,
    [PROV3AT3]             NUMERIC (10, 2) NULL,
    [PROV3AT4]             NUMERIC (10, 2) NULL,
    [PROV3AT5]             NUMERIC (10, 2) NULL,
    [DATA_REV]             DATETIME        NULL,
    [DATA_PREV]            DATETIME        NULL,
    [DATA_COLL]            DATETIME        NULL,
    [DATA_PCOLL]           DATETIME        NULL,
    [StatoFuoriSede]       SMALLINT        DEFAULT ((0)) NULL,
    [Proprieta]            SMALLINT        DEFAULT ((0)) NOT NULL,
    [Cespiste]             SMALLINT        DEFAULT ((0)) NOT NULL,
    [ValoreCespite]        DECIMAL (12, 4) DEFAULT ((0)) NULL,
    [DATAMODIFICA]         DATETIME        NOT NULL,
    [UTENTEMODIFICA]       NVARCHAR (25)   NOT NULL,
    [UltimaAttivitaEseg]   CHAR (1)        NULL,
    [IDCONTRATTOPREC]      VARCHAR (13)    NULL,
    [SEZIONECONTRATTOPREC] DECIMAL (5)     NULL,
    [IDRIGAMEZZOPREC]      DECIMAL (5)     NULL,
    [AnnotazioniTecnica]   VARCHAR (900)   NULL,
    [idRapportoUltimVista] VARCHAR (14)    NULL,
    [DataUltimaVisita]     DATETIME        NULL,
    [RifLinkImmagine]      VARCHAR (300)   NULL,
    [CodiceEdificio]       VARCHAR (30)    NULL,
    [CodiceLivello]        VARCHAR (50)    NULL,
    [CodiceVano]           VARCHAR (50)    NULL,
    [PosizioneMappa]       VARCHAR (50)    NULL,
    [CodBarCoord]          VARCHAR (50)    NULL,
    [TipologiaBarre]       SMALLINT        NULL,
    CONSTRAINT [GEM_STO_SEZIONICONTRATTODETTMEZZI_PK] PRIMARY KEY CLUSTERED ([IDCONTRATTO] ASC, [SEZIONECONTRATTO] ASC, [IdRigaMezzo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_STO_SEZIONICONTRATTODETTMEZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_STO_SEZIONICONTRATTODETTMEZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_STO_SEZIONICONTRATTODETTMEZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_STO_SEZIONICONTRATTODETTMEZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_STO_SEZIONICONTRATTODETTMEZZI] TO [Metodo98]
    AS [dbo];

