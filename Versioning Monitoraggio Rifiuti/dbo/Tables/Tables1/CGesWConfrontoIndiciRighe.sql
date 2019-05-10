CREATE TABLE [dbo].[CGesWConfrontoIndiciRighe] (
    [NrTerminale]       DECIMAL (5)     NOT NULL,
    [CodDestinazione]   VARCHAR (10)    NOT NULL,
    [Tipo]              SMALLINT        NOT NULL,
    [UMPrimaria]        VARCHAR (5)     DEFAULT ('') NULL,
    [UMPrimaria2]       VARCHAR (5)     DEFAULT ('') NULL,
    [UMSecondaria]      VARCHAR (5)     DEFAULT ('') NULL,
    [UMSecondaria2]     VARCHAR (5)     DEFAULT ('') NULL,
    [TipoMisurazione]   SMALLINT        DEFAULT (0) NULL,
    [IndiceVar101]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar102]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar103]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar104]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis201]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis202]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis203]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis204]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec01]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec02]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec03]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceVar1Sec04]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec01]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec02]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec03]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceFis2Sec04]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceVar101]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceVar102]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceVar103]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceVar104]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceFis201]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceFis202]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceFis203]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceFis204]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceVar1Sec01] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceVar1Sec02] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceVar1Sec03] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceVar1Sec04] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceFis2Sec01] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceFis2Sec02] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceFis2Sec03] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceFis2Sec04] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceVar101]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceVar102]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceVar103]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceVar104]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceFis201]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceFis202]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceFis203]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceFis204]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceVar1Sec01] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceVar1Sec02] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceVar1Sec03] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceVar1Sec04] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceFis2Sec01] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceFis2Sec02] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceFis2Sec03] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceFis2Sec04] DECIMAL (19, 6) DEFAULT (0) NULL,
    [DesMisurazione1]   VARCHAR (80)    DEFAULT ('') NULL,
    [DesMisurazione2]   VARCHAR (80)    DEFAULT ('') NULL,
    [DesMisurazione3]   VARCHAR (80)    DEFAULT ('') NULL,
    [DesMisurazione4]   VARCHAR (80)    DEFAULT ('') NULL,
    [IndiceTot101]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceTot102]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceTot103]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceTot104]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceTot1Sec01]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceTot1Sec02]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceTot1Sec03]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [IndiceTot1Sec04]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceTot101]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceTot102]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceTot103]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceTot104]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceTot1Sec01] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceTot1Sec02] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceTot1Sec03] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SAIndiceTot1Sec04] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceTot101]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceTot102]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceTot103]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceTot104]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceTot1Sec01] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceTot1Sec02] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceTot1Sec03] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SPIndiceTot1Sec04] DECIMAL (19, 6) DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [CodDestinazione] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWConfrontoIndiciRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWConfrontoIndiciRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWConfrontoIndiciRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWConfrontoIndiciRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWConfrontoIndiciRighe] TO [Metodo98]
    AS [dbo];

