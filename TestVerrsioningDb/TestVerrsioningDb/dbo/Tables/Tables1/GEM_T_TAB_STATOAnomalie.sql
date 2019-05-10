CREATE TABLE [dbo].[GEM_T_TAB_STATOAnomalie] (
    [CODICE]         VARCHAR (1)  NOT NULL,
    [DESCRIZIONE]    VARCHAR (50) NULL,
    [FLGCHIUDI]      SMALLINT     NULL,
    [TIPOAttivita]   VARCHAR (5)  NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_GEM_T_TAB_STATOAnomalie] PRIMARY KEY CLUSTERED ([CODICE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_T_TAB_STATOAnomalie] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_T_TAB_STATOAnomalie] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_T_TAB_STATOAnomalie] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_T_TAB_STATOAnomalie] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_T_TAB_STATOAnomalie] TO [Metodo98]
    AS [dbo];

