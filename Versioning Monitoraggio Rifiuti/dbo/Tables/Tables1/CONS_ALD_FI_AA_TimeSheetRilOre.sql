CREATE TABLE [dbo].[CONS_ALD_FI_AA_TimeSheetRilOre] (
    [TestoTestataDoc]           VARCHAR (35)    NULL,
    [DataMov]                   SMALLDATETIME   NOT NULL,
    [TipoMittente]              VARCHAR (3)     NULL,
    [OggettoMittente]           VARCHAR (24)    NOT NULL,
    [OrdineInternoMittente]     VARCHAR (20)    NULL,
    [TipoDestinatario]          VARCHAR (3)     NULL,
    [OggettoDestinatario]       VARCHAR (24)    NOT NULL,
    [OrdineInternoDestinatario] VARCHAR (20)    NULL,
    [IdVDC]                     VARCHAR (10)    NULL,
    [ImportoPeriodo]            DECIMAL (19, 6) NULL,
    [QuantitaOre]               DECIMAL (19, 6) NULL,
    [AltreDescrizioni]          VARCHAR (50)    NULL,
    [IdRespCid]                 VARCHAR (8)     NOT NULL,
    [UtenteModifica]            VARCHAR (25)    NOT NULL,
    [DataModifica]              DATETIME        NOT NULL,
    CONSTRAINT [PK_CONS_ALD_FI_AA_TimeSheetRilOre] PRIMARY KEY CLUSTERED ([DataMov] ASC, [OggettoMittente] ASC, [OggettoDestinatario] ASC, [IdRespCid] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_TimeSheetRilOre] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_TimeSheetRilOre] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_TimeSheetRilOre] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_TimeSheetRilOre] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_TimeSheetRilOre] TO [Metodo98]
    AS [dbo];

