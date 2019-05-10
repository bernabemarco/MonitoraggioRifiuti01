CREATE TABLE [dbo].[CommentiIndici] (
    [IDIndice]       NUMERIC (10)    NOT NULL,
    [NrRiga]         INT             NOT NULL,
    [ValoreDa]       NUMERIC (19, 4) NULL,
    [ValoreA]        NUMERIC (19, 4) NULL,
    [Commento]       VARCHAR (255)   NULL,
    [SemaforoR]      INT             NULL,
    [SemaforoG]      INT             NULL,
    [SemaforoB]      INT             NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    CONSTRAINT [PK_CommentiIndici] PRIMARY KEY CLUSTERED ([IDIndice] ASC, [NrRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CommentiIndici] TO [AnaBilancio]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CommentiIndici] TO [AnaBilancio]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CommentiIndici] TO [AnaBilancio]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CommentiIndici] TO [AnaBilancio]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CommentiIndici] TO [AnaBilancio]
    AS [dbo];

