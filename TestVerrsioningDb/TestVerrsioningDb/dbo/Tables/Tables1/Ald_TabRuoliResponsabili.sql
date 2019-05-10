CREATE TABLE [dbo].[Ald_TabRuoliResponsabili] (
    [IdRuoloResp]     VARCHAR (2)  NOT NULL,
    [DscResponsabile] VARCHAR (80) NULL,
    [UTENTEMODIFICA]  VARCHAR (25) NOT NULL,
    [DATAMODIFICA]    DATETIME     NOT NULL,
    CONSTRAINT [PK_Ald_TabRuoliResponsabili] PRIMARY KEY CLUSTERED ([IdRuoloResp] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_TabRuoliResponsabili] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_TabRuoliResponsabili] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Ald_TabRuoliResponsabili] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_TabRuoliResponsabili] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_TabRuoliResponsabili] TO [Metodo98]
    AS [dbo];

