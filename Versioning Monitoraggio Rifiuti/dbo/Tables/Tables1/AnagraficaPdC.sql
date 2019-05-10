CREATE TABLE [dbo].[AnagraficaPdC] (
    [Codice]         VARCHAR (30)  NOT NULL,
    [IDLivello]      VARCHAR (30)  NOT NULL,
    [IDLivPadre]     VARCHAR (30)  NOT NULL,
    [Tipo]           VARCHAR (1)   NOT NULL,
    [Note]           VARCHAR (255) NOT NULL,
    [Descrizione]    VARCHAR (80)  NULL,
    [NomeDitta]      VARCHAR (30)  NOT NULL,
    [Posizione]      INT           NOT NULL,
    [ColoreTesto]    INT           NULL,
    [ColoreSfondo]   INT           NULL,
    [InGrassetto]    INT           NULL,
    [ColoreTestoR]   INT           NULL,
    [ColoreTestoG]   INT           NULL,
    [ColoreTestoB]   INT           NULL,
    [ColoreSfondoR]  INT           NULL,
    [ColoreSfondoG]  INT           NULL,
    [ColoreSfondoB]  INT           NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([IDLivello] ASC, [NomeDitta] ASC) WITH (FILLFACTOR = 90),
    CHECK ([InGrassetto] is null or [InGrassetto] = 0 or [InGrassetto] = 1)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[AnagraficaPdC] TO [AnaBilancio]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AnagraficaPdC] TO [AnaBilancio]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[AnagraficaPdC] TO [AnaBilancio]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AnagraficaPdC] TO [AnaBilancio]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AnagraficaPdC] TO [AnaBilancio]
    AS [dbo];

