CREATE TABLE [dbo].[ALD_tempStpAnaMag] (
    [NRTERMINALE]    DECIMAL (5)     NOT NULL,
    [CODDEPOSITO]    VARCHAR (10)    NOT NULL,
    [CODART]         VARCHAR (50)    NOT NULL,
    [NRRIFPARTITA]   VARCHAR (15)    NOT NULL,
    [GIACENZA]       DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [COSTO]          DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [DATAMAX]        DATETIME        NULL,
    [DATAANA]        DATETIME        NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    CONSTRAINT [PK_ALD_tempStpAnaMag] PRIMARY KEY CLUSTERED ([NRTERMINALE] ASC, [CODDEPOSITO] ASC, [CODART] ASC, [NRRIFPARTITA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_tempStpAnaMag] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_tempStpAnaMag] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_tempStpAnaMag] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_tempStpAnaMag] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_tempStpAnaMag] TO [Metodo98]
    AS [dbo];

