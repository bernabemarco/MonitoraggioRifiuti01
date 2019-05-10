CREATE TABLE [dbo].[contratticincondpnota] (
    [contratto]      DECIMAL (10) NOT NULL,
    [contributo]     DECIMAL (10) NOT NULL,
    [progressivo]    DECIMAL (10) NOT NULL,
    [riga]           INT          NOT NULL,
    [idtestaregcont] DECIMAL (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([contratto] ASC, [contributo] ASC, [progressivo] ASC, [riga] ASC, [idtestaregcont] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[contratticincondpnota] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[contratticincondpnota] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[contratticincondpnota] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[contratticincondpnota] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[contratticincondpnota] TO [Metodo98]
    AS [dbo];

