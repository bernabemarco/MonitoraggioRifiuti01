CREATE TABLE [dbo].[GEMPLUS_TabPosizioniGemmaPlusDettCoord] (
    [IDCONTRATTO]       VARCHAR (13)   NOT NULL,
    [SEZIONECONTRATTO]  DECIMAL (5)    NOT NULL,
    [POSCLIENTE]        VARCHAR (10)   NOT NULL,
    [IdRiga]            DECIMAL (5)    NOT NULL,
    [POSCLIENTEQLIK]    VARCHAR (50)   NULL,
    [CodUbicazioneQlik] VARCHAR (50)   NULL,
    [CoordinataX]       DECIMAL (5, 2) NOT NULL,
    [CoordinataY]       DECIMAL (5, 2) NOT NULL,
    [NOTE]              VARCHAR (100)  NULL,
    [UTENTEMODIFICA]    VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]      DATETIME       NOT NULL,
    CONSTRAINT [GEMPLUS_TabPosizioniGemmaPlusDettCoord_PK] PRIMARY KEY CLUSTERED ([IDCONTRATTO] ASC, [SEZIONECONTRATTO] ASC, [POSCLIENTE] ASC, [IdRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEMPLUS_TabPosizioniGemmaPlusDettCoord] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEMPLUS_TabPosizioniGemmaPlusDettCoord] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEMPLUS_TabPosizioniGemmaPlusDettCoord] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEMPLUS_TabPosizioniGemmaPlusDettCoord] TO [Metodo98]
    AS [dbo];

