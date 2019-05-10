CREATE TABLE [dbo].[TabRigheDocumentiMiss] (
    [IDTESTA]        DECIMAL (10)    NOT NULL,
    [IDRIGA]         INT             NOT NULL,
    [IDRIGADOC]      INT             NOT NULL,
    [RIGACHIUSA]     SMALLINT        DEFAULT (0) NULL,
    [CODART]         VARCHAR (50)    NULL,
    [DESCART]        VARCHAR (80)    NULL,
    [UM]             VARCHAR (3)     NULL,
    [QTAORD]         DECIMAL (16, 6) DEFAULT (0) NULL,
    [QTARESIDUA]     DECIMAL (16, 6) DEFAULT (0) NULL,
    [QTACONSEG]      DECIMAL (16, 6) DEFAULT (0) NULL,
    [NRRIFPARTITA]   VARCHAR (15)    DEFAULT ('') NULL,
    [DATACONSEGNA]   DATETIME        NULL,
    [IDRIGAPADRE]    INT             DEFAULT (0) NOT NULL,
    [CODUBICAZIONE]  VARCHAR (10)    DEFAULT ('') NULL,
    [TIPOUBICAZIONE] SMALLINT        DEFAULT (0) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [UMPREZZO]       VARCHAR (3)     DEFAULT ('') NULL,
    [QTAPREZZOCONS]  DECIMAL (16, 6) DEFAULT (0) NULL,
    [GIACENZA]       DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [ChkSel]         SMALLINT        DEFAULT ((0)) NULL,
    [PROGDOC]        DECIMAL (10)    DEFAULT ((0)) NULL,
    [PRELEVATORF]    SMALLINT        DEFAULT ((0)) NULL,
    [PRELEVATOPL]    SMALLINT        DEFAULT ((0)) NULL,
    [PROGRPACKING]   DECIMAL (18)    DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TabRigheDocumentiMiss] PRIMARY KEY CLUSTERED ([IDTESTA] ASC, [IDRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabRigheDocumentiMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabRigheDocumentiMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabRigheDocumentiMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabRigheDocumentiMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabRigheDocumentiMiss] TO [Metodo98]
    AS [dbo];

