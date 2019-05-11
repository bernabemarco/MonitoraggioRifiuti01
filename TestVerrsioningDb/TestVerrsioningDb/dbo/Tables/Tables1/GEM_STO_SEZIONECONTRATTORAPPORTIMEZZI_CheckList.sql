﻿CREATE TABLE [dbo].[GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI_CheckList] (
    [IDCONTRATTO]        VARCHAR (13)  NOT NULL,
    [SEZIONECONTRATTO]   DECIMAL (5)   NOT NULL,
    [IDRAPPORTO]         VARCHAR (14)  NOT NULL,
    [IdRigaMezzo]        DECIMAL (5)   NOT NULL,
    [IdRigaCL]           DECIMAL (5)   NOT NULL,
    [Valore_0_NC]        SMALLINT      DEFAULT ((0)) NOT NULL,
    [Valore_1_C]         SMALLINT      DEFAULT ((0)) NOT NULL,
    [Valore_2_NE]        SMALLINT      DEFAULT ((0)) NOT NULL,
    [Valore_3_NA]        SMALLINT      DEFAULT ((0)) NOT NULL,
    [Ordine]             DECIMAL (5)   NOT NULL,
    [Esito]              SMALLINT      NULL,
    [AnnotazioneTecnica] VARCHAR (900) NULL,
    [UTENTEMODIFICA]     VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]       DATETIME      NOT NULL,
    CONSTRAINT [GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI_CheckList_PK] PRIMARY KEY CLUSTERED ([IDCONTRATTO] ASC, [SEZIONECONTRATTO] ASC, [IDRAPPORTO] ASC, [IdRigaMezzo] ASC, [IdRigaCL] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI_CheckList] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI_CheckList] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI_CheckList] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI_CheckList] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTIMEZZI_CheckList] TO [Metodo98]
    AS [dbo];
