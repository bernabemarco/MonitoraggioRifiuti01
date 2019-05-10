CREATE TABLE [dbo].[EC_TabCalendariFestiviDinamici] (
    [IDCalendario]   DECIMAL (5)   NOT NULL,
    [DataFestivo]    DATETIME      NOT NULL,
    [Festivo]        VARCHAR (255) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    CONSTRAINT [PK_EC_TabCalendariFestiviDinamici] PRIMARY KEY CLUSTERED ([IDCalendario] ASC, [DataFestivo] ASC),
    CONSTRAINT [FK_EC_TabCalendariFestiviDinamici_EC_TabCalendari] FOREIGN KEY ([IDCalendario]) REFERENCES [dbo].[EC_TabCalendari] ([IDCalendario]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_TabCalendariFestiviDinamici] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_TabCalendariFestiviDinamici] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_TabCalendariFestiviDinamici] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_TabCalendariFestiviDinamici] TO [Metodo98]
    AS [dbo];

