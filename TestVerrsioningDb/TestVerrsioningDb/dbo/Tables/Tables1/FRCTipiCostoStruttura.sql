CREATE TABLE [dbo].[FRCTipiCostoStruttura] (
    [Codice]         INT           NOT NULL,
    [Descrizione]    VARCHAR (100) DEFAULT ('') NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    [InvertiSegno]   SMALLINT      DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCTipiCostoStruttura] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCTipiCostoStruttura] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCTipiCostoStruttura] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCTipiCostoStruttura] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCTipiCostoStruttura] TO [Metodo98]
    AS [dbo];

