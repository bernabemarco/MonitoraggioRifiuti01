CREATE TABLE [dbo].[GRI_RAPPORTI_MEZZIChecklist] (
    [IDRAPPORTO]         VARCHAR (14)  NOT NULL,
    [IdRigaMezzo]        DECIMAL (5)   NOT NULL,
    [IdRigaCL]           DECIMAL (5)   NOT NULL,
    [Valore_0_NC]        SMALLINT      DEFAULT ((0)) NOT NULL,
    [Valore_1_C]         SMALLINT      DEFAULT ((0)) NOT NULL,
    [Valore_2_NE]        SMALLINT      DEFAULT ((0)) NOT NULL,
    [Valore_3_NA]        SMALLINT      DEFAULT ((0)) NOT NULL,
    [Ordine]             DECIMAL (5)   NOT NULL,
    [Esito]              SMALLINT      NULL,
    [ValoreRilevazione]  VARCHAR (30)  NULL,
    [AnnotazioneTecnica] VARCHAR (900) NULL,
    [UTENTEMODIFICA]     VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]       DATETIME      NOT NULL,
    CONSTRAINT [GRI_RAPPORTI_MEZZIChecklist_PK] PRIMARY KEY CLUSTERED ([IDRAPPORTO] ASC, [IdRigaMezzo] ASC, [IdRigaCL] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_RAPPORTI_MEZZIChecklist] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_RAPPORTI_MEZZIChecklist] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_RAPPORTI_MEZZIChecklist] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_RAPPORTI_MEZZIChecklist] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_RAPPORTI_MEZZIChecklist] TO [Metodo98]
    AS [dbo];

