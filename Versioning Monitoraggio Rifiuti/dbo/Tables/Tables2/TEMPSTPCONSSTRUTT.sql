CREATE TABLE [dbo].[TEMPSTPCONSSTRUTT] (
    [SC]                  VARCHAR (50)    NULL,
    [GRP]                 VARCHAR (50)    NULL,
    [RAGGR1]              VARCHAR (50)    NULL,
    [RAGGR2]              VARCHAR (50)    NULL,
    [CODNODO]             VARCHAR (50)    NULL,
    [CODICE]              VARCHAR (50)    NULL,
    [TIPONODO]            SMALLINT        NULL,
    [TIPOCOSTO]           VARCHAR (4)     NULL,
    [PRC]                 DECIMAL (8, 5)  NULL,
    [RIFERIMENTORIP]      VARCHAR (20)    NULL,
    [NRRIGASTRUTT]        DECIMAL (5)     NULL,
    [NRRIGASTRUTTPADRE]   DECIMAL (5)     NULL,
    [DESCRIZIONE]         VARCHAR (80)    NULL,
    [CONSUNTIVATORIP]     DECIMAL (19, 6) NULL,
    [RISERVATORIP]        DECIMAL (19, 6) NULL,
    [ORDINATORIP]         DECIMAL (19, 6) NULL,
    [PREVISTORIP]         DECIMAL (19, 6) NULL,
    [COSTOTOTRIP]         DECIMAL (19, 6) NULL,
    [CONSUNTIVATORIPEURO] DECIMAL (19, 6) NULL,
    [RISERVATORIPEURO]    DECIMAL (19, 6) NULL,
    [ORDINATORIPEURO]     DECIMAL (19, 6) NULL,
    [PREVISTORIPEURO]     DECIMAL (19, 6) NULL,
    [COSTOTOTRIPEURO]     DECIMAL (19, 6) NULL,
    [RICAVOEFFRIPEURO]    DECIMAL (19, 6) NULL,
    [RICAVOPREVRIPEURO]   DECIMAL (19, 6) NULL,
    [RIFCOMM]             VARCHAR (30)    NULL,
    [IDCOMMCLI]           DECIMAL (10)    NULL,
    [QTABASE]             DECIMAL (16, 6) NULL,
    [UMBASE]              VARCHAR (3)     NULL,
    [QTAVAL]              DECIMAL (16, 6) NULL,
    [UMVAL]               VARCHAR (3)     NULL,
    [VOCEBASE]            VARCHAR (3)     NULL,
    [IDVOCE]              VARCHAR (3)     NULL,
    [IDSESSIONE]          INT             NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPCONSSTRUTT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPCONSSTRUTT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTPCONSSTRUTT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPCONSSTRUTT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPCONSSTRUTT] TO [Metodo98]
    AS [dbo];

