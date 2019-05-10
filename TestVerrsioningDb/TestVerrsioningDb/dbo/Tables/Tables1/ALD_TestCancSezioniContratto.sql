CREATE TABLE [dbo].[ALD_TestCancSezioniContratto] (
    [id]               INT          IDENTITY (1, 1) NOT NULL,
    [IDCONTRATTO]      VARCHAR (13) NULL,
    [SEZIONECONTRATTO] DECIMAL (5)  NULL,
    [DescrAzione]      VARCHAR (50) NOT NULL,
    [UTENTEMODIFICA]   VARCHAR (25) NOT NULL,
    [DATAMODIFICA]     DATETIME     NOT NULL,
    [CODDEST]          DECIMAL (5)  CONSTRAINT [DF__ALD_TestC__CODDE__4C1A4C30] DEFAULT ((0)) NULL,
    [idGListinoContr]  DECIMAL (5)  CONSTRAINT [DF__ALD_TestC__idGLi__4D0E7069] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_ALD_TestCancSezioniContratto] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TestCancSezioniContratto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TestCancSezioniContratto] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TestCancSezioniContratto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TestCancSezioniContratto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TestCancSezioniContratto] TO [Metodo98]
    AS [dbo];

