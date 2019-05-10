CREATE TABLE [dbo].[TP_ExtraMag] (
    [CodArt]                     VARCHAR (50)    NOT NULL,
    [Stato_Rev_Sos_Esa]          VARCHAR (1)     CONSTRAINT [DF_TP_ExtraMag_Stato_Rev_Sos_Esa] DEFAULT ('') NULL,
    [TP_Promo_com]               VARCHAR (4)     CONSTRAINT [DF_TP_ExtraMag_TP_Promo_com] DEFAULT ('') NULL,
    [Estemporaneo]               CHAR (1)        CONSTRAINT [DF_TP_ExtraMag_Estemporaneo] DEFAULT (0) NULL,
    [CodiceOmogeneo]             VARCHAR (7)     CONSTRAINT [DF_TP_ExtraMag_CodiceOmogeneo] DEFAULT ('') NULL,
    [TP_Consenti_PrezziSpeciali] CHAR (1)        CONSTRAINT [DF_TP_ExtraMag_TP_Consenti_PrezziSpeciali] DEFAULT ('') NULL,
    [TP_SCORPORO]                CHAR (1)        CONSTRAINT [DF_TP_ExtraMag_TP_SCORPORO] DEFAULT (0) NULL,
    [TP_PeriododiOsservazione]   NUMERIC (10)    CONSTRAINT [DF_TP_ExtraMag_TP_PeriododiOsservazione] DEFAULT (0) NULL,
    [TP_Espositore]              CHAR (1)        CONSTRAINT [DF_TP_EXTRAMAG_TP_ESPOSITORE] DEFAULT ('') NULL,
    [TP_GgConsegna]              NUMERIC (18)    CONSTRAINT [DF_TP_ExtraMag_TP_GgConsegna] DEFAULT (0) NULL,
    [TP_MesiScade]               NUMERIC (18)    CONSTRAINT [DF_TP_ExtraMag_TP_MesiScade] DEFAULT (0) NULL,
    [TP_AssInde]                 CHAR (1)        CONSTRAINT [DF_TP_ExtraMag_TP_AssInde] DEFAULT ('') NULL,
    [TP_CodiceInterno]           VARCHAR (20)    CONSTRAINT [DF_TP_ExtraMag_TP_CodiceInterno] DEFAULT ('') NULL,
    [TP_Tsicur]                  NUMERIC (18)    CONSTRAINT [DF_TP_ExtraMag_TP_Tsicur] DEFAULT (0) NULL,
    [CodFamigliaPOS]             DECIMAL (5)     CONSTRAINT [DF_TP_ExtraMag_CodFamigliaPOS] DEFAULT (0) NULL,
    [CodRepartoPOS]              DECIMAL (5)     CONSTRAINT [DF_TP_ExtraMag_CodRepartoPOS] DEFAULT (0) NULL,
    [AttivaPanieri]              SMALLINT        CONSTRAINT [DF__TP_ExtraM__AttivaPanieri] DEFAULT (0) NULL,
    [NonAQta]                    SMALLINT        CONSTRAINT [DF__TP_ExtraM__NonAQta] DEFAULT (0) NULL,
    [NonScontabile]              SMALLINT        CONSTRAINT [DF__TP_ExtraM__NonScontabile] DEFAULT (0) NULL,
    [Disattivato]                SMALLINT        CONSTRAINT [DF__TP_ExtraM__Disattivato] DEFAULT (0) NULL,
    [ABilancia]                  SMALLINT        CONSTRAINT [DF__TP_ExtraM__ABilancia] DEFAULT (0) NULL,
    [PrezzoRichiesto]            SMALLINT        CONSTRAINT [DF__TP_ExtraM__PrezzoRichiesto] DEFAULT (0) NULL,
    [AbilitaReso]                SMALLINT        CONSTRAINT [DF__TP_ExtraM__AbilitaReso] DEFAULT (0) NULL,
    [InCampagna]                 SMALLINT        CONSTRAINT [DF__TP_ExtraM__InCampagna] DEFAULT (0) NULL,
    [NrBollini]                  SMALLINT        CONSTRAINT [DF__TP_ExtraM__NrBollini] DEFAULT (0) NULL,
    [NrBolliniDip]               SMALLINT        CONSTRAINT [DF__TP_ExtraM__NrBolliniDip] DEFAULT (0) NULL,
    [GruppoSconto]               SMALLINT        CONSTRAINT [DF__TP_ExtraM__GruppoSconto] DEFAULT (0) NULL,
    [GruppoMixMatch]             SMALLINT        CONSTRAINT [DF__TP_ExtraM__GruppoMixMatch] DEFAULT (0) NULL,
    [GruppoMxN]                  SMALLINT        CONSTRAINT [DF__TP_ExtraM__GruppoMxN] DEFAULT (0) NULL,
    [UtenteModifica]             VARCHAR (25)    NOT NULL,
    [DataModifica]               DATETIME        NOT NULL,
    [ConsidAcq]                  SMALLINT        CONSTRAINT [DF_TP_ExtraMag_ConsidAcq] DEFAULT (0) NULL,
    [EspP1]                      VARCHAR (2)     CONSTRAINT [DF_TP_ExtraMag_EspP1] DEFAULT ((-1)) NULL,
    [EspP2]                      VARCHAR (2)     CONSTRAINT [DF_TP_ExtraMag_EspP2] DEFAULT ((-1)) NULL,
    [EspP3]                      VARCHAR (2)     CONSTRAINT [DF_TP_ExtraMag_EspP3] DEFAULT ((-1)) NULL,
    [EspP4]                      VARCHAR (2)     CONSTRAINT [DF_TP_ExtraMag_EspP4] DEFAULT ((-1)) NULL,
    [EspLst]                     DECIMAL (5)     CONSTRAINT [DF_TP_ExtraMag_EspLst] DEFAULT (0) NULL,
    [Esportabile]                SMALLINT        CONSTRAINT [DF_TP_ExtraMag_Esportabile] DEFAULT (0) NULL,
    [EspMovMag]                  SMALLINT        CONSTRAINT [DF_TP_ExtraMag_EspMovMag] DEFAULT (0) NULL,
    [GestStag]                   SMALLINT        CONSTRAINT [DF_TP_ExtraMag_GestStag] DEFAULT (0) NULL,
    [DataNascProd]               DATETIME        NULL,
    [DataFineSegn]               DATETIME        NULL,
    [TIPOGESTESP]                SMALLINT        CONSTRAINT [DF_TP_EXTRAMAG_TIPOGESTESP] DEFAULT ((0)) NULL,
    [GESTVARCOMP]                SMALLINT        CONSTRAINT [DF_TP_EXTRAMAG_GESTVARCOMP] DEFAULT ((-1)) NULL,
    [TipoValKitPadre]            SMALLINT        NULL,
    [TipoValKitComponenti]       SMALLINT        NULL,
    [CodiceOmogeneoPassivo]      VARCHAR (7)     CONSTRAINT [DF_TP_EXTRAMAG_CODICEOMOGENEOPASSIVO] DEFAULT ('') NULL,
    [TipoGstSctLogistici]        VARCHAR (1)     CONSTRAINT [DF_TP_EXTRAMAG_TipoGstSctLogistici] DEFAULT ('E') NULL,
    [EscludiVal]                 SMALLINT        DEFAULT ((0)) NULL,
    [MESINOMOV]                  DECIMAL (5)     DEFAULT ((0)) NULL,
    [CANCSEMESINOMOV]            DECIMAL (5)     DEFAULT ((0)) NULL,
    [MISS_GestisciTipoCalcLotto] SMALLINT        DEFAULT ((0)) NULL,
    [MISS_TipoCalcGstLotto]      SMALLINT        DEFAULT ((0)) NULL,
    [CodMarchio]                 VARCHAR (50)    DEFAULT ('') NULL,
    [OFTIPOPREVISIONALE]         SMALLINT        DEFAULT ((0)) NULL,
    [OFSMOOTHINGSTAGIONALE]      SMALLINT        DEFAULT ((0)) NULL,
    [OFSMOOTHINGALFA]            DECIMAL (2, 1)  DEFAULT ((0)) NULL,
    [OFSMOOTHINGBETA]            DECIMAL (2, 1)  CONSTRAINT [DF_TPEXTRAMAG_OFSMOOTHINGBETA] DEFAULT ((0)) NULL,
    [OFMEDIAMOBILEPERIODI]       SMALLINT        DEFAULT ((0)) NULL,
    [OFArrQtaInOrd]              SMALLINT        CONSTRAINT [DF_TP_EXTRAMAG_OFArrQtaInOrd] DEFAULT ((0)) NULL,
    [OFCODARTRIF]                VARCHAR (50)    CONSTRAINT [DF_TP_EXTRAMAG_OFCODARTRIF] DEFAULT ('') NULL,
    [USAPREVISIONIFORZATE]       SMALLINT        DEFAULT ((0)) NULL,
    [QTAPREVISIONIFORZATE]       DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [UMPREVISIONIFORZATE]        VARCHAR (3)     DEFAULT ('') NULL,
    [UTENTEPREVISIONIFORZATE]    VARCHAR (25)    DEFAULT ('') NULL,
    [DATAPREVISIONIFORZATE]      DATETIME        DEFAULT (getdate()) NULL,
    [gruppoapprovvigionamento]   DECIMAL (5)     DEFAULT ((0)) NULL,
    [livelloservizio]            DECIMAL (5, 2)  DEFAULT ((0)) NULL,
    [costoordinazione]           DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [indicecostomantenimento]    DECIMAL (5, 2)  DEFAULT ((0)) NULL,
    [tassomantenimento]          DECIMAL (5, 2)  DEFAULT ((0)) NULL,
    [fattorescostamento]         DECIMAL (5, 2)  DEFAULT ((0)) NULL,
    [RaeeGestione]               SMALLINT        DEFAULT ((0)) NULL,
    [RaeeValore]                 DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [RaeeGenericoAcq]            VARCHAR (7)     DEFAULT ('') NULL,
    [RaeeGenericoVen]            VARCHAR (7)     DEFAULT ('') NULL,
    [RaeeUm]                     VARCHAR (3)     DEFAULT ('') NULL,
    [RaeeCodice]                 VARCHAR (10)    DEFAULT ('') NULL,
    [USAALFAFORZ]                SMALLINT        CONSTRAINT [DF_TP_EXTRAMAG_USAALFAFORZ] DEFAULT ((0)) NULL,
    [OFSMOOTHINGALFA_FORZ]       DECIMAL (2, 1)  CONSTRAINT [DF_TP_EXTRAMAG_OFSMOOTHINGALFA_FORZ] DEFAULT ((0)) NULL,
    [USAPERIODOFORZ]             SMALLINT        CONSTRAINT [DF_TP_EXTRAMAG_USAPERIODOFORZ] DEFAULT ((0)) NULL,
    [OFMEDIAMOBILEPERIODI_FORZ]  SMALLINT        CONSTRAINT [DF_TP_EXTRAMAG_OFMEDIAMOBILEPERIODI_FORZ] DEFAULT ((0)) NULL,
    [CostoAcquisto]              SMALLINT        DEFAULT ((0)) NULL,
    [CodListinoCA]               DECIMAL (5)     DEFAULT ((0)) NULL,
    [MODALITACALCOLO]            SMALLINT        CONSTRAINT [DF_TP_EXTRAMAG_MODALITACALCOLO] DEFAULT ((0)) NULL,
    [NETTIFICADISPONIBILITA]     SMALLINT        CONSTRAINT [DF_TP_EXTRAMAG_NETTIFICADISPONIBILITA] DEFAULT ((1)) NULL,
    [OFSMOOTHINGALFA_WT]         DECIMAL (2, 1)  DEFAULT ((0)) NULL,
    [OFSMOOTHINGBETA_WT]         DECIMAL (2, 1)  DEFAULT ((0)) NULL,
    [SOMMAQTASTAT]               SMALLINT        DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([CodArt] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [Index_Cod_Omogeneo]
    ON [dbo].[TP_ExtraMag]([CodiceOmogeneo] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_ORDINEFORNITORE_TPEXTRAMAG_1]
    ON [dbo].[TP_ExtraMag]([ConsidAcq] ASC)
    INCLUDE([CodArt], [TP_PeriododiOsservazione]);


GO
CREATE TRIGGER TD_TP_EXTRAMAG ON  TP_EXTRAMAG FOR DELETE AS
BEGIN

	DECLARE
	@NUMROWS INT,
	@ERRNO INT,
	@ERRMSG VARCHAR(255)

	SELECT @NUMROWS = @@ROWCOUNT
	IF @NUMROWS = 0
	RETURN

	/*  DELETE ALL CHILDREN IN "TP_ESPOSITORE"  */
    DELETE TP_ESPOSITORE
    FROM   TP_ESPOSITORE T2, DELETED T1
    WHERE  T2.CODICE = T1.CODART
		AND T1.TP_ESPOSITORE = 'x'
    
	/*  DELETE ALL CHILDREN IN "TP_ESPOSITORE"  */
    DELETE TP_ESPOSITORE
    FROM   TP_ESPOSITORE T2, DELETED T1
    WHERE  T2.CODICEART = T1.CODART

	RETURN

	-- ERRORS HANDLING
	ERROR:
	RAISERROR (@ERRMSG, 1, 1)
	ROLLBACK TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ExtraMag] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ExtraMag] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ExtraMag] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ExtraMag] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ExtraMag] TO [Metodo98]
    AS [dbo];

