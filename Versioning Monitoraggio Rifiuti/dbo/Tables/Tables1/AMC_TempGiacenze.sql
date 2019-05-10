CREATE TABLE [dbo].[AMC_TempGiacenze] (
    [NRTERMINALE]    DECIMAL (5)     NOT NULL,
    [CODDEPOSITO]    VARCHAR (10)    NOT NULL,
    [CODART]         VARCHAR (50)    NOT NULL,
    [NRRIFPARTITA]   VARCHAR (15)    NOT NULL,
    [GIACENZA]       DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [QTADOC]         DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [LISTARIGHE]     VARCHAR (80)    NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    CONSTRAINT [PK_AMC_TempGiacenze] PRIMARY KEY CLUSTERED ([NRTERMINALE] ASC, [CODDEPOSITO] ASC, [CODART] ASC, [NRRIFPARTITA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[AMC_TempGiacenze] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AMC_TempGiacenze] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[AMC_TempGiacenze] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AMC_TempGiacenze] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AMC_TempGiacenze] TO [Metodo98]
    AS [dbo];

