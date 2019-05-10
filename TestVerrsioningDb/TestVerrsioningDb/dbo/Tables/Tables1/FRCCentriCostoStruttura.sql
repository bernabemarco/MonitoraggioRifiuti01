CREATE TABLE [dbo].[FRCCentriCostoStruttura] (
    [Codice]         INT          NOT NULL,
    [CDC]            VARCHAR (10) NOT NULL,
    [TipoCalcolo]    SMALLINT     DEFAULT ((0)) NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC, [CDC] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCCentriCostoStruttura] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCCentriCostoStruttura] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCCentriCostoStruttura] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCCentriCostoStruttura] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCCentriCostoStruttura] TO [Metodo98]
    AS [dbo];

