CREATE TABLE [dbo].[Ald_TEMPCaricoArticolo] (
    [NRTERMINALE]    DECIMAL (10)    NOT NULL,
    [CODART]         VARCHAR (50)    NOT NULL,
    [CODDEPOSITO]    VARCHAR (10)    NOT NULL,
    [NRIFPARTITA]    VARCHAR (15)    NOT NULL,
    [ESERCIZIO]      DECIMAL (5)     NOT NULL,
    [CARICO]         DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [PK_Ald_TEMPCaricoArticolo] PRIMARY KEY CLUSTERED ([NRTERMINALE] ASC, [CODART] ASC, [CODDEPOSITO] ASC, [NRIFPARTITA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_TEMPCaricoArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_TEMPCaricoArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_TEMPCaricoArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_TEMPCaricoArticolo] TO [Metodo98]
    AS [dbo];

