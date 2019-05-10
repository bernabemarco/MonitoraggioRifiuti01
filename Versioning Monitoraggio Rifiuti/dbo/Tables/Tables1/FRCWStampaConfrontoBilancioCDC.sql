CREATE TABLE [dbo].[FRCWStampaConfrontoBilancioCDC] (
    [NrTerminale] DECIMAL (5)  NOT NULL,
    [Nome]        VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Nome] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCWStampaConfrontoBilancioCDC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCWStampaConfrontoBilancioCDC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCWStampaConfrontoBilancioCDC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCWStampaConfrontoBilancioCDC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCWStampaConfrontoBilancioCDC] TO [Metodo98]
    AS [dbo];

