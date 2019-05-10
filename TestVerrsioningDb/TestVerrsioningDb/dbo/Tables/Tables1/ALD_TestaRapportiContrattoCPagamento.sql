CREATE TABLE [dbo].[ALD_TestaRapportiContrattoCPagamento] (
    [id]               INT          IDENTITY (1, 1) NOT NULL,
    [IDRAPPORTO]       VARCHAR (14) NULL,
    [DescrAzione]      VARCHAR (50) NOT NULL,
    [UTENTEMODIFICA]   VARCHAR (25) NOT NULL,
    [DATAMODIFICA]     DATETIME     NOT NULL,
    [IDCONTRATTO]      VARCHAR (13) NULL,
    [SEZIONECONTRATTO] DECIMAL (5)  NULL,
    [CODPAGAMENTO]     VARCHAR (4)  NULL,
    CONSTRAINT [PK_ALD_TestaRapportiContrattoCPagamento] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TestaRapportiContrattoCPagamento] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TestaRapportiContrattoCPagamento] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TestaRapportiContrattoCPagamento] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TestaRapportiContrattoCPagamento] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TestaRapportiContrattoCPagamento] TO [Metodo98]
    AS [dbo];

