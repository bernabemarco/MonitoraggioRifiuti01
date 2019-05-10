CREATE TABLE [dbo].[GRI_T_RigheGCheckLists] (
    [IdTipoRapporto]   DECIMAL (5)    NOT NULL,
    [CodiceMezzo]      VARCHAR (50)   NOT NULL,
    [VersioneChekList] DECIMAL (5)    NOT NULL,
    [IdRiga]           DECIMAL (5)    NOT NULL,
    [Descrizione]      NVARCHAR (200) NULL,
    [Campo]            VARCHAR (2)    NOT NULL,
    [Ordine]           INT            NULL,
    [Note]             VARCHAR (255)  NULL,
    [stampa]           VARCHAR (1)    NULL,
    [UTENTEMODIFICA]   VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]     DATETIME       NOT NULL,
    [NoteXnc]          VARCHAR (255)  NULL,
    CONSTRAINT [PK_GRI_T_RigheGCheckLists] PRIMARY KEY CLUSTERED ([IdTipoRapporto] ASC, [CodiceMezzo] ASC, [VersioneChekList] ASC, [IdRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_T_RigheGCheckLists] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_T_RigheGCheckLists] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_T_RigheGCheckLists] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_T_RigheGCheckLists] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_T_RigheGCheckLists] TO [Metodo98]
    AS [dbo];

