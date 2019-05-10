CREATE TABLE [dbo].[LISTINIECOM] (
    [CODCONTO]    VARCHAR (7)     NULL,
    [PRODOTTO]    VARCHAR (50)    NULL,
    [PREZZO]      DECIMAL (19, 6) NULL,
    [SCONTO]      VARCHAR (10)    NULL,
    [QTAMINIMA]   DECIMAL (16, 6) NULL,
    [VALDA]       DATETIME        NULL,
    [VALA]        DATETIME        NULL,
    [Prezzo_Euro] DECIMAL (19, 6) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[LISTINIECOM] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[LISTINIECOM] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[LISTINIECOM] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[LISTINIECOM] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[LISTINIECOM] TO [Metodo98]
    AS [dbo];

