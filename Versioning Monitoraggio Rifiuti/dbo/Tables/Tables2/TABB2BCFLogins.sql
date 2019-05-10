CREATE TABLE [dbo].[TABB2BCFLogins] (
    [CodConto]       VARCHAR (7)    NOT NULL,
    [IDRiga]         INT            NOT NULL,
    [Login]          NVARCHAR (30)  NOT NULL,
    [Password]       NVARCHAR (15)  NOT NULL,
    [Email]          NVARCHAR (100) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]   DATETIME       NOT NULL,
    CONSTRAINT [PK_B2BCFLogins] PRIMARY KEY CLUSTERED ([CodConto] ASC, [IDRiga] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_TABB2BCFLogins_TABB2BCFLogins] FOREIGN KEY ([CodConto]) REFERENCES [dbo].[ANAGRAFICACF] ([CODCONTO])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [TABB2BCFLogins_login_ind]
    ON [dbo].[TABB2BCFLogins]([Login] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABB2BCFLogins] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABB2BCFLogins] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABB2BCFLogins] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABB2BCFLogins] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABB2BCFLogins] TO [Metodo98]
    AS [dbo];

