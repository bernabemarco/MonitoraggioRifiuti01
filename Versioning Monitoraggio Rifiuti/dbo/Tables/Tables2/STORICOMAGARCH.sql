CREATE TABLE [dbo].[STORICOMAGARCH] (
    [PROGRESSIVO]         DECIMAL (10)    NOT NULL,
    [CODART]              VARCHAR (50)    NOT NULL,
    [CODCLIFOR]           VARCHAR (7)     NULL,
    [CODCAUSALE]          DECIMAL (5)     NOT NULL,
    [DATAMOV]             DATETIME        NULL,
    [QUANTITACARICO]      SMALLINT        NULL,
    [VALORECARICO]        SMALLINT        NULL,
    [QUANTITASCARICO]     SMALLINT        NULL,
    [VALORESCARICO]       SMALLINT        NULL,
    [GIACENZA]            SMALLINT        NULL,
    [ORDINATO]            SMALLINT        NULL,
    [IMPEGNATO]           SMALLINT        NULL,
    [GIACENZA2UM]         SMALLINT        NULL,
    [ORDINATO2UM]         SMALLINT        NULL,
    [IMPEGNATO2UM]        SMALLINT        NULL,
    [QTA1UM]              DECIMAL (16, 6) NOT NULL,
    [QTA2UM]              DECIMAL (16, 6) NOT NULL,
    [LISTINO]             INT             NULL,
    [IMPORTOTOTLORDO]     DECIMAL (19, 4) NOT NULL,
    [IMPORTOTOTLORDOVAL]  DECIMAL (19, 4) NOT NULL,
    [IMPORTOTOTLORDOEURO] DECIMAL (19, 4) NOT NULL,
    [SCONTO]              VARCHAR (20)    NULL,
    [IMPORTOTOTNETTO]     DECIMAL (19, 4) NOT NULL,
    [IMPORTOTOTNETTOVAL]  DECIMAL (19, 4) NOT NULL,
    [IMPORTOTOTNETTOEURO] DECIMAL (19, 4) NOT NULL,
    [CODCAMBIO]           DECIMAL (5)     NULL,
    [VALCAMBIO]           DECIMAL (13, 6) NOT NULL,
    [GENVENACQ]           VARCHAR (7)     NULL,
    [IDDISTINTABASE]      VARCHAR (6)     NULL,
    [NRIFDOC]             VARCHAR (15)    NULL,
    [DATARIFDOC]          DATETIME        NULL,
    [RIFERIMENTI]         VARCHAR (80)    NULL,
    [DESTDIV]             DECIMAL (5)     NULL,
    [NRIFPARTITA]         VARCHAR (15)    NULL,
    [CODPAG]              VARCHAR (4)     NULL,
    [PROGRCOLLEGATO]      DECIMAL (10)    NULL,
    [CONTOCDCMOV]         VARCHAR (10)    NULL,
    [CODDEPOSITO]         VARCHAR (10)    NOT NULL,
    [CODUBICAZIONE]       VARCHAR (10)    NULL,
    [TIPODOC]             VARCHAR (3)     NULL,
    [NUMERODOC]           INT             NULL,
    [BIS]                 CHAR (1)        NULL,
    [RIGADOC]             INT             NULL,
    [IDTESTA]             DECIMAL (10)    NULL,
    [VARIANTE]            VARCHAR (100)   NULL,
    [TIPOMOV]             SMALLINT        NULL,
    [RIGACOMP]            SMALLINT        NULL,
    [ESERCIZIO]           DECIMAL (5)     NOT NULL,
    [CODCOMMESSA]         VARCHAR (30)    NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    [ProgMovVBanco]       DECIMAL (10)    NULL,
    [DATADISP]            DATETIME        NULL,
    [Reso]                SMALLINT        NOT NULL,
    [RigaCauz]            INT             NOT NULL,
    [SPESERIPMAG]         DECIMAL (19, 4) NULL,
    [SPESERIPMAGVAL]      DECIMAL (19, 4) NULL,
    [SPESERIPMAGEURO]     DECIMAL (19, 4) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[STORICOMAGARCH] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[STORICOMAGARCH] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[STORICOMAGARCH] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[STORICOMAGARCH] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[STORICOMAGARCH] TO [Metodo98]
    AS [dbo];

