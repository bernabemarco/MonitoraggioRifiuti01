CREATE TABLE [dbo].[GEM_TEMP_STP_AnalisiConsistenze2] (
    [IDCONTRATTO]      VARCHAR (13) NOT NULL,
    [SEZIONECONTRATTO] DECIMAL (5)  NOT NULL,
    [IdRigaMezzo]      DECIMAL (5)  NOT NULL,
    [UTENTEMODIFICA]   VARCHAR (25) NOT NULL,
    [DATAMODIFICA]     DATETIME     NOT NULL,
    CONSTRAINT [GEM_TEMP_STP_AnalisiConsistenze2_PK] PRIMARY KEY CLUSTERED ([IDCONTRATTO] ASC, [SEZIONECONTRATTO] ASC, [IdRigaMezzo] ASC, [UTENTEMODIFICA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_TEMP_STP_AnalisiConsistenze2] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_TEMP_STP_AnalisiConsistenze2] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TEMP_STP_AnalisiConsistenze2] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_TEMP_STP_AnalisiConsistenze2] TO [Metodo98]
    AS [dbo];

