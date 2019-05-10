CREATE TABLE [dbo].[ALD_Tab_MacroTipologieAcq] (
    [IdMacroTipologieAcq]   VARCHAR (6)   NOT NULL,
    [DescMacroTipologieAcq] VARCHAR (100) NULL,
    [Dismesso]              INT           NULL,
    [Note]                  VARCHAR (100) NULL,
    [UTENTEMODIFICA]        VARCHAR (25)  NULL,
    [DATAMODIFICA]          DATETIME      NULL,
    CONSTRAINT [PK_ALD_Tab_MacroTipologieAcq] PRIMARY KEY CLUSTERED ([IdMacroTipologieAcq] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_Tab_MacroTipologieAcq] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_Tab_MacroTipologieAcq] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_Tab_MacroTipologieAcq] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Tab_MacroTipologieAcq] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_Tab_MacroTipologieAcq] TO [Metodo98]
    AS [dbo];

