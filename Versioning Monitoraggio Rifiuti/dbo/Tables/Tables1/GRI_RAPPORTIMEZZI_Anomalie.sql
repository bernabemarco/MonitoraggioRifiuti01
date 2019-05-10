CREATE TABLE [dbo].[GRI_RAPPORTIMEZZI_Anomalie] (
    [IdRapporto]         VARCHAR (14)  NOT NULL,
    [IdRigaMezzo]        DECIMAL (5)   NOT NULL,
    [IdRigaAnomalia]     DECIMAL (5)   NOT NULL,
    [IDCONTRATTO]        VARCHAR (13)  NOT NULL,
    [SEZIONECONTRATTO]   DECIMAL (5)   NOT NULL,
    [idAnomalia]         VARCHAR (5)   NOT NULL,
    [Semaforo]           VARCHAR (50)  NULL,
    [Note]               VARCHAR (900) NULL,
    [idStatoAnomalia]    VARCHAR (1)   CONSTRAINT [DF_GRI_RAPPORTIMEZZI_Anomalie_idStatoAnomalia] DEFAULT ((2)) NULL,
    [DataApertura]       DATETIME      NULL,
    [IdRapportoChiusura] VARCHAR (14)  NULL,
    [DataChiusura]       DATETIME      NULL,
    [Eliminato]          SMALLINT      CONSTRAINT [DF_GRI_RAPPORTIMEZZI_Anomalie_Eliminato] DEFAULT ((0)) NULL,
    [DataEliminazione]   DATETIME      NULL,
    [UTENTEMODIFICA]     VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]       DATETIME      NOT NULL,
    CONSTRAINT [PK_GRI_RAPPORTIMEZZI_Anomalie] PRIMARY KEY CLUSTERED ([IdRapporto] ASC, [IdRigaMezzo] ASC, [IdRigaAnomalia] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_RAPPORTIMEZZI_Anomalie] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_RAPPORTIMEZZI_Anomalie] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_RAPPORTIMEZZI_Anomalie] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_RAPPORTIMEZZI_Anomalie] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_RAPPORTIMEZZI_Anomalie] TO [Metodo98]
    AS [dbo];

