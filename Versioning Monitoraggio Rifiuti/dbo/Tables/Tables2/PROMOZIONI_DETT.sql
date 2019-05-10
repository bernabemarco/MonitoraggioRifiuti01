CREATE TABLE [dbo].[PROMOZIONI_DETT] (
    [RifProgressivo]      DECIMAL (18)    NOT NULL,
    [NrRiga]              INT             NOT NULL,
    [Tipo]                INT             NOT NULL,
    [UM_M]                VARCHAR (3)     NULL,
    [Qta_Minima]          NUMERIC (16, 6) NULL,
    [UM_O]                VARCHAR (3)     NULL,
    [Qta_Omaggio]         NUMERIC (16, 6) NULL,
    [Abbuono]             SMALLINT        NULL,
    [Um_Prezzo]           VARCHAR (3)     NULL,
    [Prezzo_Sost]         SMALLINT        NULL,
    [Sconto_Sost_Esteso]  SMALLINT        NULL,
    [Sconto_Agg_Esteso]   SMALLINT        NULL,
    [Codice_Art_Oma]      VARCHAR (50)    NULL,
    [Qta_Art_Oma]         NUMERIC (16, 6) NULL,
    [UM_A_O]              VARCHAR (3)     NULL,
    [Priorita_Trasm]      INT             NULL,
    [Note]                VARCHAR (2500)  NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NULL,
    [DATAMODIFICA]        DATETIME        NULL,
    [QtaBudget]           DECIMAL (19, 6) NULL,
    [ValoreBudget]        DECIMAL (19, 6) NULL,
    [DataConsuntiv]       DATETIME        NULL,
    [QtaConsuntiv]        DECIMAL (19, 6) NULL,
    [ValoreConsuntiv]     DECIMAL (19, 6) NULL,
    [CONTROPARTITA]       VARCHAR (7)     NULL,
    [QTAORDINATA]         DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [RIFORDINE]           VARCHAR (80)    NULL,
    [CONTROPARTITAPAGATA] VARCHAR (7)     NULL,
    PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [NrRiga] ASC, [Tipo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PROMOZIONI_DETT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PROMOZIONI_DETT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PROMOZIONI_DETT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PROMOZIONI_DETT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PROMOZIONI_DETT] TO [Metodo98]
    AS [dbo];

