CREATE TABLE [dbo].[GEMPLUS_TabPosizioniGemmaPlusDetGiroVis] (
    [IDCONTRATTO]      VARCHAR (13)  NOT NULL,
    [SEZIONECONTRATTO] DECIMAL (5)   NOT NULL,
    [POSCLIENTE]       VARCHAR (10)  NOT NULL,
    [IdRiga]           DECIMAL (5)   NOT NULL,
    [IdGiroVisitaGMP]  VARCHAR (10)  NULL,
    [NOTE]             VARCHAR (100) NULL,
    [UTENTEMODIFICA]   VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]     DATETIME      NOT NULL,
    CONSTRAINT [GEMPLUS_TabPosizioniGemmaPlusDetGiroVis_PK] PRIMARY KEY CLUSTERED ([IDCONTRATTO] ASC, [SEZIONECONTRATTO] ASC, [POSCLIENTE] ASC, [IdRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEMPLUS_TabPosizioniGemmaPlusDetGiroVis] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEMPLUS_TabPosizioniGemmaPlusDetGiroVis] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEMPLUS_TabPosizioniGemmaPlusDetGiroVis] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEMPLUS_TabPosizioniGemmaPlusDetGiroVis] TO [Metodo98]
    AS [dbo];

