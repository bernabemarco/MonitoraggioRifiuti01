﻿CREATE TABLE [dbo].[GEM_STO_SEZIONECONTRATTORAPPORTI_Materiali] (
    [IDRAPPORTO]           VARCHAR (14)    NOT NULL,
    [IDRIGA]               DECIMAL (5)     NOT NULL,
    [IDCONTRATTO]          VARCHAR (13)    NOT NULL,
    [SEZIONECONTRATTO]     DECIMAL (5)     NOT NULL,
    [IDMATERIALE]          VARCHAR (50)    NOT NULL,
    [PREZZO]               NUMERIC (10, 2) NULL,
    [SCONTO]               NUMERIC (10, 5) NULL,
    [QTA]                  NUMERIC (10, 2) NULL,
    [PROVVIGIONE1]         NUMERIC (18)    NULL,
    [PROVVIGIONE2]         NUMERIC (18)    NULL,
    [PROVVIGIONE3]         NUMERIC (18)    NULL,
    [flg_mat_dafatt]       VARCHAR (1)     DEFAULT ('S') NULL,
    [NoMovimentaMagazzino] VARCHAR (1)     DEFAULT ('N') NULL,
    [UTENTEMODIFICA]       VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]         DATETIME        NOT NULL,
    [CODDEPOSITO]          VARCHAR (10)    NULL,
    [CODUBICAZIONE]        VARCHAR (10)    NULL,
    CONSTRAINT [GEM_STO_SEZIONECONTRATTORAPPORTI_Materiali_PK] PRIMARY KEY CLUSTERED ([IDRAPPORTO] ASC, [IDRIGA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTI_Materiali] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTI_Materiali] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTI_Materiali] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTI_Materiali] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTI_Materiali] TO [Metodo98]
    AS [dbo];
