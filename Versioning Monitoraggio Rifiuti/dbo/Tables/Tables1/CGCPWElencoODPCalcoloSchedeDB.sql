CREATE TABLE [dbo].[CGCPWElencoODPCalcoloSchedeDB] (
    [NrTerminale] DECIMAL (5)  NOT NULL,
    [IDTesta]     DECIMAL (10) NOT NULL,
    [IDRiga]      INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [IDTesta] ASC, [IDRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPWElencoODPCalcoloSchedeDB] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPWElencoODPCalcoloSchedeDB] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPWElencoODPCalcoloSchedeDB] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPWElencoODPCalcoloSchedeDB] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPWElencoODPCalcoloSchedeDB] TO [Metodo98]
    AS [dbo];

