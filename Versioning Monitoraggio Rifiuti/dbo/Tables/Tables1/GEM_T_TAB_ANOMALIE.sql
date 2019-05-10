CREATE TABLE [dbo].[GEM_T_TAB_ANOMALIE] (
    [idAnomalia]       VARCHAR (5)   NOT NULL,
    [DscAnomalia]      VARCHAR (80)  NULL,
    [CodMezzo]         VARCHAR (50)  NOT NULL,
    [idLivelloRischio] VARCHAR (5)   NOT NULL,
    [Note]             VARCHAR (900) NULL,
    [UTENTEMODIFICA]   VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]     DATETIME      NOT NULL,
    [StampaAnom]       INT           DEFAULT ((0)) NULL,
    [NoteAnom]         VARCHAR (900) NULL,
    CONSTRAINT [PK_GEM_T_TAB_ANOMALIE] PRIMARY KEY CLUSTERED ([idAnomalia] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_T_TAB_ANOMALIE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_T_TAB_ANOMALIE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_T_TAB_ANOMALIE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_T_TAB_ANOMALIE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_T_TAB_ANOMALIE] TO [Metodo98]
    AS [dbo];

