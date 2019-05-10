CREATE TABLE [dbo].[RighePanierePOS] (
    [IDTesta]        DECIMAL (10) NOT NULL,
    [IDRiga]         DECIMAL (10) NOT NULL,
    [Barcode]        VARCHAR (12) NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([IDTesta] ASC, [IDRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[RighePanierePOS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[RighePanierePOS] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[RighePanierePOS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[RighePanierePOS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[RighePanierePOS] TO [Metodo98]
    AS [dbo];

