CREATE TABLE [dbo].[TP_ModArrotondamento] (
    [Progressivo]    NUMERIC (18)    NOT NULL,
    [FinoA]          DECIMAL (19, 6) NULL,
    [ArrotondaA]     DECIMAL (19, 6) NULL,
    [UtenteModifica] VARCHAR (25)    NULL,
    [DataModifica]   DATETIME        NULL,
    CONSTRAINT [PK_TP_ModArrotondamento] PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ModArrotondamento] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ModArrotondamento] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ModArrotondamento] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ModArrotondamento] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ModArrotondamento] TO [Metodo98]
    AS [dbo];

