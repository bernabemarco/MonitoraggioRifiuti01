CREATE TABLE [dbo].[GEM_T_TAB_NOANOMALIE] (
    [id]               VARCHAR (5)   NOT NULL,
    [DscNoAnomalia]    VARCHAR (80)  NULL,
    [CodMezzo]         VARCHAR (50)  NULL,
    [idLivelloRischio] VARCHAR (5)   NULL,
    [Note]             VARCHAR (900) NULL,
    [UTENTEMODIFICA]   VARCHAR (25)  NULL,
    [DATAMODIFICA]     DATETIME      NULL,
    [StampaNoAnom]     INT           NULL,
    [NoteNoAnom]       VARCHAR (900) NULL
);

