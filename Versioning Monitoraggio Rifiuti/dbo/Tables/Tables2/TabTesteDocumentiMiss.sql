CREATE TABLE [dbo].[TabTesteDocumentiMiss] (
    [PROGRESSIVO]          DECIMAL (10)    NOT NULL,
    [PROGRESSDOC]          DECIMAL (10)    NOT NULL,
    [RIFPROGRTESTAMISS]    DECIMAL (10)    NOT NULL,
    [RIFIDRIGARIGHEMISS_1] INT             NOT NULL,
    [RIFIDRIGARIGHEMISS_2] INT             NOT NULL,
    [CODCLI]               VARCHAR (7)     NULL,
    [CODDESTINAZIONE]      DECIMAL (5)     NULL,
    [RAGSOCDDM]            VARCHAR (80)    NULL,
    [CODICESPED]           DECIMAL (5)     NULL,
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
    [DOCPARZ]              SMALLINT        DEFAULT ((0)) NULL,
    [TOTNETTOEURO]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TabTesteDocumentiMiss] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO



CREATE TRIGGER TD_TabTesteDocumentiMiss  ON TabTesteDocumentiMiss
FOR DELETE 
AS



BEGIN

    /*  DELETE ALL CHILDREN IN "TabRigheDocumentiMiss"  */
    DELETE TabRigheDocumentiMiss
    FROM     TabRigheDocumentiMiss T2, DELETED T1
    WHERE  T2.IDTESTA = T1.PROGRESSIVO


END


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabTesteDocumentiMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabTesteDocumentiMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabTesteDocumentiMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabTesteDocumentiMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabTesteDocumentiMiss] TO [Metodo98]
    AS [dbo];

