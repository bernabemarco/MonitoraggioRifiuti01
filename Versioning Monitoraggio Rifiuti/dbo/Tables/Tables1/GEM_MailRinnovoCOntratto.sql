CREATE TABLE [dbo].[GEM_MailRinnovoCOntratto] (
    [RecSel]             SMALLINT       DEFAULT ((0)) NULL,
    [Progressivo]        INT            NOT NULL,
    [IDRiga]             INT            NOT NULL,
    [TipoDest]           SMALLINT       NULL,
    [IndirizzoMail]      VARCHAR (255)  NULL,
    [IndirizzoCCInterno] VARCHAR (255)  NULL,
    [IndirizzoCCLegale]  VARCHAR (255)  NULL,
    [Ruolo]              VARCHAR (5)    NULL,
    [IdTestaDoc]         DECIMAL (18)   NULL,
    [IdContratto]        VARCHAR (13)   NULL,
    [PercorsoFile]       VARCHAR (255)  NULL,
    [Stato]              SMALLINT       NULL,
    [DimensioneMaxMsg]   DECIMAL (8, 2) NULL,
    [ConfermaRecapito]   SMALLINT       NULL,
    [ConfermaLettura]    SMALLINT       NULL,
    [IDMail]             INT            NULL,
    [CodCliFor]          VARCHAR (7)    NULL,
    [CodAgente1]         VARCHAR (7)    NULL,
    [UtenteModifica]     VARCHAR (25)   NOT NULL,
    [DataModifica]       VARCHAR (25)   NOT NULL,
    CONSTRAINT [PK_GEM_MailRinnovoCOntratto] PRIMARY KEY CLUSTERED ([Progressivo] ASC, [IDRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_MailRinnovoCOntratto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_MailRinnovoCOntratto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_MailRinnovoCOntratto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_MailRinnovoCOntratto] TO [Metodo98]
    AS [dbo];

