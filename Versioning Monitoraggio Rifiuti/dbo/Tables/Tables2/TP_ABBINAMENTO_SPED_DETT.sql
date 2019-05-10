CREATE TABLE [dbo].[TP_ABBINAMENTO_SPED_DETT] (
    [IDAbbinamento]   NUMERIC (10) NOT NULL,
    [Riga]            INT          NOT NULL,
    [Ultima_Chiamata] DATETIME     NULL,
    [Uscita_Bordero]  DATETIME     NULL,
    [Partenza_Sped]   DATETIME     NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ABBINAMENTO_SPED_DETT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ABBINAMENTO_SPED_DETT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ABBINAMENTO_SPED_DETT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ABBINAMENTO_SPED_DETT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ABBINAMENTO_SPED_DETT] TO [Metodo98]
    AS [dbo];

