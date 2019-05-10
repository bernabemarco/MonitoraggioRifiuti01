CREATE TABLE [dbo].[TP_EXTRACLIENTI] (
    [CODCONTO]               VARCHAR (7)  NOT NULL,
    [UTENTEMODIFICA]         VARCHAR (25) NOT NULL,
    [DATAMODIFICA]           DATETIME     NOT NULL,
    [TP_AccettaAlter]        CHAR (1)     NULL,
    [TP_Fascia_Cont]         INT          NULL,
    [TP_MesiMov]             SMALLINT     NULL,
    [RelArtCli_GrAttiva]     SMALLINT     DEFAULT ((0)) NULL,
    [RelArtCli_VerificaInGr] SMALLINT     DEFAULT ((0)) NULL,
    [RelArtCli_GrBloccata]   SMALLINT     DEFAULT ((0)) NULL,
    [RelArtCli_CrAutomatica] SMALLINT     DEFAULT ((0)) NULL,
    [MISS_EvasTotOrdini]     SMALLINT     DEFAULT ((0)) NULL,
    [MISS_EvasUnicoLotto]    SMALLINT     DEFAULT ((0)) NULL,
    [GESTROTSTAG]            SMALLINT     DEFAULT ((0)) NULL,
    [DISABGSTSCNTLOG]        SMALLINT     DEFAULT ((0)) NULL,
    [NrListinoKit]           DECIMAL (5)  DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TP_EXTRACLIENTI] PRIMARY KEY CLUSTERED ([CODCONTO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_TP_EXTRACLIENTI_CODCONTO] FOREIGN KEY ([CODCONTO]) REFERENCES [dbo].[ANAGRAFICACF] ([CODCONTO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_EXTRACLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_EXTRACLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_EXTRACLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_EXTRACLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_EXTRACLIENTI] TO [Metodo98]
    AS [dbo];

