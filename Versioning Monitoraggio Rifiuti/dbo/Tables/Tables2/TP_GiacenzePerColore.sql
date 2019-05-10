CREATE TABLE [dbo].[TP_GiacenzePerColore] (
    [CodArticolo]    VARCHAR (50)    NOT NULL,
    [CodDeposito]    VARCHAR (10)    NOT NULL,
    [G]              DECIMAL (19, 6) NOT NULL,
    [GI]             DECIMAL (19, 6) NOT NULL,
    [GOI]            DECIMAL (19, 6) NOT NULL,
    [ColoreG]        VARCHAR (6)     NOT NULL,
    [ColoreGI]       VARCHAR (6)     NOT NULL,
    [ColoreGOI]      VARCHAR (6)     NOT NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([CodArticolo] ASC, [CodDeposito] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_GiacenzePerColore] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_GiacenzePerColore] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_GiacenzePerColore] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_GiacenzePerColore] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_GiacenzePerColore] TO [Metodo98]
    AS [dbo];

