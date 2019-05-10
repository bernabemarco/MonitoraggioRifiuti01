CREATE TABLE [dbo].[Ald_TEMPGiacenzaArticolo] (
    [NRTERMINALE]    DECIMAL (10)    NOT NULL,
    [CODART]         VARCHAR (50)    NOT NULL,
    [CODDEPOSITO]    VARCHAR (10)    NOT NULL,
    [NRIFPARTITA]    VARCHAR (15)    NOT NULL,
    [ESERCIZIO]      DECIMAL (5)     NOT NULL,
    [QTA]            DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [IMPEGNATO]      DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [ORDINATO]       DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [MESISEL]        DECIMAL (5)     NULL,
    [DATAINIZIO]     DATETIME        NOT NULL,
    [DATAFINE]       DATETIME        NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [PK_Ald_TEMPGiacenzaArticolo] PRIMARY KEY CLUSTERED ([NRTERMINALE] ASC, [CODART] ASC, [CODDEPOSITO] ASC, [NRIFPARTITA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_TEMPGiacenzaArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_TEMPGiacenzaArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_TEMPGiacenzaArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_TEMPGiacenzaArticolo] TO [Metodo98]
    AS [dbo];

