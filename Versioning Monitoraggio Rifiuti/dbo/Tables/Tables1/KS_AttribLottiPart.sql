CREATE TABLE [dbo].[KS_AttribLottiPart] (
    [CodCategoriaStat] DECIMAL (5)  NOT NULL,
    [CodArt]           VARCHAR (50) NOT NULL,
    [TipoAttrLotto]    INT          NULL,
    [UtenteModifica]   VARCHAR (25) NULL,
    [DataModifica]     DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([CodCategoriaStat] ASC, [CodArt] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[KS_AttribLottiPart] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[KS_AttribLottiPart] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[KS_AttribLottiPart] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[KS_AttribLottiPart] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[KS_AttribLottiPart] TO [Metodo98]
    AS [dbo];

