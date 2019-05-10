CREATE TABLE [dbo].[CGesWStampaConfrontoAnalisiIndividuale] (
    [NrTerminale] DECIMAL (5)  NOT NULL,
    [Nome]        VARCHAR (50) NOT NULL,
    [TipoReport]  SMALLINT     DEFAULT (0) NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Nome] ASC, [TipoReport] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWStampaConfrontoAnalisiIndividuale] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWStampaConfrontoAnalisiIndividuale] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWStampaConfrontoAnalisiIndividuale] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWStampaConfrontoAnalisiIndividuale] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWStampaConfrontoAnalisiIndividuale] TO [Metodo98]
    AS [dbo];

