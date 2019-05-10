CREATE TABLE [dbo].[EC_TabCalendariFestiviStatici] (
    [IDCalendario]   DECIMAL (5)   NOT NULL,
    [GiornoFestivo]  DECIMAL (5)   NOT NULL,
    [MeseFestivo]    DECIMAL (5)   NOT NULL,
    [Festivo]        VARCHAR (255) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    CONSTRAINT [PK_EC_TabCalendariFestiviStatici] PRIMARY KEY CLUSTERED ([IDCalendario] ASC, [GiornoFestivo] ASC, [MeseFestivo] ASC),
    CONSTRAINT [FK_EC_TabCalendariFestiviStatici_EC_TabCalendari] FOREIGN KEY ([IDCalendario]) REFERENCES [dbo].[EC_TabCalendari] ([IDCalendario]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_TabCalendariFestiviStatici] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_TabCalendariFestiviStatici] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_TabCalendariFestiviStatici] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_TabCalendariFestiviStatici] TO [Metodo98]
    AS [dbo];

