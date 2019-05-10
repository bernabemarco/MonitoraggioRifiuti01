CREATE TABLE [dbo].[ValoriIndici] (
    [IDFlusso]       NUMERIC (10)    NOT NULL,
    [IDSchema]       NUMERIC (10)    NOT NULL,
    [IDIndice]       NUMERIC (10)    NOT NULL,
    [Valore]         NUMERIC (19, 4) DEFAULT (0) NULL,
    [MsgCommento]    VARCHAR (255)   NULL,
    [SemaforoR]      INT             NULL,
    [SemaforoG]      INT             NULL,
    [SemaforoB]      INT             NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    CONSTRAINT [PK_ValoriIndici] PRIMARY KEY CLUSTERED ([IDFlusso] ASC, [IDSchema] ASC, [IDIndice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ValoriIndici] TO [AnaBilancio]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ValoriIndici] TO [AnaBilancio]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ValoriIndici] TO [AnaBilancio]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ValoriIndici] TO [AnaBilancio]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ValoriIndici] TO [AnaBilancio]
    AS [dbo];

