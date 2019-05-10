CREATE TABLE [dbo].[TMPTabDocMissNonEvadibili] (
    [IDSessione]     DECIMAL (5)     NOT NULL,
    [ProgDoc]        DECIMAL (10)    NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [ProgrMiss]      DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [IDRigaDoc]      INT             DEFAULT ((0)) NOT NULL,
    [CODART]         VARCHAR (50)    NULL,
    [DESCART]        VARCHAR (80)    NULL,
    [UM]             VARCHAR (3)     NULL,
    [QTAORD]         DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [QTARESIDUA]     DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [UMPREZZO]       VARCHAR (3)     NULL,
    [DATACONSEGNA]   DATETIME        NULL,
    [MANCAGIAC]      SMALLINT        DEFAULT ((0)) NULL,
    [RIGACHIUSA]     SMALLINT        DEFAULT ((0)) NULL,
    CONSTRAINT [PK__TMPTabDocMissNonEvadibili] PRIMARY KEY CLUSTERED ([IDSessione] ASC, [ProgrMiss] ASC, [ProgDoc] ASC, [IDRigaDoc] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMPTabDocMissNonEvadibili] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMPTabDocMissNonEvadibili] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TMPTabDocMissNonEvadibili] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMPTabDocMissNonEvadibili] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMPTabDocMissNonEvadibili] TO [Metodo98]
    AS [dbo];

