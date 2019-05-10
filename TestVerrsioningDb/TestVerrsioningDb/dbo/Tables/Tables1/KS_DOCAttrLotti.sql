CREATE TABLE [dbo].[KS_DOCAttrLotti] (
    [TipoDoc]        VARCHAR (3)  NOT NULL,
    [UtenteModifica] VARCHAR (25) NULL,
    [DataModifica]   DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([TipoDoc] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[KS_DOCAttrLotti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[KS_DOCAttrLotti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[KS_DOCAttrLotti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[KS_DOCAttrLotti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[KS_DOCAttrLotti] TO [Metodo98]
    AS [dbo];

