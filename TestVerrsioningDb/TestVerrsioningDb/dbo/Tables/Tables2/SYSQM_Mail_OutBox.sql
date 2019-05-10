CREATE TABLE [dbo].[SYSQM_Mail_OutBox] (
    [CodModulo]        NVARCHAR (16)  NOT NULL,
    [CodUtente]        NVARCHAR (25)  NULL,
    [Progressivo]      NVARCHAR (13)  NOT NULL,
    [MailID]           NVARCHAR (50)  NULL,
    [MailClass]        NVARCHAR (50)  NULL,
    [MailSubject]      NVARCHAR (255) NULL,
    [MailBody]         NTEXT          NULL,
    [MailTO]           NTEXT          NULL,
    [MailCC]           NTEXT          NULL,
    [MailAttach]       NTEXT          NULL,
    [AllegaDoc]        NVARCHAR (1)   NULL,
    [DataOraCreazione] DATETIME       NULL,
    [ConfLettura]      NVARCHAR (1)   NULL,
    [ConfRecapito]     NVARCHAR (1)   NULL,
    [Importance]       SMALLINT       NULL,
    [Sensitivity]      INT            NULL,
    [VotingOptions]    NVARCHAR (100) NULL,
    [Note]             NTEXT          NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SYSQM_Mail_OutBox] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SYSQM_Mail_OutBox] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SYSQM_Mail_OutBox] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SYSQM_Mail_OutBox] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SYSQM_Mail_OutBox] TO [Metodo98]
    AS [dbo];

