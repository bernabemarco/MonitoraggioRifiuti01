CREATE TABLE [dbo].[Biri_NoteSezioniExport] (
    [IDCONTRATTO]                    NVARCHAR (255) NULL,
    [SEZIONECONTRATTO]               FLOAT (53)     NULL,
    [NotaDaFile]                     NVARCHAR (MAX) NOT NULL,
    [lunghezzaNotaDaFile]            BIGINT         NULL,
    [IcContrattoAttuale]             VARCHAR (13)   NOT NULL,
    [IDSezioneAttuale]               DECIMAL (5)    NOT NULL,
    [NotaCorrente]                   NTEXT          NULL,
    [LunghezzaNotaCorrente]          INT            NULL,
    [NotaSezionePrecedente]          NTEXT          NULL,
    [LunghezzaNotaSezionePrecedente] INT            NULL
);

