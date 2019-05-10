CREATE TABLE [dbo].[CRM_ALDTabScontiEcommerce] (
    [idALDScontoEcom]  VARCHAR (8)     NOT NULL,
    [DscCRMScontoEcom] VARCHAR (80)    NULL,
    [idAsa]            VARCHAR (2)     NULL,
    [ProvvigioneMedia] DECIMAL (16, 2) DEFAULT ((0)) NOT NULL,
    [ScontoMaxStd]     DECIMAL (16, 2) DEFAULT ((0)) NOT NULL,
    [ScontoMaxCA]      DECIMAL (16, 2) DEFAULT ((0)) NOT NULL,
    [UtenteModifica]   VARCHAR (25)    NOT NULL,
    [DataModifica]     SMALLDATETIME   NOT NULL,
    CONSTRAINT [PK_CRM_ALDTabScontiEcommerce] PRIMARY KEY CLUSTERED ([idALDScontoEcom] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_ALDTabScontiEcommerce] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_ALDTabScontiEcommerce] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_ALDTabScontiEcommerce] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_ALDTabScontiEcommerce] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_ALDTabScontiEcommerce] TO [Metodo98]
    AS [dbo];

