CREATE TABLE [dbo].[AnagraficaAziende] (
    [NomeAzienda]    VARCHAR (30) NOT NULL,
    [RagSociale]     VARCHAR (80) NULL,
    [CodiceFiscale]  VARCHAR (16) NULL,
    [PartitaIva]     VARCHAR (12) NULL,
    [SedeLegale]     VARCHAR (80) NULL,
    [Indirizzo]      VARCHAR (80) NULL,
    [NumSedeFiscale] VARCHAR (4)  NULL,
    [CAP]            VARCHAR (8)  NULL,
    [ComuneSede]     VARCHAR (80) NULL,
    [Provincia]      VARCHAR (4)  NULL,
    [TipoArchivi]    INT          NOT NULL,
    [DSNArchMetodo]  VARCHAR (30) NULL,
    [OGGValutazione] VARCHAR (50) NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([NomeAzienda] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[AnagraficaAziende] TO [AnaBilancio]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AnagraficaAziende] TO [AnaBilancio]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[AnagraficaAziende] TO [AnaBilancio]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AnagraficaAziende] TO [AnaBilancio]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AnagraficaAziende] TO [AnaBilancio]
    AS [dbo];

