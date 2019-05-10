CREATE TABLE [dbo].[EC_TabContiCondizioniDinamiche] (
    [IDCC]                  DECIMAL (5)  NOT NULL,
    [IDConto]               VARCHAR (7)  NOT NULL,
    [DataDecorrenza]        DATETIME     NOT NULL,
    [GGValuta]              SMALLINT     NULL,
    [IDCalendario]          DECIMAL (5)  NULL,
    [GGValutaAltroCircuito] SMALLINT     DEFAULT ((0)) NOT NULL,
    [UTENTEMODIFICA]        VARCHAR (25) NOT NULL,
    [DATAMODIFICA]          DATETIME     NOT NULL,
    CONSTRAINT [PK_EC_TabContiCondizioniDinamiche] PRIMARY KEY CLUSTERED ([IDCC] ASC, [IDConto] ASC, [DataDecorrenza] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_TabContiCondizioniDinamiche] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_TabContiCondizioniDinamiche] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_TabContiCondizioniDinamiche] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_TabContiCondizioniDinamiche] TO [Metodo98]
    AS [dbo];

