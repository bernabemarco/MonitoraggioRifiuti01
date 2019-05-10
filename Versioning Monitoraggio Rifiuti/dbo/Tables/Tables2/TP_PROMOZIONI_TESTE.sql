CREATE TABLE [dbo].[TP_PROMOZIONI_TESTE] (
    [Progressivo]           DECIMAL (10)    NOT NULL,
    [NumeroCampagna]        VARCHAR (3)     NOT NULL,
    [Descrizione]           VARCHAR (50)    NULL,
    [Data_Inizio]           DATETIME        NULL,
    [Data_Fine]             DATETIME        NULL,
    [Attiv_Disat]           SMALLINT        NOT NULL,
    [Sconto_M_O]            SMALLINT        NOT NULL,
    [Tipo]                  SMALLINT        NOT NULL,
    [UM_M]                  VARCHAR (3)     NULL,
    [Qta_M]                 NUMERIC (16, 6) NULL,
    [Prezzo_M]              NUMERIC (19, 6) NULL,
    [Prezzo_M_Euro]         NUMERIC (19, 6) NULL,
    [Agg_Sost]              SMALLINT        NULL,
    [UtenteModifica]        VARCHAR (25)    NOT NULL,
    [DataModifica]          DATETIME        NOT NULL,
    [SuNonEvad]             SMALLINT        NULL,
    [ScontoSost]            VARCHAR (20)    NULL,
    [ScontoAgg]             VARCHAR (20)    NULL,
    [ScontoFinale]          VARCHAR (20)    NULL,
    [piudicui]              SMALLINT        NULL,
    [CodPag]                VARCHAR (4)     NULL,
    [Note]                  VARCHAR (2500)  NULL,
    [CLIFOR]                VARCHAR (7)     CONSTRAINT [DF_TP_PROMOZIONI_TESTE_CliFor] DEFAULT ('C') NULL,
    [RifContratto]          DECIMAL (10)    CONSTRAINT [DF_TP_PROMOZIONI_TESTE_RifContratto] DEFAULT (0) NULL,
    [QtaBudget]             DECIMAL (19, 6) NULL,
    [ValoreBudget]          DECIMAL (19, 6) NULL,
    [DataConsuntiv]         DATETIME        NULL,
    [QtaConsuntiv]          DECIMAL (19, 6) NULL,
    [ValoreConsuntiv]       DECIMAL (19, 6) NULL,
    [BolValidaPerContratti] SMALLINT        DEFAULT (0) NULL,
    [CONFMERC]              SMALLINT        DEFAULT ((0)) NULL,
    [QTA_M_PRODOFF]         NUMERIC (16, 6) DEFAULT ((0)) NULL,
    [UM_M_PRODOFF]          VARCHAR (3)     NULL,
    [TIPOSCONTOARTOMA]      SMALLINT        DEFAULT ((0)) NULL,
    [ABILITAPRZARTOMA]      SMALLINT        DEFAULT ((0)) NULL,
    [ABILITASCTARTOMA]      SMALLINT        DEFAULT ((0)) NULL,
    [VISPREZZI]             SMALLINT        DEFAULT ((0)) NULL,
    [GRUPPOPRZCF]           DECIMAL (5)     NULL,
    [RAGGRUPPATAMISTA]      SMALLINT        DEFAULT ((0)) NULL,
    [MINIMOPRODOTTI]        DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [data_inizio_out]       DATETIME        NULL,
    [data_fine_out]         DATETIME        NULL,
    [CODSETTORE]            DECIMAL (5)     DEFAULT ((0)) NULL,
    [CODZONA]               DECIMAL (5)     DEFAULT ((0)) NULL,
    [CODCATEGORIA]          DECIMAL (5)     DEFAULT ((0)) NULL,
    [PRIORITA]              SMALLINT        CONSTRAINT [DF_TP_PROMOZIONI_TESTE_PRIORITA] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__TP_PROMO_TESTE] PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

CREATE TRIGGER TD_CANCELLA_TP_RELPROMOCLIFOR   ON TP_PROMOZIONI_TESTE
FOR  DELETE 
AS


   BEGIN	
       DELETE TP_RELPROMOCLIFOR
       FROM    TP_RELPROMOCLIFOR T2, DELETED T1
       WHERE  T2.PROMOZIONE = T1.PROGRESSIVO
    END


GO

CREATE TRIGGER DELETEPROMODETTCOND ON TP_PROMOZIONI_TESTE 
FOR DELETE 
AS
   DELETE TP_PROMOZIONI_DETT
    FROM   TP_PROMOZIONI_DETT T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.Progressivo

  DELETE TP_PROMOZIONI_COND
    FROM   TP_PROMOZIONI_COND T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.Progressivo




GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_PROMOZIONI_TESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_PROMOZIONI_TESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_PROMOZIONI_TESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_PROMOZIONI_TESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_PROMOZIONI_TESTE] TO [Metodo98]
    AS [dbo];

