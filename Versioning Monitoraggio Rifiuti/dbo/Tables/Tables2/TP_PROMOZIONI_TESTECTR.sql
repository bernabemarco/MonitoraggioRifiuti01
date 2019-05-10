CREATE TABLE [dbo].[TP_PROMOZIONI_TESTECTR] (
    [Progressivo]           DECIMAL (10)    NOT NULL,
    [ProgressivoCtr]        DECIMAL (10)    NOT NULL,
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
    [CLIFOR]                VARCHAR (7)     DEFAULT ('C') NULL,
    [RifContratto]          DECIMAL (10)    DEFAULT (0) NULL,
    [QtaBudget]             DECIMAL (19, 6) NULL,
    [ValoreBudget]          DECIMAL (19, 6) NULL,
    [DataConsuntiv]         DATETIME        NULL,
    [QtaConsuntiv]          DECIMAL (19, 6) NULL,
    [ValoreConsuntiv]       DECIMAL (19, 6) NULL,
    [BolValidaPerContratti] SMALLINT        DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

CREATE TRIGGER DELETEPROMODETTCONDCTR ON TP_PROMOZIONI_TESTECTR 
FOR DELETE 
AS
   DELETE TP_PROMOZIONI_DETTCTR
    FROM   TP_PROMOZIONI_DETTCTR T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.Progressivo

  DELETE TP_PROMOZIONI_CONDCTR
    FROM   TP_PROMOZIONI_CONDCTR T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.Progressivo





GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_PROMOZIONI_TESTECTR] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_PROMOZIONI_TESTECTR] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_PROMOZIONI_TESTECTR] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_PROMOZIONI_TESTECTR] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_PROMOZIONI_TESTECTR] TO [Metodo98]
    AS [dbo];

