CREATE TABLE [dbo].[TP_GIACENZESTORICO] (
    [Esercizio]      DECIMAL (5)     NOT NULL,
    [CodDeposito]    VARCHAR (10)    NOT NULL,
    [CodArticolo]    VARCHAR (50)    NOT NULL,
    [Giacenza]       DECIMAL (18, 6) NULL,
    [Ordinato]       DECIMAL (18, 6) NULL,
    [Impegnato]      DECIMAL (18, 6) NULL,
    [UtenteModifica] VARCHAR (25)    NULL,
    [DataModifica]   DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([Esercizio] ASC, [CodDeposito] ASC, [CodArticolo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_GIACENZESTORICO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_GIACENZESTORICO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_GIACENZESTORICO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_GIACENZESTORICO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_GIACENZESTORICO] TO [Metodo98]
    AS [dbo];

