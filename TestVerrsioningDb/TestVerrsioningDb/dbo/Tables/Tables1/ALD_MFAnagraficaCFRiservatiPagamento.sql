CREATE TABLE [dbo].[ALD_MFAnagraficaCFRiservatiPagamento] (
    [id]                    INT          IDENTITY (1, 1) NOT NULL,
    [CODCONTO]              VARCHAR (7)  NULL,
    [ESERCIZIO]             DECIMAL (5)  NOT NULL,
    [DescrAzioneVariazione] VARCHAR (50) NOT NULL,
    [CODPAG]                VARCHAR (4)  NULL,
    [FlagInserimento]       DECIMAL (5)  CONSTRAINT [DF__ALD_MFAna__FlagI__5D79E25C] DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]        VARCHAR (25) NOT NULL,
    [DATAMODIFICA]          DATETIME     NOT NULL,
    CONSTRAINT [PK_ALD_MFAnagraficaCFRiservatiPagamento] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20150611-091823]
    ON [dbo].[ALD_MFAnagraficaCFRiservatiPagamento]([DATAMODIFICA] ASC);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20150611-091917]
    ON [dbo].[ALD_MFAnagraficaCFRiservatiPagamento]([UTENTEMODIFICA] ASC);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_MFAnagraficaCFRiservatiPagamento] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_MFAnagraficaCFRiservatiPagamento] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_MFAnagraficaCFRiservatiPagamento] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_MFAnagraficaCFRiservatiPagamento] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_MFAnagraficaCFRiservatiPagamento] TO [Metodo98]
    AS [dbo];

