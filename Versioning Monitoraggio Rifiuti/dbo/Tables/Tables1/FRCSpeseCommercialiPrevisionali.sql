CREATE TABLE [dbo].[FRCSpeseCommercialiPrevisionali] (
    [NumeroRiga]     INT             NOT NULL,
    [Ambiente]       VARCHAR (3)     DEFAULT ('') NULL,
    [Anno]           INT             DEFAULT ((0)) NULL,
    [TipoSpesa]      SMALLINT        DEFAULT ((0)) NULL,
    [Cliente]        VARCHAR (7)     DEFAULT ('') NULL,
    [Percentuale]    DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NumeroRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCSpeseCommercialiPrevisionali] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCSpeseCommercialiPrevisionali] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCSpeseCommercialiPrevisionali] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCSpeseCommercialiPrevisionali] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCSpeseCommercialiPrevisionali] TO [Metodo98]
    AS [dbo];

