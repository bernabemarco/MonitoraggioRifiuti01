CREATE TABLE [dbo].[CGCPWStampaFoglioSchedeODP] (
    [NrTerminale]    DECIMAL (5)  NOT NULL,
    [DesColonna01]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna02]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna03]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna04]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna05]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna06]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna07]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna08]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna09]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna10]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna11]   VARCHAR (20) DEFAULT ('') NULL,
    [DesColonna12]   VARCHAR (20) DEFAULT ('') NULL,
    [DesTitolo]      VARCHAR (80) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPWStampaFoglioSchedeODP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPWStampaFoglioSchedeODP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPWStampaFoglioSchedeODP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPWStampaFoglioSchedeODP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPWStampaFoglioSchedeODP] TO [Metodo98]
    AS [dbo];

