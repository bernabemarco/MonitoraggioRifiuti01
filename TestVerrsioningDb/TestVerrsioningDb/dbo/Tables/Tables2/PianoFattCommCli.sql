CREATE TABLE [dbo].[PianoFattCommCli] (
    [RifProgressivo]    DECIMAL (10)    NOT NULL,
    [NumRiga]           SMALLINT        NOT NULL,
    [CodPag]            VARCHAR (4)     NULL,
    [DataPrevFatt]      DATETIME        NULL,
    [ImportoRata]       DECIMAL (19, 6) CONSTRAINT [DF__PianoFatt__Impor__36E6F7C4] DEFAULT (0) NULL,
    [EventoCond]        VARCHAR (80)    NULL,
    [StatoFatturazione] SMALLINT        CONSTRAINT [DF__PianoFatt__Stato__37DB1BFD] DEFAULT (0) NULL,
    [ValOfferta]        DECIMAL (13, 6) CONSTRAINT [DF__PianoFatt__ValOf__39C3646F] DEFAULT (1) NULL,
    [ValFormale]        DECIMAL (13, 6) CONSTRAINT [DF__PianoFatt__ValFo__3AB788A8] DEFAULT (1) NULL,
    [IDTestaDocEmFatt]  NUMERIC (10)    NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    [CODDIVISA]         NUMERIC (5)     CONSTRAINT [DF__PIANOFATT__CODDI__7EA369F8] DEFAULT (0) NULL,
    CONSTRAINT [PianoFattCommCli_PK] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [NumRiga] ASC),
    CONSTRAINT [FK_PIANOFATTCOMMCLI_RIFPROGRESSIVO] FOREIGN KEY ([RifProgressivo]) REFERENCES [dbo].[AnagraficaCommesse] ([Progressivo]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PianoFattCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PianoFattCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PianoFattCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PianoFattCommCli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PianoFattCommCli] TO [Metodo98]
    AS [dbo];

