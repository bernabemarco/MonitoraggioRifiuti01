CREATE TABLE [dbo].[EC_TabCalendari] (
    [IDCalendario]                DECIMAL (5)   NOT NULL,
    [Calendario]                  VARCHAR (255) NULL,
    [Abbrev]                      VARCHAR (255) NULL,
    [LunediFestivo]               SMALLINT      NOT NULL,
    [MartediFestivo]              SMALLINT      NOT NULL,
    [MercolediFestivo]            SMALLINT      NOT NULL,
    [GiovediFestivo]              SMALLINT      NOT NULL,
    [VenerdiFestivo]              SMALLINT      NOT NULL,
    [SabatoFestivo]               SMALLINT      NOT NULL,
    [DomenicaFestivo]             SMALLINT      NOT NULL,
    [CapodannoFestivo]            SMALLINT      NOT NULL,
    [EpifaniaFestivo]             SMALLINT      NOT NULL,
    [LiberazioneFestivo]          SMALLINT      NOT NULL,
    [LavoratoriFestivo]           SMALLINT      NOT NULL,
    [AssunzioneFestivo]           SMALLINT      NOT NULL,
    [TuttiISantiFestivo]          SMALLINT      NOT NULL,
    [ImmacolataConcezioneFestivo] SMALLINT      NOT NULL,
    [NataleFestivo]               SMALLINT      NOT NULL,
    [SantoStefanoFestivo]         SMALLINT      NOT NULL,
    [UTENTEMODIFICA]              VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]                DATETIME      NOT NULL,
    CONSTRAINT [PK_EC_TabCalendari] PRIMARY KEY CLUSTERED ([IDCalendario] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_TabCalendari] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_TabCalendari] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_TabCalendari] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_TabCalendari] TO [Metodo98]
    AS [dbo];

