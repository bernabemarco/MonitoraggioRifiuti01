CREATE TABLE [dbo].[GEM_T_TAB_LivelloRischioCC] (
    [idLivelloRischioCC]  VARCHAR (5)   NOT NULL,
    [DscLivelloRischioCC] VARCHAR (80)  NULL,
    [Note]                VARCHAR (200) NULL,
    [Allert]              VARCHAR (15)  NULL,
    [Colore]              VARCHAR (1)   NULL,
    [UTENTEMODIFICA]      VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]        DATETIME      NOT NULL,
    CONSTRAINT [PK_GEM_T_TAB_LivelloRischioCC] PRIMARY KEY CLUSTERED ([idLivelloRischioCC] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_T_TAB_LivelloRischioCC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_T_TAB_LivelloRischioCC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_T_TAB_LivelloRischioCC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_T_TAB_LivelloRischioCC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_T_TAB_LivelloRischioCC] TO [Metodo98]
    AS [dbo];

