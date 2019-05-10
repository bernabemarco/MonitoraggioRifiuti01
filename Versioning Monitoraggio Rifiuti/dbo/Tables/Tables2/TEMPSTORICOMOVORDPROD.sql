CREATE TABLE [dbo].[TEMPSTORICOMOVORDPROD] (
    [IDSESSIONE]                 INT             NOT NULL,
    [RIFPROGRESSIVO]             DECIMAL (10)    NOT NULL,
    [RIGAMOVORD]                 INT             NOT NULL,
    [POSIZIONE]                  INT             NOT NULL,
    [RIFTESTA]                   INT             NULL,
    [RIFRIGA]                    INT             NULL,
    [RIFMOVSM]                   DECIMAL (10)    NULL,
    [RIFMOVCOLLSM]               DECIMAL (10)    NULL,
    [CODICEORD]                  VARCHAR (3)     NULL,
    [CODART]                     VARCHAR (50)    NULL,
    [DESCRIZIONEART]             VARCHAR (255)   NULL,
    [VERSIONEDBA]                VARCHAR (10)    NULL,
    [UMGEST]                     VARCHAR (3)     NULL,
    [QTAGESTIONE]                DECIMAL (16, 6) NULL,
    [QTAMOVGESTIONE]             DECIMAL (16, 6) NULL,
    [QTAGESTIONERES]             DECIMAL (16, 6) NULL,
    [QTAPREZZO]                  DECIMAL (16, 6) NULL,
    [QTAMOVPREZZO]               DECIMAL (16, 6) NULL,
    [QTAPREZZORES]               DECIMAL (16, 6) NULL,
    [UMPREZZO]                   VARCHAR (3)     NULL,
    [QTAPREZZOMAN]               SMALLINT        NULL,
    [UM1MAG]                     VARCHAR (3)     NULL,
    [QTA1MAG]                    DECIMAL (16, 6) NULL,
    [QTAMOV1MAG]                 DECIMAL (16, 6) NULL,
    [QTA1MAGRES]                 DECIMAL (16, 6) NULL,
    [QTA1MAGMAN]                 SMALLINT        NULL,
    [UM2MAG]                     VARCHAR (3)     NULL,
    [QTA2MAG]                    DECIMAL (16, 6) NULL,
    [QTAMOV2MAG]                 DECIMAL (16, 6) NULL,
    [QTA2MAGRES]                 DECIMAL (16, 6) NULL,
    [QTA2MAGMAN]                 SMALLINT        NULL,
    [UMSCARTO]                   VARCHAR (3)     NULL,
    [QTAMOVSCARTO]               DECIMAL (16, 6) NULL,
    [SALDORIGA]                  SMALLINT        NULL,
    [PARTITAASSEGNATA]           VARCHAR (15)    NULL,
    [PARTITAVINCOLATA]           SMALLINT        NULL,
    [CODCLIDEST]                 VARCHAR (7)     NULL,
    [CAUSALEMOV]                 DECIMAL (5)     NULL,
    [DEPOSITO]                   VARCHAR (10)    NULL,
    [UBICAZIONE]                 VARCHAR (10)    NULL,
    [CONTOCDC]                   VARCHAR (10)    NULL,
    [CAUSALEMOVCOLL]             DECIMAL (5)     NULL,
    [DEPOSITOCOLL]               VARCHAR (10)    NULL,
    [UBICAZIONECOLL]             VARCHAR (10)    NULL,
    [CONTOCDCCOLL]               VARCHAR (10)    NULL,
    [CAUSALESCARTO]              DECIMAL (5)     NULL,
    [DEPOSITOSCARTO]             VARCHAR (10)    NULL,
    [UBICAZIONESCARTO]           VARCHAR (10)    NULL,
    [CONTOCDCSCARTO]             VARCHAR (10)    NULL,
    [COSTOMATERIALE]             DECIMAL (19, 6) NULL,
    [COSTOLAVINTERNA]            DECIMAL (19, 6) NULL,
    [COSTOLAVESTERNA]            DECIMAL (19, 6) NULL,
    [COSTOINDIRETTO]             DECIMAL (19, 6) NULL,
    [COSTOUNITMOV]               DECIMAL (19, 6) NULL,
    [COSTOTOTMOV]                DECIMAL (19, 6) NULL,
    [COSTOUNITMOVEURO]           DECIMAL (19, 6) NULL,
    [COSTOTOTMOVEURO]            DECIMAL (19, 6) NULL,
    [COSTOMATERIALEEURO]         DECIMAL (19, 6) NULL,
    [COSTOLAVINTERNAEURO]        DECIMAL (19, 6) NULL,
    [COSTOLAVESTERNAEURO]        DECIMAL (19, 6) NULL,
    [COSTOINDIRETTOEURO]         DECIMAL (19, 6) NULL,
    [IDCOSTOPRODOTTO]            VARCHAR (10)    NULL,
    [NOTE]                       VARCHAR (255)   NULL,
    [CODFORDEST]                 VARCHAR (7)     NULL,
    [RIFCOMMCLI]                 VARCHAR (30)    NULL,
    [DATAMODIFICA]               DATETIME        NOT NULL,
    [UTENTEMODIFICA]             VARCHAR (25)    NOT NULL,
    [CAUSALESCARTOCOLL]          NUMERIC (5)     NULL,
    [DEPOSITOSCARTOCOLL]         VARCHAR (10)    NULL,
    [UBICAZIONESCARTOCOLL]       VARCHAR (10)    NULL,
    [CONTOCDCSCARTOCOLL]         VARCHAR (10)    NULL,
    [COSTOCOMPTOT]               DECIMAL (19, 6) NULL,
    [COSTOCOMPTOTEURO]           DECIMAL (19, 6) NULL,
    [FLGVALORIZZA]               SMALLINT        NULL,
    [FLGEMESSOCICLO]             SMALLINT        NULL,
    [FLGPRELEVARESIDUOIMPEGNATO] SMALLINT        NULL,
    PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [RIFPROGRESSIVO] ASC, [RIGAMOVORD] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTORICOMOVORDPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTORICOMOVORDPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTORICOMOVORDPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTORICOMOVORDPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTORICOMOVORDPROD] TO [Metodo98]
    AS [dbo];

