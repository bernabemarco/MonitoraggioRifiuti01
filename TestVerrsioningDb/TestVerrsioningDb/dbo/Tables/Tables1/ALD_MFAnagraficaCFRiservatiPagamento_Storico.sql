CREATE TABLE [dbo].[ALD_MFAnagraficaCFRiservatiPagamento_Storico] (
    [id]                    INT          IDENTITY (1, 1) NOT NULL,
    [CODCONTO]              VARCHAR (7)  NULL,
    [ESERCIZIO]             DECIMAL (5)  NOT NULL,
    [DescrAzioneVariazione] VARCHAR (50) NOT NULL,
    [CODPAG]                VARCHAR (4)  NULL,
    [FlagInserimento]       DECIMAL (5)  DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]        VARCHAR (25) NOT NULL,
    [DATAMODIFICA]          DATETIME     NOT NULL,
    CONSTRAINT [PK_ALD_MFAnagraficaCFRiservatiPagamento_Storico] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_MFAnagraficaCFRiservatiPagamento_Storico] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_MFAnagraficaCFRiservatiPagamento_Storico] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_MFAnagraficaCFRiservatiPagamento_Storico] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_MFAnagraficaCFRiservatiPagamento_Storico] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_MFAnagraficaCFRiservatiPagamento_Storico] TO [Metodo98]
    AS [dbo];

