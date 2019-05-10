CREATE TABLE [dbo].[GRI_RAPPORTI_MEZZIAllegati] (
    [IDRapporto]      VARCHAR (14)  NOT NULL,
    [IdRigaMezzo]     DECIMAL (5)   NOT NULL,
    [IDRIGAAllegato]  DECIMAL (5)   NOT NULL,
    [DATAINSERIMENTO] DATETIME      NULL,
    [REFERENTE]       VARCHAR (100) NULL,
    [OGGETTO]         VARCHAR (500) NULL,
    [ALLEGATO]        VARCHAR (500) NULL,
    [PublicaGOnLine]  SMALLINT      DEFAULT ((0)) NULL,
    [DocValido]       SMALLINT      DEFAULT ((1)) NULL,
    [DATAMODIFICA]    DATETIME      NULL,
    [UTENTEMODIFICA]  VARCHAR (25)  NULL,
    CONSTRAINT [GRI_RAPPORTI_MEZZIAllegati_PK] PRIMARY KEY CLUSTERED ([IDRapporto] ASC, [IdRigaMezzo] ASC, [IDRIGAAllegato] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_RAPPORTI_MEZZIAllegati] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_RAPPORTI_MEZZIAllegati] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_RAPPORTI_MEZZIAllegati] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_RAPPORTI_MEZZIAllegati] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_RAPPORTI_MEZZIAllegati] TO [Metodo98]
    AS [dbo];

