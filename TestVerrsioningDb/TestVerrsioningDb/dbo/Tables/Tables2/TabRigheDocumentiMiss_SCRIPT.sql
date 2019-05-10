CREATE TABLE [dbo].[TabRigheDocumentiMiss_SCRIPT] (
    [IDSESSIONE]     DECIMAL (5)     NOT NULL,
    [PROGRESSDOC]    DECIMAL (10)    NOT NULL,
    [IDRIGADOC]      INT             NOT NULL,
    [RIGACHIUSA]     SMALLINT        DEFAULT (0) NULL,
    [UM]             VARCHAR (3)     DEFAULT ('') NULL,
    [QTACONSEG]      DECIMAL (16, 6) DEFAULT (0) NULL,
    [UMPREZZO]       VARCHAR (3)     DEFAULT ('') NULL,
    [QTAPREZZOCONS]  DECIMAL (16, 6) DEFAULT (0) NULL,
    [DATACONSEGNA]   DATETIME        NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [PROGRESSDOC] ASC, [IDRIGADOC] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabRigheDocumentiMiss_SCRIPT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabRigheDocumentiMiss_SCRIPT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabRigheDocumentiMiss_SCRIPT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabRigheDocumentiMiss_SCRIPT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabRigheDocumentiMiss_SCRIPT] TO [Metodo98]
    AS [dbo];

