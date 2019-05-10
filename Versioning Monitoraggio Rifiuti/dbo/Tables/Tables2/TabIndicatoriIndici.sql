CREATE TABLE [dbo].[TabIndicatoriIndici] (
    [NomeDitta]      VARCHAR (30)    NOT NULL,
    [IDIndicatore]   VARCHAR (30)    NOT NULL,
    [Descrizione]    VARCHAR (80)    NULL,
    [Valore]         DECIMAL (19, 4) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    CONSTRAINT [PK_TabIndicatoriIndici] PRIMARY KEY CLUSTERED ([NomeDitta] ASC, [IDIndicatore] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabIndicatoriIndici] TO [AnaBilancio]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabIndicatoriIndici] TO [AnaBilancio]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabIndicatoriIndici] TO [AnaBilancio]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabIndicatoriIndici] TO [AnaBilancio]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabIndicatoriIndici] TO [AnaBilancio]
    AS [dbo];

