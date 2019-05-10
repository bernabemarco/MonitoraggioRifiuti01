CREATE TABLE [dbo].[TEMPSTAMPAACCESSI] (
    [id]           INT            IDENTITY (1, 1) NOT NULL,
    [sessione]     INT            NOT NULL,
    [pos]          INT            NOT NULL,
    [tipopermesso] NVARCHAR (1)   NOT NULL,
    [idpermesso]   NVARCHAR (50)  NOT NULL,
    [strpermesso]  NVARCHAR (50)  NOT NULL,
    [helpid]       INT            NOT NULL,
    [descrizione]  NVARCHAR (MAX) NOT NULL,
    [accesso]      INT            NOT NULL,
    [accessostr]   NVARCHAR (50)  NOT NULL,
    [ereditato]    NVARCHAR (1)   NOT NULL,
    [Lettura]      BIT            NOT NULL,
    [Scrittura]    BIT            NOT NULL,
    [Modifica]     BIT            NOT NULL,
    [Annulla]      BIT            NOT NULL,
    CONSTRAINT [PK_TEMPSTAMPAACCESSI] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTAMPAACCESSI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTAMPAACCESSI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTAMPAACCESSI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTAMPAACCESSI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTAMPAACCESSI] TO [Metodo98]
    AS [dbo];

