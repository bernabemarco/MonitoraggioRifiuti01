CREATE TABLE [dbo].[TabDocMissNonEvadibili] (
    [PROGDOC]        DECIMAL (10)    NOT NULL,
    [PROGRMISS]      DECIMAL (10)    NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [IDRIGADOC]      INT             DEFAULT ((0)) NOT NULL,
    [CODART]         VARCHAR (50)    NULL,
    [DESCART]        VARCHAR (80)    NULL,
    [UM]             VARCHAR (3)     NULL,
    [QTAORD]         DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [QTARESIDUA]     DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [UMPREZZO]       VARCHAR (3)     NULL,
    [DATACONSEGNA]   DATETIME        NULL,
    [MANCAGIAC]      SMALLINT        DEFAULT ((0)) NULL,
    [RIGACHIUSA]     SMALLINT        DEFAULT ((0)) NULL,
    CONSTRAINT [PK__TabDocMissNonEvadibili] PRIMARY KEY CLUSTERED ([PROGRMISS] ASC, [PROGDOC] ASC, [IDRIGADOC] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabDocMissNonEvadibili] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabDocMissNonEvadibili] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabDocMissNonEvadibili] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabDocMissNonEvadibili] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabDocMissNonEvadibili] TO [Metodo98]
    AS [dbo];

