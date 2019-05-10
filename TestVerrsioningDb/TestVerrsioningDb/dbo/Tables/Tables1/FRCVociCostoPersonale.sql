CREATE TABLE [dbo].[FRCVociCostoPersonale] (
    [Codice]               VARCHAR (20)    NOT NULL,
    [Descrizione]          VARCHAR (100)   DEFAULT ('') NULL,
    [Gruppo]               VARCHAR (1)     DEFAULT ('') NULL,
    [RiferimentoTemporale] VARCHAR (50)    DEFAULT ('') NULL,
    [Divisore]             DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [PercMaggiorazione]    DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Coefficiente]         SMALLINT        DEFAULT ((0)) NULL,
    [Contributi]           SMALLINT        DEFAULT ((0)) NULL,
    [TFR]                  SMALLINT        DEFAULT ((0)) NULL,
    [Note]                 VARCHAR (100)   DEFAULT ('') NULL,
    [UtenteModifica]       VARCHAR (25)    NOT NULL,
    [DataModifica]         DATETIME        NOT NULL,
    [TipoQualifica]        VARCHAR (3)     DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCVociCostoPersonale] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCVociCostoPersonale] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCVociCostoPersonale] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVociCostoPersonale] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCVociCostoPersonale] TO [Metodo98]
    AS [dbo];

