CREATE TABLE [dbo].[GEM_ContrPFatturazione] (
    [idModFatt]          DECIMAL (5)  NOT NULL,
    [CodiceFatturazione] VARCHAR (50) NULL,
    [UTENTEMODIFICA]     VARCHAR (25) NOT NULL,
    [DATAMODIFICA]       DATETIME     NOT NULL,
    CONSTRAINT [GEM_ContrPFatturazione_PK] PRIMARY KEY CLUSTERED ([idModFatt] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_ContrPFatturazione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_ContrPFatturazione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_ContrPFatturazione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_ContrPFatturazione] TO [Metodo98]
    AS [dbo];

