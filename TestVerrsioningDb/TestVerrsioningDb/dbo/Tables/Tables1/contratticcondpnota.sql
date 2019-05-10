CREATE TABLE [dbo].[contratticcondpnota] (
    [contratto]      DECIMAL (10) NOT NULL,
    [contributo]     DECIMAL (10) NOT NULL,
    [idtestaregcont] DECIMAL (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([contratto] ASC, [contributo] ASC, [idtestaregcont] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[contratticcondpnota] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[contratticcondpnota] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[contratticcondpnota] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[contratticcondpnota] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[contratticcondpnota] TO [Metodo98]
    AS [dbo];

