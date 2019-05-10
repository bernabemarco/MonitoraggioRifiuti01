CREATE TABLE [dbo].[TMP_ANAGRAFICARISERVATICF] (
    [ESERCIZIO]             DECIMAL (5)     NOT NULL,
    [CODCONTO]              VARCHAR (7)     NOT NULL,
    [CODSETTORE]            DECIMAL (5)     NULL,
    [CODZONA]               DECIMAL (5)     NULL,
    [CODCATEGORIA]          DECIMAL (5)     NULL,
    [CODGRUPPOPREZZIPART]   DECIMAL (5)     NULL,
    [CODGRUPPOPROVPART]     DECIMAL (5)     NULL,
    [CODSPED]               DECIMAL (5)     NULL,
    [PRCTRASPORTO]          VARCHAR (10)    NULL,
    [INOLTROTRASP]          SMALLINT        NULL,
    [CODPAG]                VARCHAR (4)     NULL,
    [MESEESCL1]             SMALLINT        NULL,
    [GGESCL1]               SMALLINT        NULL,
    [MESEESCL2]             SMALLINT        NULL,
    [GGESCL2]               SMALLINT        NULL,
    [CODBANCA]              VARCHAR (7)     NULL,
    [BANCAANAGR]            DECIMAL (5)     NULL,
    [RAGGSCADENZE]          SMALLINT        NULL,
    [CODAGENTE1]            VARCHAR (7)     NULL,
    [CODAGENTE2]            VARCHAR (7)     NULL,
    [CODAGENTE3]            VARCHAR (7)     NULL,
    [PROVV1]                VARCHAR (10)    NULL,
    [PROVV2]                VARCHAR (10)    NULL,
    [PROVV3]                VARCHAR (10)    NULL,
    [SCONTO1]               VARCHAR (10)    NULL,
    [CODIVA]                DECIMAL (5)     NULL,
    [DICHESIVA]             VARCHAR (80)    NULL,
    [LISTINO]               DECIMAL (5)     NULL,
    [CODCAMBIO]             DECIMAL (5)     NULL,
    [DESTDIVMERCI]          DECIMAL (5)     NULL,
    [DESTDIVDOCUMENTI]      DECIMAL (5)     NULL,
    [SPESEDOCUM]            SMALLINT        NULL,
    [SPESEEFFETTO]          SMALLINT        NULL,
    [SPESETRASPORTO]        SMALLINT        NULL,
    [SPESEIMBALLO]          SMALLINT        NULL,
    [FIDO]                  DECIMAL (19, 4) NOT NULL,
    [FIDOEURO]              DECIMAL (19, 4) NOT NULL,
    [PORTO]                 DECIMAL (5)     NULL,
    [TRASPACURA]            DECIMAL (5)     NULL,
    [APPLSCONTORIGA]        VARCHAR (10)    NULL,
    [APPLSCONTOFINALE]      VARCHAR (6)     NULL,
    [CODCONTOFATT]          VARCHAR (7)     NULL,
    [FATTFINEMESE]          SMALLINT        NULL,
    [NONRAGGRUPPDOC]        SMALLINT        NULL,
    [STATOCONTABILITA]      SMALLINT        NULL,
    [STATOMAGAZZINO]        SMALLINT        NULL,
    [STATOORDINI]           SMALLINT        NULL,
    [STATOBOLLE]            SMALLINT        NULL,
    [STATOFATTURE]          SMALLINT        NULL,
    [STATONOTEACCREDITO]    SMALLINT        NULL,
    [STATOALTRO]            SMALLINT        NULL,
    [CODDEPOSITO]           VARCHAR (10)    NULL,
    [CODDEPOSITOCOLL]       VARCHAR (10)    NULL,
    [CODDEPCOMP]            VARCHAR (10)    NULL,
    [CODDEPCOMPCOLL]        VARCHAR (10)    NULL,
    [RIVIVAOMAGGI]          SMALLINT        NULL,
    [NRCONTROPCONT]         SMALLINT        NULL,
    [USAPRZPRVPART]         SMALLINT        NULL,
    [CCDEBITORE]            VARCHAR (12)    NULL,
    [CODDEBITORE]           VARCHAR (16)    NULL,
    [NOTE1]                 VARCHAR (255)   NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]          DATETIME        NOT NULL,
    [DATAINIZIOCALCOLOFIDO] DATETIME        NULL,
    [NUMEROCONTRATTO]       DECIMAL (10)    NULL,
    [EXPORTECOMMERCE]       SMALLINT        NULL,
    [USAPRZCOMMERCIALI]     SMALLINT        NULL,
    PRIMARY KEY CLUSTERED ([ESERCIZIO] ASC, [CODCONTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMP_ANAGRAFICARISERVATICF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMP_ANAGRAFICARISERVATICF] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TMP_ANAGRAFICARISERVATICF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMP_ANAGRAFICARISERVATICF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMP_ANAGRAFICARISERVATICF] TO [Metodo98]
    AS [dbo];

