CREATE TABLE [dbo].[CRM_ALD_TabRiffOfferta] (
    [idOffertaCRM]            VARCHAR (100)   NOT NULL,
    [dataEmissioneOfferta]    DATETIME        NULL,
    [dataRichiestaOfferta]    DATETIME        NULL,
    [CodCliFor]               VARCHAR (7)     NULL,
    [codAgente1]              VARCHAR (7)     NULL,
    [CodAgente2]              VARCHAR (7)     NULL,
    [TotaleNettoComplessivo]  DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [TotaleNettoDiTrattativa] DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [IdAsa]                   VARCHAR (2)     NULL,
    [IdSottoAsa]              VARCHAR (5)     NULL,
    [idSocietaRif]            VARCHAR (20)    NULL,
    [ProtocolloPadre]         VARCHAR (100)   NULL,
    [NumRevisione]            INT             DEFAULT ((0)) NULL,
    [StatoOfferta]            VARCHAR (50)    NULL,
    [Esito]                   VARCHAR (50)    NULL,
    [TipoOfferta]             VARCHAR (50)    NULL,
    [AutoreDocumento]         VARCHAR (100)   NULL,
    [TrattativaApprovataDa]   VARCHAR (100)   NULL,
    [TotPercScontoTrattativa] DECIMAL (19, 2) DEFAULT ((0)) NULL,
    [OggettoOfferta]          VARCHAR (300)   NULL,
    [IdDivisione]             SMALLINT        DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]          VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]            DATETIME        NOT NULL,
    [ProtocolloOfferta]       VARCHAR (100)   NULL,
    [FlagValida]              SMALLINT        DEFAULT ((0)) NULL,
    CONSTRAINT [PK_CRM_ALD_TabRiffOfferta] PRIMARY KEY CLUSTERED ([idOffertaCRM] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_ALD_TabRiffOfferta] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_ALD_TabRiffOfferta] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_ALD_TabRiffOfferta] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_ALD_TabRiffOfferta] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_ALD_TabRiffOfferta] TO [Metodo98]
    AS [dbo];

