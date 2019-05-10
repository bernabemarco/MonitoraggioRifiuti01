CREATE TABLE [dbo].[CRM_ALD_TabRiffOffertaIdRapportoGemma] (
    [idOffertaCRM]   VARCHAR (100) NOT NULL,
    [idRapporto]     VARCHAR (100) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_ALD_TabRiffOffertaIdRapportoGemma] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_ALD_TabRiffOffertaIdRapportoGemma] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_ALD_TabRiffOffertaIdRapportoGemma] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_ALD_TabRiffOffertaIdRapportoGemma] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_ALD_TabRiffOffertaIdRapportoGemma] TO [Metodo98]
    AS [dbo];

