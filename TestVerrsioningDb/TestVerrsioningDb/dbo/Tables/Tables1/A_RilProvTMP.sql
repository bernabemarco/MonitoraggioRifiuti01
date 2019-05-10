CREATE TABLE [dbo].[A_RilProvTMP] (
    [IDSESSIONE]     INT             NOT NULL,
    [PROG]           DECIMAL (10)    IDENTITY (1, 1) NOT NULL,
    [CODAGENTE]      VARCHAR (7)     NULL,
    [DSCAGENTE]      VARCHAR (80)    NULL,
    [RIFCOMMCLI]     VARCHAR (30)    NULL,
    [IdDivisione]    SMALLINT        NULL,
    [TOTPROVDOC]     DECIMAL (19, 4) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [PK_A_RilProvTMP] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [PROG] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[A_RilProvTMP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[A_RilProvTMP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[A_RilProvTMP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[A_RilProvTMP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[A_RilProvTMP] TO [Metodo98]
    AS [dbo];

