﻿CREATE TABLE [dbo].[GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI] (
    [IDCONTRATTO]          VARCHAR (13)    NOT NULL,
    [SEZIONECONTRATTO]     DECIMAL (5)     NOT NULL,
    [IDRAPPORTO]           VARCHAR (14)    NOT NULL,
    [IdRigaMezzo]          DECIMAL (5)     NOT NULL,
    [IDRAPPORTOAGGREGATO]  VARCHAR (14)    NULL,
    [CodMezzo]             VARCHAR (50)    DEFAULT ('') NULL,
    [DataInserimento]      DATETIME        NULL,
    [DataEliminazione]     DATETIME        NULL,
    [ELIMINATO]            VARCHAR (1)     DEFAULT ('0') NULL,
    [POSIZIONE]            NUMERIC (5)     NULL,
    [SUBPOSIZIONE]         NUMERIC (3)     NULL,
    [UBICAZIONE]           NVARCHAR (50)   NULL,
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
    [FLAG_INST]            CHAR (1)        NULL,
    [STATO]                CHAR (1)        NULL,
    [POSQLIK]              NVARCHAR (50)   NULL,
    [QUANTITA]             NUMERIC (5)     CONSTRAINT [DF_GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI_QUANTITA] DEFAULT ((1)) NULL,
    [TEMPO_MAN]            DECIMAL (5, 2)  DEFAULT ((0)) NULL,
    [IMPORTOAT1]           DECIMAL (12, 4) CONSTRAINT [DF_GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI_IMPORTOAT1] DEFAULT ((0)) NULL,
    [IMPORTOAT2]           DECIMAL (12, 4) CONSTRAINT [DF_GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI_IMPORTOAT2] DEFAULT ((0)) NULL,
    [IMPORTOAT3]           DECIMAL (12, 4) CONSTRAINT [DF_GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI_IMPORTOAT3] DEFAULT ((0)) NULL,
    [IMPORTOAT4]           DECIMAL (12, 4) CONSTRAINT [DF_GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI_IMPORTOAT4] DEFAULT ((0)) NULL,
    [IMPORTOAT5]           DECIMAL (12, 4) CONSTRAINT [DF_GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI_IMPORTOAT5] DEFAULT ((0)) NULL,
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
    [StatoFuoriSede]       SMALLINT        DEFAULT ((0)) NULL,
    [StatoAttivita]        SMALLINT        DEFAULT ((0)) NULL,
    [FLAGAT1]              VARCHAR (1)     DEFAULT ('0') NULL,
    [FLAGAT2]              VARCHAR (1)     DEFAULT ('0') NULL,
    [FLAGAT3]              VARCHAR (1)     DEFAULT ('0') NULL,
    [FLAGAT4]              VARCHAR (1)     DEFAULT ('0') NULL,
    [FLAGAT5]              VARCHAR (1)     DEFAULT ('0') NULL,
    [FLAGRICARICA]         VARCHAR (1)     DEFAULT ('0') NULL,
    [DATA_REV]             DATETIME        NULL,
    [DATA_PREV]            DATETIME        NULL,
    [DATA_COLL]            DATETIME        NULL,
    [DATA_PCOLL]           DATETIME        NULL,
    [PRESSIONE_DIN]        NUMERIC (10, 2) NULL,
    [PRESSIONE_STA]        NUMERIC (10, 2) NULL,
    [CAMPO01]              SMALLINT        NULL,
    [CAMPO02]              SMALLINT        NULL,
    [CAMPO03]              SMALLINT        NULL,
    [CAMPO04]              SMALLINT        NULL,
    [CAMPO05]              SMALLINT        NULL,
    [CAMPO06]              SMALLINT        NULL,
    [CAMPO07]              SMALLINT        NULL,
    [CAMPO08]              SMALLINT        NULL,
    [CAMPO09]              SMALLINT        NULL,
    [CAMPO10]              SMALLINT        NULL,
    [CAMPO11]              SMALLINT        NULL,
    [CAMPO12]              SMALLINT        NULL,
    [CAMPO13]              SMALLINT        NULL,
    [CAMPO14]              SMALLINT        NULL,
    [CAMPO15]              SMALLINT        NULL,
    [CAMPO16]              SMALLINT        NULL,
    [CAMPO17]              SMALLINT        NULL,
    [CAMPO18]              SMALLINT        NULL,
    [CAMPO19]              SMALLINT        NULL,
    [CAMPO20]              SMALLINT        NULL,
    [CAMPO21]              SMALLINT        NULL,
    [CAMPO22]              SMALLINT        NULL,
    [CAMPO23]              SMALLINT        NULL,
    [CAMPO24]              SMALLINT        NULL,
    [CAMPO25]              SMALLINT        NULL,
    [CAMPO26]              SMALLINT        NULL,
    [CAMPO27]              SMALLINT        NULL,
    [CAMPO28]              SMALLINT        NULL,
    [CAMPO29]              SMALLINT        NULL,
    [CAMPO30]              SMALLINT        NULL,
    [CAMPO31]              SMALLINT        NULL,
    [CAMPO32]              SMALLINT        NULL,
    [CAMPO33]              SMALLINT        NULL,
    [CAMPO34]              SMALLINT        NULL,
    [CAMPO35]              SMALLINT        NULL,
    [CAMPO36]              SMALLINT        NULL,
    [CAMPO37]              SMALLINT        NULL,
    [CAMPO38]              SMALLINT        NULL,
    [CAMPO39]              SMALLINT        NULL,
    [CAMPO40]              SMALLINT        NULL,
    [CAMPO41]              SMALLINT        NULL,
    [CAMPO42]              SMALLINT        NULL,
    [CAMPO43]              SMALLINT        NULL,
    [CAMPO44]              SMALLINT        NULL,
    [CAMPO45]              SMALLINT        NULL,
    [CAMPO46]              SMALLINT        NULL,
    [CAMPO47]              SMALLINT        NULL,
    [CAMPO48]              SMALLINT        NULL,
    [CAMPO49]              SMALLINT        NULL,
    [CAMPO50]              SMALLINT        NULL,
    [SEGNALATO]            SMALLINT        NULL,
    [NUOVARIGA]            CHAR (1)        NULL,
    [UTENTEMODIFICA]       VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]         DATETIME        NOT NULL,
    [UltimaAttivitaEseg]   CHAR (1)        NULL,
    [CodiceMezzoChekList]  VARCHAR (50)    NULL,
    [VersioneChekList]     DECIMAL (5)     DEFAULT ((0)) NULL,
    [TitoloChekList]       VARCHAR (80)    NULL,
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
    CONSTRAINT [GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI_PK] PRIMARY KEY CLUSTERED ([IDCONTRATTO] ASC, [SEZIONECONTRATTO] ASC, [IDRAPPORTO] ASC, [IdRigaMezzo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI] TO [Metodo98]
    AS [dbo];

