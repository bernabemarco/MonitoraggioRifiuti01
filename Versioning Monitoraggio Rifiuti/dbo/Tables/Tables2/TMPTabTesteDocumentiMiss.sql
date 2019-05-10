CREATE TABLE [dbo].[TMPTabTesteDocumentiMiss] (
    [IDSESSIONE]           DECIMAL (5)     NOT NULL,
    [PROGRESSIVO]          DECIMAL (10)    NOT NULL,
    [PROGRESSDOC]          DECIMAL (10)    NOT NULL,
    [RIFPROGRTESTAMISS]    DECIMAL (10)    NOT NULL,
    [RIFIDRIGARIGHEMISS_1] INT             NOT NULL,
    [RIFIDRIGARIGHEMISS_2] INT             NOT NULL,
    [CODCLI]               VARCHAR (7)     NULL,
    [CODCLIFATT]           VARCHAR (7)     NULL,
    [CODDESTINAZIONE]      DECIMAL (5)     NULL,
    [RAGSOCDDM]            VARCHAR (80)    NULL,
    [CODICESPED]           DECIMAL (5)     NULL,
    [TIPODOCEMISS]         VARCHAR (3)     NULL,
    [TIPODOC]              VARCHAR (3)     NULL,
    [NUMERODOC]            DECIMAL (10)    NULL,
    [DATADOC]              DATETIME        NULL,
    [UM]                   VARCHAR (3)     NULL,
    [QTA]                  DECIMAL (16, 6) DEFAULT (0) NULL,
    [NUMCOLLI]             DECIMAL (16, 6) DEFAULT (0) NULL,
    [PESONETTO]            DECIMAL (16, 6) DEFAULT (0) NULL,
    [PESOLORDO]            DECIMAL (16, 6) DEFAULT (0) NULL,
    [VOLUME]               DECIMAL (16, 6) DEFAULT (0) NULL,
    [SUPERFICIE]           DECIMAL (16, 6) DEFAULT (0) NULL,
    [FlgRed]               SMALLINT        DEFAULT (0) NULL,
    [UTENTEMODIFICA]       VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]         DATETIME        NOT NULL,
    [DATACONSEGNA]         DATETIME        NULL,
    [FlgMancaFC]           SMALLINT        DEFAULT (0) NULL,
    [STATODOC]             SMALLINT        DEFAULT (0) NULL,
    [IDRIGHE_DRSV]         VARCHAR (1000)  DEFAULT ('') NULL,
    [NRCOLLI_NEW]          DECIMAL (16, 6) DEFAULT (0) NULL,
    [PESONETTO_NEW]        DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [PESOLORDO_NEW]        DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [ASPETTOBENI]          VARCHAR (80)    NULL,
    [DOCPARZ]              SMALLINT        DEFAULT ((0)) NULL,
    [TOTNETTOEURO]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TMPTabTesteDocumentiMiss] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMPTabTesteDocumentiMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMPTabTesteDocumentiMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TMPTabTesteDocumentiMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMPTabTesteDocumentiMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMPTabTesteDocumentiMiss] TO [Metodo98]
    AS [dbo];

