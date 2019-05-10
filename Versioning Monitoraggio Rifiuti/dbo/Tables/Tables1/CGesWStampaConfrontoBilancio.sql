CREATE TABLE [dbo].[CGesWStampaConfrontoBilancio] (
    [NrTerminale] DECIMAL (5)  NOT NULL,
    [Nome]        VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Nome] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWStampaConfrontoBilancio] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWStampaConfrontoBilancio] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWStampaConfrontoBilancio] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWStampaConfrontoBilancio] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWStampaConfrontoBilancio] TO [Metodo98]
    AS [dbo];

