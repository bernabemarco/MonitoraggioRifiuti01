CREATE TABLE [dbo].[IndiciSchema] (
    [IDIndice]       NUMERIC (10)  NOT NULL,
    [IDSchema]       NUMERIC (10)  NOT NULL,
    [DscBreve]       VARCHAR (10)  NULL,
    [Descrizione]    VARCHAR (80)  NULL,
    [TipoIndice]     INT           NULL,
    [DocAssociato]   VARCHAR (80)  NULL,
    [FormatoFormula] SMALLINT      NULL,
    [FormulaIndice]  VARCHAR (80)  NULL,
    [Note]           VARCHAR (255) NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    CONSTRAINT [PK_IndiciSchema] PRIMARY KEY CLUSTERED ([IDIndice] ASC, [IDSchema] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[IndiciSchema] TO [AnaBilancio]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[IndiciSchema] TO [AnaBilancio]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[IndiciSchema] TO [AnaBilancio]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[IndiciSchema] TO [AnaBilancio]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[IndiciSchema] TO [AnaBilancio]
    AS [dbo];

