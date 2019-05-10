CREATE TABLE [dbo].[GEM_T_TAB_LivelloRischio] (
    [idLivelloRischio]  VARCHAR (5)  NOT NULL,
    [DscLivelloRischio] VARCHAR (80) NULL,
    [Allert]            VARCHAR (15) NULL,
    [Colore]            VARCHAR (1)  NULL,
    [UTENTEMODIFICA]    VARCHAR (25) NOT NULL,
    [DATAMODIFICA]      DATETIME     NOT NULL,
    CONSTRAINT [PK_GEM_T_TAB_LivelloRischio] PRIMARY KEY CLUSTERED ([idLivelloRischio] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_T_TAB_LivelloRischio] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_T_TAB_LivelloRischio] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_T_TAB_LivelloRischio] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_T_TAB_LivelloRischio] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_T_TAB_LivelloRischio] TO [Metodo98]
    AS [dbo];

