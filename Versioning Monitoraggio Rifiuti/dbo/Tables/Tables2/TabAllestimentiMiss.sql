CREATE TABLE [dbo].[TabAllestimentiMiss] (
    [PROGRESSIVO]    DECIMAL (10)    NOT NULL,
    [IDTESTA]        DECIMAL (10)    NOT NULL,
    [IDRIGA]         DECIMAL (10)    NOT NULL,
    [CODART]         VARCHAR (50)    DEFAULT ('') NULL,
    [QTACONSEG]      DECIMAL (16, 6) DEFAULT (0) NULL,
    [QTAPREZZOCONS]  DECIMAL (16, 6) DEFAULT (0) NULL,
    [RIGACHIUSA]     SMALLINT        DEFAULT (0) NULL,
    [NRRIFPARTITA]   VARCHAR (15)    DEFAULT ('') NULL,
    [CODUBICAZIONE]  VARCHAR (10)    DEFAULT ('') NULL,
    [UTENTEMODIFICA] VARCHAR (25)    DEFAULT ('') NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabAllestimentiMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabAllestimentiMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabAllestimentiMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabAllestimentiMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabAllestimentiMiss] TO [Metodo98]
    AS [dbo];

